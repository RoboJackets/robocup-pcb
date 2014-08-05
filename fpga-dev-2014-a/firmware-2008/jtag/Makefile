CXX=g++
CC=gcc
CFLAGS=-O3 -g3 -Wall
CPPFLAGS=$(CFLAGS)
LDFLAGS=-g3 -lboost_filesystem -lusb -lftdi

TARGETS=xilinx stress_test spi chain_test
BSDL_SRCS=BSDL_Lexer.cpp BSDL_Lexer.hpp BSDL_LexerTokenTypes.hpp BSDL_LexerTokenTypes.txt BSDL_Parser.cpp BSDL_Parser.hpp
OBJS=hw.o dlc5.o exceptions.o states.o part.o chain.o state_paths.o bit_string.o part_cache.o \
	bsdl.o BSDL_Lexer.o BSDL_Parser.o \
	xilinx_bitstream.o xsvf_interpreter.o bit_rev.o \
	xusb.o ft2232.o arm7tdmi.o
LDLIBS=-lantlr

.PHONY: all clean parser

all:		$(TARGETS)

clean:
		rm -f $(TARGETS) $(OBJS) $(BSDL_SRCS)

parser: bsdl.g
		cantlr.sh $<

$(TARGETS): $(OBJS)

$(BSDL_SRCS): parser
bsdl.o: BSDL_Lexer.hpp BSDL_Parser.hpp
