#INC = -I/home/xmeng/dyninstapi/install/include -I/home/xmeng/capstone/install/include
INC = -I/home/liuweijie/dyninst4sgxminidep/dyninst-install/include -I/home/liuweijie/capstone/install-x86/include
#LIB = -L/home/xmeng/dyninstapi/install/lib -L/home/xmeng/capstone/install-x86/lib64
LIB = -L/home/liuweijie/dyninst4sgxminidep/dyninst-install/lib -L/home/liuweijie/capstone/install-x86/lib
#STATIC_LIB = -L/home/xmeng/dyninstapi/install/lib -L/home/xmeng/zlib-1.2.11 -L/home/xmeng/capstone/install-x86/lib64
STATIC_LIB = -L./staticLibs
#STATIC_LIB = -L/home/liuweijie/dyninst4sgxminidep/dyninst-build/elfutils/lib -L/home/liuweijie/capstone/install-x86/lib

checker: checker.c
	cc $(INC) $(LIB) -o checker checker.c -lelf -lcapstone

checker-static: checker.c
	cc -O2 -static $(INC) $(STATIC_LIB) checker.c -o checker-static -lelf_static -lz_static -lcapstone_static -lc_static

clean:
	rm -rf checker checker-static
