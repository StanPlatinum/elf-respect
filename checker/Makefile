
CFLAGS = -g -O2 -std=c++11

INC = -I./include

LIB = -L./lib

DEP = -ldyninstAPI -lparseAPI -linstructionAPI -lsymtabAPI -lelf -ldynDwarf -ldw -ldynElf -lcommon -lboost_system

parse: parse.cpp
	g++ $(CFLAGS) $(INC) $(LIB) parse.cpp -o parse $(DEP)

clean:
	rm -f *.o parse
