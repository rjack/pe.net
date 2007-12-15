# Makefile
#
# Giacomo Ritucci <ritucci@cs.unibo.it>

CC = gcc
CCOPTS = -Wall -ansi -pedantic -pipe# -g
CFLAGS = -O3
OBJ = util.o problem_001.o problem_002.o problem_003.o problem_020.o
COMMONDEPS = problems.h Makefile


.PHONY		: clean tags
	

all		: tags test


problem_001.o	: problem_001.c $(COMMONDEPS)
	$(CC) $(CCOPTS) $(CFLAGS) -c $<


problem_002.o	: problem_002.c $(COMMONDEPS)
	$(CC) $(CCOPTS) $(CFLAGS) -c $<


problem_003.o	: problem_003.c $(COMMONDEPS) util.h
	$(CC) $(CCOPTS) $(CFLAGS) -c $<


problem_020.o	: problem_020.c $(COMMONDEPS) util.h
	$(CC) $(CCOPTS) $(CFLAGS) -c $<


test		: test.c util.h $(OBJ) $(COMMONDEPS)
	$(CC) $(CCOPTS) $(CFLAGS) $(OBJ) -o $@ $<


tags		:
	ctags -R


clean		:
	rm -rf $(OBJ) test tags
