#ifndef _BSDL_H_
#define _BSDL_H_

#include <antlr/ANTLRException.hpp>
#include <string>

namespace JTAG
{
    class Part_Info;
};

void bsdl_load(const char *filename, JTAG::Part_Info *part);

#endif // _BSDL_H_
