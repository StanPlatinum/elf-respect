# obsoleted

CFLAGS = -g -O2 -std=c++11

INC = -I./include

LIB = -L./lib-static

CFLAGS_STATIC = -O2 -std=c++11 -static
DEP_STATIC = -lparseAPI_static -linstructionAPI_static -lcommon_static -ldynElf_static -ldynDwarf_static -lsymtabAPI_static -lboost_system -lboost_filesystem -ldw -lelf -lebl -ldl -lpthread -lz -ltbb -ltbbmalloc

parse-static: parse.cpp
	g++ $(CFLAGS_STATIC) $(INC) $(LIB) parse.cpp -o parse $(DEP_STATIC)

clean:
	rm -f *.o parse-static

