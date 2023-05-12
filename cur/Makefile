.PHONY: all clean

CXXFLAGS += -std=c++17 -g -Wall -Isrc

all: pw run_tests.sh
	bash run_tests.sh

%.o:%.cpp
	$(CXX) $(CXXFLAGS) -c $^ -o$@

pw: src/pw.o
	$(CXX) $(CXXFLAGS) $^ -o$@

clean:
	rm -f pw src/*.o 
