.PHONY: all
DIR=example
SRC=$(DIR)/src
INC=$(DIR)/include
all:
	g++ -g -O0 test.cpp -o app
clean:
	rm -rf app