
CFLAGS = -g -O2 -std=c++11

INC = -I./include

<<<<<<< HEAD
LIB = -L./lib-static
=======
LIB = -L./lib

DEP = -ldyninstAPI -lparseAPI -linstructionAPI -lsymtabAPI -lelf -ldynDwarf -ldw -ldynElf -lcommon -lboost_system
>>>>>>> 82849b4ab3c621863f4a8f581bc51e73e6f6807a

CFLAGS_STATIC = -O2 -std=c++11 -static
DEP_STATIC = -lparseAPI_static -linstructionAPI_static -lcommon_static -ldynElf_static -ldynDwarf_static -lsymtabAPI_static -lboost_system -lboost_filesystem -ldw -lelf -lebl -ldl -lpthread -lz -ltbb -ltbbmalloc

<<<<<<< HEAD
parse-static: parse.cpp
	g++ $(CFLAGS_STATIC) $(INC) $(LIB) parse.cpp -o parse $(DEP_STATIC)

clean:
	rm -f *.o parse-static
=======
parse: parse.cpp
	g++ $(CFLAGS_STATIC) $(INC) $(LIB) parse.cpp -o parse $(DEP_STATIC)

clean:
	rm -f *.o parse
>>>>>>> 82849b4ab3c621863f4a8f581bc51e73e6f6807a
