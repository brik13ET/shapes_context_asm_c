#include <stdlib.h>
#include <stdio.h>
#include <main.h>
#include <string.h>

double GetSquare_CIRCLE (struct CIRCLE s)
{

}
double GetSquare_RECTANGLE (struct RECTANGLE s)
{

}
double GetSquare_TRIANGLE (struct TRIANGLE s)
{

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

}
Trian* new_TRIANGLE(struct POSITION p, struct POSITION p2, struct POSITION p3, enum COLOR c)
{

}

int main (int argc, char* argv[])
{
	if (argc <= 1)
		return -1;
	FILE* fin= fopen(argv[1], "r");
	FILE* fout= fopen(argv[2], "w");
	int elemcount = 0;
	while (feof(fin))
	{
		char c = 0;
		fscanf(fin, "%c", &c);
		if (c == 'c' || c == 'r' || c == 't')
			elemcount ++;
	}
	rewind(fin);
	void** elems = malloc(sizeof(void*)*elemcount);
	uint i = 0;
	while (feof(fin))
	{
		char c = 0;
		fscanf(fin, "%c", &c);
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
			printf("undefined symbol \'%c\'\n", c);
		}
		if (c == 'c' || c == 'r' || c == 't')
			i++;
	}
	printf("READ\n");
	for (uint i = 0; i < elemcount; i++)
	{
		printf ("%c %d ", ((struct TRIANGLE*)elems[i])->t, ((struct TRIANGLE*)elems[i])->c);
	}

	free(elems);
	return 0;
}
