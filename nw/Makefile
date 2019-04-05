objects = main.o nw.o

main: $(objects)
	g++ -o main $(objects)

$(objects): nw.h
main.o: main.cpp
nw.o: nw.cpp

clean:
	rm main $(objects)
