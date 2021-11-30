#include <stdlib.h>
#include <stdio.h>
#include <main.h>
#include <string.h>
#include <math.h>

double GetSquare_CIRCLE (struct CIRCLE s)
{
	return 3.14159265359f * s.radius* s.radius;
}
double GetSquare_RECTANGLE (struct RECTANGLE s)
{
	return ((long long int)(s.a1.x - s.a2.x) * (s.a1.y - s.a2.y)) ^ (long long int)(-1) ; 
}

double GetLength(int x1, int y1, int x2, int y2)
{
	return sqrt( (x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2) );
}

double GetSquare_TRIANGLE (struct TRIANGLE s)
{
	double a = GetLength(s.a1.x, s.a1.y, s.a2.x, s.a2.y);
	double b = GetLength(s.a2.x, s.a2.y, s.a3.x, s.a3.y);
	double c = GetLength(s.a1.x, s.a1.y, s.a3.x, s.a3.y);
	int p =  (a + b + c) / 2;
	return sqrt(p * (p - a) * (p - b) * (p -c ) );
}

Circle* new_CIRCLE(struct POSITION p, uint radius, enum COLOR c)
{
	Circle s = { 'c', c, p, radius };
	Circle* ret = malloc(sizeof(s));
	memcpy(ret, &s, sizeof(s));
	return ret;
}
Rect* new_RECTANGLE(struct POSITION p, struct POSITION p2, enum COLOR c)
{
	Rect s = {'r', c, p, p2};
	Rect* ret = malloc(sizeof(s));
	memcpy(ret, &s, sizeof(s));
	return ret;
}
Trian* new_TRIANGLE(struct POSITION p, struct POSITION p2, struct POSITION p3, enum COLOR c)
{
	Trian s = {'t', c, p, p2, p3};
	Trian* ret = malloc(sizeof(s));
	memcpy(ret, &s, sizeof(s));
	return ret;
}

int main (int argc, char* argv[])
{
	if (argc <= 1)
		return -1;
	FILE* fin= fopen(argv[1], "r");
	FILE* fout= fopen(argv[2], "w");
	int elemcount = 0;
	while (!feof(fin))
	{
		char c = 0;
		fscanf(fin, "%c", &c);
		if (c == 'c' || c == 'r' || c == 't')
			elemcount ++;
	}
	rewind(fin);
	void** elems = malloc(sizeof(void*)*elemcount);
	struct SHAPE_SQUARE_PAIR* squares = malloc(sizeof(struct SHAPE_SQUARE_PAIR)*elemcount);
	uint i = 0;
	while (!feof(fin))
	{
		char c = 0;
		fscanf(fin, " %c ", &c);
		switch (c)
		{
			case 'c':
			elems[i] = new_CIRCLE( (struct POSITION){0, 0}, 0, 0 );
			fscanf(fin, " %d %d %d %hhd", 
			&(((Circle*)elems[i])->a1.x), 
			&(((Circle*)elems[i])->a1.y), 
			&(((Circle*)elems[i])->radius), 
			(uint8_t*)&(((Circle*)elems[i])->c) );
				break;
			case 'r':
			elems[i] = new_RECTANGLE( (struct POSITION){0, 0}, (struct POSITION){0, 0},  0 );
			fscanf(fin, " %d %d %d %d %hhd", 
			&(((Rect*)elems[i])->a1.x),
			&(((Rect*)elems[i])->a1.y),
			
			&(((Rect*)elems[i])->a2.x),
			&(((Rect*)elems[i])->a2.y),
			
			(uint8_t*)&(((Rect*)elems[i])->c) );
				
				break;
			case 't':
			elems[i] = new_TRIANGLE( (struct POSITION){0, 0},(struct POSITION){0, 0},(struct POSITION){0, 0}, 0 );
			fscanf(fin, " %d %d %d %d %d %d %hhd", 
			&(((Trian*)elems[i])->a1.x), 
			&(((Trian*)elems[i])->a1.y),
			
			&(((Trian*)elems[i])->a2.x),
			&(((Trian*)elems[i])->a2.y),
			
			&(((Trian*)elems[i])->a3.x),
			&(((Trian*)elems[i])->a3.y),
			
			(uint8_t*)&(((Trian*)elems[i])->c) );
				
				break;
			default:
			printf("undefined symbol \'%c\'\t at %ld\n", c, ftell(fin));
		}
		if (c == 'c' || c == 'r' || c == 't')
			i++;
	}
	printf("READ finished: %d objects\n", elemcount);
	for (uint i = 0; i < elemcount; i++)
	{
		printf ("%c %d \t", ((struct SHAPE*)elems[i])->t, ((struct SHAPE*)elems[i])->c);
		squares[i].s = elems[i];
		switch (((struct SHAPE*)elems[i])->t)
		{
		case 'c':
			squares[i].d = GetSquare_CIRCLE(*(Circle*)elems[i]);
			printf("%lf\n", GetSquare_CIRCLE(*(Circle*)elems[i]) );
			break;
		case 't':
			squares[i].d = GetSquare_TRIANGLE(*(Trian*)elems[i]);
			printf("%lf\n", GetSquare_TRIANGLE(*(Trian*)elems[i]) );
			break;
		case 'r':
			squares[i].d = GetSquare_RECTANGLE(*(Rect*)elems[i]);
			printf("%lf\n", GetSquare_RECTANGLE(*(Rect*)elems[i]) );
			break;
		}
	}
	for (uint i =0; i < elemcount; i++)
	{
		free(elems[i]);
	}
	free(squares);
	free(elems);
	return 0;
}
