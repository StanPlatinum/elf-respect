objects = nw.o

nw: $(objects)
	g++ -g -o nw $(objects)

$(objects): nw.h
nw.o: nw.cpp
	g++ -g -c nw.cpp -o nw.o

clean:
	rm nw $(objects)
