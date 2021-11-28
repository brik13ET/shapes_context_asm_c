CC=gcc
AS=nasm

%.c.o: %.c
	gcc -nostdlib -I. -c $? -o $@

%.s.o: %.s
	nasm -f elf64 $? -o $@

all: main.c.o main.s.o
	gcc main.c.o main.s.o -o main
