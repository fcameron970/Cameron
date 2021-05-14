CC=gcc-10
COMMON= -Wall -Wextra -Wfloat-equal -pedantic -std=c90
DEBUG= -g3
SANITIZE= $(COMMON) -fsanitize=undefined -fsanitize=address $(DEBUG)
PRODUCTION= $(COMMON) -O3
LDLIBS = -lm

test : stringwhirl.c nrutil.c nrutil.h matrixops.c matrixops.h 
	$(CC) stringwhirl.c nrutil.c nrutil.h matrixops.c matrixops.h  -o test $(SANITIZE) $(LDLIBS)

