#CXX = clang++
#CXX = g++

objects = nw.o

STATIC_LIB_PATH=./TrustedLib
STATIC_LIB_FLAG=-lelf_static -ldbg_capstone_static -lz_static -lc_static
STATIC_LINK = -L$(STATIC_LIB_PATH) $(STATIC_LIB_FLAG)

nw: $(objects)
	$(CXX) -g -o nw $(objects) $(STATIC_LINK)

$(objects): nw.h
nw.o: nw.cpp
	$(CXX) -g -c nw.cpp -o nw.o

clean:
	rm nw $(objects)
