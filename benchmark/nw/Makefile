objects = main.o nw.o

main: $(objects)
	g++ -g -o main $(objects)

$(objects): nw.h
main.o: 
	g++ -g -c main.cpp -o main.o
nw.o: nw.cpp
	g++ -g -c nw.cpp -o nw.o

clean:
	rm main $(objects)
