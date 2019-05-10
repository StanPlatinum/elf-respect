
CFLAGS = -g -O2 -std=c++11

<<<<<<< HEAD
<<<<<<< HEAD
DYNINST_ROOT = /home/weijliu/dyninst4checker/dyninst-install
DYNINST_BUILD_DIR = /home/weijliu/dyninst4checker/dyninst-build

DYNINST_LIB = $(DYNINST_ROOT)/lib
DYNINST_INC = $(DYNINST_ROOT)/include

TBB_INC = $(DYNINST_BUILD_DIR)/tbb/include

TBB_LIB_STATIC = /home/weijliu/tbb-2018_U6/build/linux_intel64_gcc_cc5.4.0_libc2.23_kernel4.4.0_release

ELFUTIL_LIB = $(DYNINST_BUILD_DIR)/elfutils/lib

INC = -I$(DYNINST_INC) -I$(TBB_INC)
LIB = -L$(DYNINST_LIB) -L$(ELFUTIL_LIB) -L$(TBB_LIB_STATIC)
DEP = -ldyninstAPI -lparseAPI -linstructionAPI -lsymtabAPI -lelf -ldynDwarf -ldw -ldynElf -lcommon -lboost_system

CFLAGS_STATIC = -O2 -std=c++11 -static

=======
DYNINST_ROOT = /home/liuweijie/dyninst4sgx/dyninst-install
DYNINST_BUILD_DIR = /home/liuweijie/dyninst4sgx/dyninst-build

DYNINST_LIB = $(DYNINST_ROOT)/lib
DYNINST_INC = $(DYNINST_ROOT)/include

ELFUTIL_LIB = $(DYNINST_BUILD_DIR)/elfutils/lib

INC = -I$(DYNINST_INC)
LIB = -L$(DYNINST_LIB) -L$(ELFUTIL_LIB)
DEP = -ldyninstAPI -lparseAPI -linstructionAPI -lsymtabAPI -lelf -ldynDwarf -ldw -ldynElf -lcommon -lboost_system

CFLAGS_STATIC = -O2 -std=c++11 -static
>>>>>>> 82849b4ab3c621863f4a8f581bc51e73e6f6807a
=======
DYNINST_ROOT = /home/liuweijie/dyninst4sgx/dyninst-install
DYNINST_BUILD_DIR = /home/liuweijie/dyninst4sgx/dyninst-build

DYNINST_LIB = $(DYNINST_ROOT)/lib
DYNINST_INC = $(DYNINST_ROOT)/include

ELFUTIL_LIB = $(DYNINST_BUILD_DIR)/elfutils/lib

INC = -I$(DYNINST_INC)
LIB = -L$(DYNINST_LIB) -L$(ELFUTIL_LIB)
DEP = -ldyninstAPI -lparseAPI -linstructionAPI -lsymtabAPI -lelf -ldynDwarf -ldw -ldynElf -lcommon -lboost_system

CFLAGS_STATIC = -O2 -std=c++11 -static
>>>>>>> 82849b4ab3c621863f4a8f581bc51e73e6f6807a
DEP_STATIC = -lparseAPI_static -linstructionAPI_static -lcommon_static -ldynElf_static -ldynDwarf_static -lsymtabAPI_static -lboost_system -lboost_filesystem -ldw -lelf -lebl -ldl -lpthread -lz -ltbb -ltbbmalloc

test_dynamic: test_dynamic.c
	gcc test_dynamic.c -o test_dynamic

modify: modify.cpp
	g++ $(CFLAGS) $(INC) $(LIB) modify.cpp -o modify $(DEP)

inst_mem: inst_mem.cpp
	g++ $(CFLAGS) $(INC) $(LIB) inst_mem.cpp -o inst_mem $(DEP)

parse: parse.cpp
	g++ $(CFLAGS) $(INC) $(LIB) parse.cpp -o parse $(DEP)

parse-static: parse.cpp
	g++ $(CFLAGS_STATIC) $(INC) $(LIB) parse.cpp -o parse-static -Wl,--start-group $(DEP_STATIC) -Wl,--end-group

clean:
<<<<<<< HEAD
<<<<<<< HEAD
	rm -f *.o modify test_dynamic inst_mem parse parse-static
=======
	rm -f *.o modify test_dynamic inst_mem
>>>>>>> 82849b4ab3c621863f4a8f581bc51e73e6f6807a
=======
	rm -f *.o modify test_dynamic inst_mem
>>>>>>> 82849b4ab3c621863f4a8f581bc51e73e6f6807a
