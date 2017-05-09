#
# Compile EACH source file in the directory 
# into ONE executable. 
#
# Only those source files that have been changed 
# are re-compiled.
#
# EXAMPLE:
#
# sources: one.c, two.c, three.c
# command: make
# output: one, two, three
#

#--------------COMPILER--------------#

# The compiler to use
CC = gcc

# Flags:
#  -g    adds debugging information to the executable file
#  -Wall turns on most, but not all, compiler warnings
CFLAGS  = -g -Wall


#--------------FILES--------------#

# Get all .c files in the dir and their names 
# with the .c extension stripped 
SOURCES := $(wildcard *.c)
PROGS := $(patsubst %.c,%,$(SOURCES))


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
# Build executables for each of the .c files
all: $(PROGS)

%: %.c
	$(CC) $(CFLAGS) -o $@ $<

# make clean
#
# delete all object files and executables
clean:
	$(RM) $(PROGS)

# make test
#
# list all source and object files
test:
	@echo "SOURCES = ${SOURCES}"
	@echo "OBJECTS = ${PROGS}"
