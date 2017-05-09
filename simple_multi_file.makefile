#
# Compile ONE source file into ONE executable
#
# EXAMPLE:
#
# source: dogs.c
# command: make dogs
# output: dogs (an executable)


# the compiler: gcc for C program, define as g++ for C++
CC = gcc

# compiler flags:
#  -g    adds debugging information to the executable file
#  -Wall turns on most, but not all, compiler warnings
CFLAGS  = -g -Wall

TARGET := prog

all: tester
#all: $(TARGET)

SHARED = shared_sort.o


#$(TARGET): $(TARGET).o $(SHARED)
#	$(CC) $(CFLAGS) $(SHARED) $(TARGET).o -o $(TARGET)

tester: tester.o $(SHARED)
	$(CC) $(CFLAGS) $(SHARED) tester.o -o tester

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@
