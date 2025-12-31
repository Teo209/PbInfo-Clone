CXX = clang++
CXXFLAGS = -std=c++23 -Wall -Wextra -O2
LDFLAGS = -fuse-ld=lld

TARGET = main
SRC = $(wildcard *.cpp)
OBJ = $(SRC:.cpp=.o)

$(TARGET): $(OBJ)
	$(CXX) $(OBJ) -o $(TARGET) $(LDFLAGS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

%: %.cpp
	$(CXX) $(CXXFLAGS) $< -o $@

clean:
	rm -f *.o $(TARGET)

run:
	make && ./${TARGET}; echo