header "post_include_hpp"
{
#include <list>

namespace JTAG
{
    class Part_Info;
};
}

header "post_include_cpp"
{
#include <stdlib.h>

#include "part.h"
}

options
{
    language = "Cpp";
    namespaceStd = "std";
    namespaceAntlr = "antlr";
}

///////////////////////////////////////////////////////////
// Lexer

class BSDL_Lexer extends Lexer;
options
{
    testLiterals = false;
    caseSensitiveLiterals = false;
    charVocabulary = '\0'..'\377';
    
    // This is needed to distinguish between Assignment and Colon.
    k = 2;
}

protected EOL: ('\n' { newline(); } | '\r');
protected Digit: ('0'..'9');

Comment:       "--" (~('\n' | '\r'))* (EOL)*
    { $setType(antlr::Token::SKIP); };

Whitespace:    (' ' | '\t' | EOL)
    { $setType(antlr::Token::SKIP); };

ID options { testLiterals = true; }:
    ('a'..'z' | 'A'..'Z') ('a'..'z' | 'A'..'Z' | '0'..'9' | '_')*;

Assignment:    ":=";
Colon:         ':';
Semicolon:     ';';
Open_Paren:    '(';
Close_Paren:   ')';
Concat:        '&';
Dot:           '.';
Comma:         ',';
Minus:         '-';

String:        '"'! (~'"')* '"'!;
Integer:       (Digit)+;
Float_Frac:    Dot Integer (('e' | 'E') ('-' | '+')? Integer)?;

///////////////////////////////////////////////////////////
// Parser

class BSDL_Parser extends Parser;
{
    typedef enum
    {
        EC_Unknown,
        EC_Entity,
        EC_Signal
    } Entity_Class;
    
    class Clock_Info
    {
    public:
        Clock_Info(): freq(0), level(false) {}
        
        float freq;
        bool level;
    };
    
    class Value
    {
    public:
        typedef enum
        {
            Unknown,
            String,
            ID,
            Int,
            Float,
            Clock_Info
        } Type;
        
        Value() { type = Unknown; ival = 0; fval = 0; }
        
        Type type;
        
        // String, ID
        std::string str;
        
        // Int
        int ival;
        
        // Float
        float fval;
        
        // Clock_Info
        BSDL_Parser::Clock_Info clock_info;
    };

    void handle_attribute(const std::string &name, const std::string &entity, Entity_Class ec, Value &value);
    
    JTAG::Part_Info *part;
}

////////
// The root expression for a file
////////

file [JTAG::Part_Info *part]
    { this->part = part; }
    : entity_decl EOF
    ;

entity_decl
    : "entity" id1:ID "is"
    { part->name = id1->getText(); }
    (decl)* "end" id2:ID Semicolon
    { id1->getText() == id2->getText() }?
    ;

////////
// Declarations inside entity
////////

decl
    : (use_decl | generic_decl | port_decl | constant_decl | attribute_decl) Semicolon
    ;

use_decl
    { std::string pkg; }
    : "use" pkg=package_name
    ;
package_name returns [std::string str]
    : first:ID {str = first->getText();} (Dot more:ID {str += "." + more->getText();} )*
    ;

generic_decl
    { Value v; }
    : "generic" Open_Paren ID Colon generic_type Assignment v=value Close_Paren
    ;
generic_type
    : "string"
    ;

port_decl
    : "port" Open_Paren pin_decl (Semicolon pin_decl)* Close_Paren
    ;
pin_decl
    : ID Colon pin_bits
    ;
pin_bits
    : ("in" | "out" | "inout" | "linkage") ("bit" | bit_vector)
    ;
bit_vector
    : "bit_vector" Open_Paren Integer "to" Integer Close_Paren
    ;


constant_decl
    { Value v; }
    : "constant" name:ID Colon type:ID Assignment v=value
    ;

attribute_decl
    { Entity_Class ec; Value v; }
    : "attribute" name:ID "of" entity:ID Colon ec=entity_class "is" v=value
    { handle_attribute(name->getText(), entity->getText(), ec, v); }
    ;
entity_class returns [BSDL_Parser::Entity_Class ec = EC_Unknown]
    : ("entity" { ec = EC_Entity; } | "signal" { ec = EC_Signal; } )
    ;

////////
// Value whose type is determined at runtime
////////

value returns [BSDL_Parser::Value v]
    { std::string str; int ival; Clock_Info info; }
    : str=string_value
    { v.type = Value::String; v.str = str; }
    | ID
    { v.type = Value::ID; v.str = str; }
    | ival=int_value
    { v.type = Value::Int; v.ival = ival; }
    | info=clock_info
    { v.type = Value::Clock_Info; v.clock_info = info; }
    ;

clock_info returns [BSDL_Parser::Clock_Info info]
    { float freq = 0; bool level = false; }
    : Open_Paren freq=float_value Comma level=clock_level Close_Paren
    { info.freq = freq; info.level = level; }
    ;

clock_level returns [bool level = false]
    : ("low" {level = false;} | "both" {level = true;} )
    ;
    
int_value returns [int value = 0]
    : (sign:Minus)? itext:Integer
    {   std::string str;
        if (sign)
            str = sign->getText();
        value = atoi((str + itext->getText()).c_str());
    }
    ;

float_value returns [float value = 0]
    : (sign:Minus)? (ipart:Integer)? fpart:Float_Frac
    {   std::string str;
        if (sign)
            str += sign->getText();
        if (ipart)
            str += ipart->getText();
        if (fpart)
            str += fpart->getText();
        value = atof(str.c_str());
    }
    ;

string_value returns [std::string str]
    : first:String {str = first->getText();}
      (Concat more:String {str += more->getText();})*
    ;

// Root rules for string attribute parsers are below

////////
// Instruction opcode list
////////

opcode_list [JTAG::Part_Info *part]
    { this->part = part; }
    : opcode (Comma opcode)*
    ;

opcode
    : name:ID Open_Paren op:Integer Close_Paren
    {   const std::string &str = op->getText();
        if (str.find_first_not_of("01") < str.size())
            throw antlr::SemanticException("Binary literal may only contain 0 and 1");
        
        JTAG::Instruction *instr = new JTAG::Instruction();
        instr->name = name->getText();
        instr->instr = bit_string(str);
        part->opcodes[instr->name] = instr;
    }
    ;

////////
// Instruction list
////////

instr_list returns [std::list<std::string> instrs]
    : first:ID
    { instrs.push_back(first->getText()); }
    (Comma more:ID { instrs.push_back(more->getText()); } )*
    ;
