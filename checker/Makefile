
CFLAGS = -g -O2 -std=c++11

INC = -I./include

LIB = -L./lib

DEP = -ldyninstAPI -lparseAPI -linstructionAPI -lsymtabAPI -lelf -ldynDwarf -ldw -ldynElf -lcommon -lboost_system

DEP_STATIC = -ldyninstAPI_static -lparseAPI_static -linstructionAPI_static -lsymtabAPI_static -ldynElf_static 

parse: parse.cpp
	g++ $(CFLAGS) $(INC) $(LIB) parse.cpp -o parse $(DEP_STATIC)

clean:
	rm -f *.o parse
