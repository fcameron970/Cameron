CC=gcc-10
COMMON= -Wall -Wextra -Wfloat-equal -pedantic -std=c90
DEBUG= -g3
SANITIZE= $(COMMON) -fsanitize=undefined -fsanitize=address $(DEBUG)
VALGRIND= $(COMMON) $(DEBUG)
PRODUCTION= $(COMMON) -O3
LDLIBS = -lm

testf : main.c assoc.h specific.h realloc.c test.c general.h general.c
	$(CC) main.c test.c realloc.c general.c -o testf $(SANITIZE) $(LDLIBS)

ntestrealloc : assoc.h specific.h realloc.c niellstestassoc.c general.h general.c
	$(CC) niellstestassoc.c realloc.c general.c -o ntestrealloc $(PRODUCTION) $(LDLIBS)

ntestrealloc_s : assoc.h specific.h realloc.c niellstestassoc.c general.h general.c
	$(CC) niellstestassoc.c realloc.c general.c -o ntestrealloc_s $(SANITIZE) $(LDLIBS)

clean:
	rm -f testf testrealloc testrealloc_s

leak:
	ASAN_OPTIONS=detect_leaks=1 ./ntestrealloc_s
