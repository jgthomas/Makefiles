#
# Compile all MANUALLY SPECIFIED source files 
# into ONE executable.
#
# Only those source files that have been changed 
# are re-compiled, as the object files for other
# source files already exist.
#
# EXAMPLE:
#
# specified sources: one.c, two.c, three.c
# command: make
# output: one.o, two.o, three.o, executable
#

#--------------COMPILER--------------#

# The compiler to use
CC = gcc

# Compiler flags:
#  -g    adds debugging information to the executable file
#  -Wall turns on most, but not all, compiler warnings
CFLAGS  = -g -Wall -Wextra

# Library linking
LDLIBS = 


#--------------FILES--------------#

# The name of the final executable
EXECUTABLE = program

# Header files for dependencies
HEADERS =

# Source files to include, plus conversion to object files
SOURCES = 
OBJECTS := $(SOURCES:%.c=%.o)


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
# 1. Build all the individual object files from source
# 2. Combine those object files into the final executable
all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS) $(HEADERS) makefile
	$(CC) $(CFLAGS) $(OBJECTS) $(LDLIBS) -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# dependencies
#
# Files on which the object files depend: typically header
# files and makefiles. This ensures that object files are
# re-compiled when any of these are dependencies are changed.
$(OBJECTS): $(HEADERS) makefile

# make clean
#
# delete all object files and executables
clean:
	$(RM) $(EXECUTABLE) $(OBJECTS)

# make test
#
# list all source and object files
test:
	@echo "SOURCES = ${SOURCES}"
	@echo "OBJECTS = ${OBJECTS}"
