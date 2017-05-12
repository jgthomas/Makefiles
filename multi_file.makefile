#
# Compile MULTIPLE source files together. 
#
# Especially useful when multiple, separate source files
# all draw on a shared file of, say, utility functions
#
# EXAMPLE:
#
# shared set of functions: utils.c
# two source files: one.c, two.c
# 
# command: make one 
# output: an executable built with one.c and utils.c, and
# one.o and utils.o
#
# command: make
# output: two executables (one.c + utils.c) and (two.c with utils.c), 
# plus one.o two.o and utils.o
#
# If utils.c remains unchanged, then it does not need to be
# recompiled for each project or source file that uses it.
#


#--------------COMPILER--------------#

# the compiler: gcc for C program, define as g++ for C++
CC = gcc

# compiler flags:
#  -g    adds debugging information to the executable file
#  -Wall turns on most, but not all, compiler warnings
CFLAGS  = -g -Wall

# Library linking
LDLIBS = 

#--------------FILES--------------#

EXECUTABLES = tester tester2

SHARED = shared_sort.o


#--------------TARGETS--------------#

# Phony are targets that are not associated with filenames.
#
# Normally, make only runs if the file targets have 
# changed. Phony targets are always out-of-date and
# so always run when called. Often 'all' would also be
# a phony target, but this makefile is designed to combine 
# all files, so we don't want it to run if no changes have 
# occurred.
.PHONY: clean test


# make
#
# Build all targets with their shared files
# or build any individually
all: $(EXECUTABLES)

tester: tester.o $(SHARED)
	$(CC) $(CFLAGS) $(SHARED) tester.o $(LDLIBS) -o tester

tester2: tester2.o $(SHARED)
	$(CC) $(CFLAGS) $(SHARED) tester2.o $(LDLIBS) -o tester2

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@


# make clean
#
# delete all object files and executables
clean:
	$(RM) $(EXECUTABLES) *.o


# make test
#
# list all executables build with targets set up and 
# the source files they share 
test:
	@echo "EXECUTABLES = ${EXECUTABLES}"
	@echo "SHARED = ${SHARED}"
