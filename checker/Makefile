
CFLAGS = -g -O2 -std=c++11

DYNINST_ROOT = /home/liuweijie/dyninst4sgx/dyninst-install
DYNINST_BUILD_DIR = /home/liuweijie/dyninst4sgx/dyninst-build

DYNINST_LIB = $(DYNINST_ROOT)/lib
DYNINST_INC = $(DYNINST_ROOT)/include

ELFUTIL_LIB = $(DYNINST_BUILD_DIR)/elfutils/lib

INC = -I$(DYNINST_INC)
LIB = -L$(DYNINST_LIB) -L$(ELFUTIL_LIB)
DEP = -ldyninstAPI -lparseAPI -linstructionAPI -lsymtabAPI -lelf -ldynDwarf -ldw -ldynElf -lcommon -lboost_system

parse: parse.cpp
	g++ $(CFLAGS) $(INC) $(LIB) parse.cpp -o parse $(DEP)

clean:
	rm -f *.o parse
