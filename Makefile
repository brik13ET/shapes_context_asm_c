CC=gcc


all: main_c.s
	gcc main_c.s -O1 -lm -o main  -ggdb
