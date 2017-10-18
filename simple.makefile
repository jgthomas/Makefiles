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
#  -Wextra   'extra' warnings
#  -Werror   treat errors as warnings, and refuse to compile
CFLAGS  = -g -Wall -Wextra -Werror

# Library linking
LDLIBS = 

# the build target executable:
TARGET = myprog

all: $(TARGET)

$(TARGET): $(TARGET).c
	$(CC) $(CFLAGS) -o $(TARGET) $(TARGET).c

clean:
	$(RM) $(TARGET)
