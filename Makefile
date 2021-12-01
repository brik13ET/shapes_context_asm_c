CC=gcc


all: main.s
	gcc main_c.s -O1 -lm -o main  -ggdb
