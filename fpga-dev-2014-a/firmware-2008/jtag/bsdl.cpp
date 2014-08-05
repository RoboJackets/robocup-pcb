#include <stdio.h>
#include <list>
#include <iostream>
#include <fstream>
#include <antlr/CharInputBuffer.hpp>

#include "bsdl.h"
#include "part.h"
#include "BSDL_Lexer.hpp"
#include "BSDL_Parser.hpp"

using namespace std;

void bsdl_load(const char *filename, JTAG::Part_Info *part)
{
    ifstream stream(filename);
    BSDL_Lexer lexer(stream);
    BSDL_Parser parser(lexer);
    
    parser.file(part);
}

Masked_Value parse_masked_value(const string &str)
{
	Masked_Value value;
	
	string::size_type size = str.size();
	if (size > 32)
		size = 32;
	
	for (string::size_type i = 0; i < size; i++)
	{
		switch (str[size - 1 - i])
		{
			case '1':
				value.value |= 1 << i;
				// Fall through
			case '0':
				value.mask |= 1 << i;
				break;
			// All other characters are don't-care
		}
	}
	
	return value;
}

void BSDL_Parser::handle_attribute(const std::string &name, const std::string &entity, Entity_Class ec, Value &value)
{
	if (name == "INSTRUCTION_LENGTH")
	{
		// Length of IR
		if (part->name != entity)
			throw antlr::SemanticException("INSTRUCTION_LENGTH must be an attribute of the entity in which it appears");
		
		if (ec != EC_Entity)
			throw antlr::SemanticException("INSTRUCTION_LENGTH must be an attribute of an entity");
		
		if (value.type != Value::Int)
			throw antlr::SemanticException("INSTRUCTION_LENGTH must be an integer");
		
		if (part)
            part->ir_length = value.ival;
	} else if (name == "INSTRUCTION_OPCODE")
	{
		// Opcode map
		if (value.type != Value::String)
			throw antlr::SemanticException("INSTRUCTION_OPCODE must be a string");
		
        //FIXME - Should be doing this with a lexer mux
		antlr::CharInputBuffer buf((unsigned char *)value.str.c_str(), value.str.size());
		BSDL_Lexer lexer(buf);
		BSDL_Parser parser(lexer);
		parser.opcode_list(part);
	} else if (name == "IDCODE_REGISTER")
	{
		// IDCODE value and mask
		if (value.type != Value::String || value.str.size() != 32 || value.str.find_first_not_of("01Xx") < value.str.size())
			throw antlr::SemanticException("IDCODE_REGISTER must be a 32-character string consisting of 0, 1, X, x");
		
        if (part)
		  part->idcode = parse_masked_value(value.str);
	}
}
