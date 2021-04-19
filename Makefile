CC=gcc-10
COMMON= -Wall -Wextra -Wfloat-equal -pedantic -std=c90
DEBUG= -g3
SANITIZE= $(COMMON) -fsanitize=undefined -fsanitize=address $(DEBUG)
PRODUCTION= $(COMMON) -O3
LDLIBS = -lm

test : main.c f1.h f1.c f2.h f2.c f3.c f3.h 
	$(CC) main.c f1.c f2.c f3.c -o test $(SANITIZE) $(LDLIBS)

