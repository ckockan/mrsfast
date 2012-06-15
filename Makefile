GCC44 := $(shell expr `gcc -dumpversion | cut -f1 -d.` \>= 4)$(shell expr `gcc -dumpversion | cut -f2 -d.` \>= 4)


ALL: mrsfast

LDFLAGS=-static
LIBS=-lz -lm -g -pg -ggdb

CFLAGS= -O2 -g -pg -ggdb 
ifeq "$(GCC44)" "11"
	CFLAGS += -msse4.2
endif

mrsfast: baseFAST.o MrsFAST.o Common.o CommandLineParser.o RefGenome.o HashTable.o Reads.o Output.o
	gcc $^ -o $@ ${LDFLAGS} ${LIBS}
	rm -rf *.o

clean:
	rm -rf *.o
