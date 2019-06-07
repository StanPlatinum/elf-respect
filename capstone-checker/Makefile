INC = -I/home/xmeng/dyninstapi/install/include -I/home/xmeng/capstone/install/include
LIB = -L/home/xmeng/dyninstapi/install/lib -L/home/xmeng/capstone/install-x86/lib64
STATIC_LIB = -L/home/xmeng/dyninstapi/install/lib -L/home/xmeng/zlib-1.2.11 -L/home/xmeng/capstone/install-x86/lib64

checker: checker.c
	cc $(INC) $(LIB) -o checker checker.c -lelf -lcapstone

checker-static: checker.c
	cc -O2 -static $(INC) $(STATIC_LIB) checker.c -o checker-static -lelf -lz -lcapstone
