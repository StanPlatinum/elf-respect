CXX = clang++
CXXFLAGS = -std=c++14

object_name = stock
objects = $(object_name).o

$(object_name): $(objects)
	$(CXX) $(CXXFLAGS) -g -o $(object_name) $(objects)

$(object): $(object_name).cpp
	$(CXX) $(CXXFLAGS) -g -c $(object_name).cpp -o $(object_name).o

clean:
	rm $(objects) $(object_name)
