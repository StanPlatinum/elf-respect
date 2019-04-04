
CFLAGS = -g -O2 -std=c++11

DYNINST_ROOT = /home/liuweijie/dyninst
DYNINST_BUILD_DIR = $(DYNINST_ROOT)

DYNINST_API = $(DYNINST_ROOT)/dyninstAPI
TBB_INCLUDE = $(DYNINST_ROOT)/tbb
ELFUTIL_LIB = $(DYNINST_BUILD_DIR)/elfutils/lib

INC = -I$(DYNINST_API)/h -I$(TBB_INCLUDE)
LIB = -L$(DYNINST_API)/lib -L$(ELFUTIL_LIB)
DEP = -ldyninstAPI -lparseAPI -linstructionAPI -lsymtabAPI -lelf -ldynDwarf -ldw -ldynElf -lcommon -lboost_system

modify: modify.cpp
	g++ $(CFLAGS) $(INC) $(LIB) modify.cpp -o modify $(DEP)

clean:
	rm -f *.o modify test_dynamic
