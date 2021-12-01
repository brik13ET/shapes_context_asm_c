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

char* toString_CIRCLE(Circle* s)
{
	Circle* a = malloc(34);
	snprintf(a, 34, "c %d %d %d %hhd\n", s->a1.x, s->a1.y, s->radius, s->c);
	return a;
}

char* toString_RECTANGLE(Rect* s)
{
	Rect* a = malloc(34);
	snprintf(a, 34, "r %d %d %d %d %hhd\n", 
	s->a1.x, s->a1.y,
	s->a2.x, s->a2.y,
	s->c);
	return a;
}

char* toString_TRIANGLE(Trian* s)
{
	Trian* a = malloc(34);
	snprintf(a, 34, "t %d %d %d %d %d %d %hhd\n", 
	s->a1.x, s->a1.y,
	s->a2.x, s->a2.y,
	s->a3.x, s->a3.y,
	s->c);
	return a;
}

char* toString(struct SHAPE* s)
{
	char* ret;
	switch (s->t)
	{
	case 'c': ret = toString_CIRCLE((Circle*)s);
		break;
	case 'r': ret = toString_RECTANGLE((Rect*)s);
		break;
	case 't': ret = toString_TRIANGLE((Trian*)s);
		break;
	}
	return ret;
}

double GetSquare(struct SHAPE* s)
{
	double ret;
	switch (s->t)
	{
	case 'c': ret = GetSquare_CIRCLE(*(Circle*)s);
		break;
	case 'r': ret = GetSquare_RECTANGLE(*(Rect*)s);
		break;
	case 't': ret = GetSquare_TRIANGLE(*(Trian*)s);
		break;
	}
	return ret;
}

int BinarySearch(struct SHAPE** a, struct SHAPE* item, int low, int high)
{
    if (high <= low)
        return (GetSquare(item) > GetSquare(a[low])) ?
                (low + 1) : low;

    int mid = (low + high) / 2;

    if (GetSquare(item) == GetSquare(a[mid]))
        return mid + 1;

    if (GetSquare(item) > GetSquare(a[mid]))
        return BinarySearch(a, item, mid + 1, high);
    return BinarySearch(a, item, low, mid - 1);
}
/*
void sort(struct SHAPE** a, int n)
{
    int i, loc, j;
    struct SHAPE* selected;
    for (i = 1; i < n; ++i)
    {
        j = i - 1;
	selected = a[i];
        // find location where selected should be inseretd
        loc = BinarySearch(a, selected, 0, j);

        // Move all elements after location to create space
        while (j >= loc)
        {
            a[j + 1] = a[j];
            j--;
        }
	a[j + 1] = selected;
    }
}
*/
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
	struct SHAPE** elems = malloc(sizeof(struct SHAPE*)*elemcount);
	uint i = 0;
	while (!feof(fin))
	{
		char c = 0;
		fscanf(fin, " %c ", &c);
		switch (c)
		{
			case 'c':
			elems[i] =(struct SHAPE*)new_CIRCLE( (struct POSITION){0, 0}, 0, 0 );
			fscanf(fin, " %d %d %d %hhd", 
			&(((Circle*)elems[i])->a1.x), &(((Circle*)elems[i])->a1.y), 
			&(((Circle*)elems[i])->radius), 
			(uint8_t*)&(((Circle*)elems[i])->c) );
				break;
			case 'r':
			elems[i] = (struct SHAPE*)new_RECTANGLE( (struct POSITION){0, 0}, (struct POSITION){0, 0},  0 );
			fscanf(fin, " %d %d %d %d %hhd", 
			&(((Rect*)elems[i])->a1.x), &(((Rect*)elems[i])->a1.y),
			&(((Rect*)elems[i])->a2.x), &(((Rect*)elems[i])->a2.y),
			(uint8_t*)&(((Rect*)elems[i])->c) );
				break;
			case 't':
			elems[i] = (struct SHAPE*)new_TRIANGLE( (struct POSITION){0, 0},(struct POSITION){0, 0},(struct POSITION){0, 0}, 0 );
			fscanf(fin, " %d %d %d %d %d %d %hhd", 
			&(((Trian*)elems[i])->a1.x), &(((Trian*)elems[i])->a1.y),
			&(((Trian*)elems[i])->a2.x), &(((Trian*)elems[i])->a2.y),
			&(((Trian*)elems[i])->a3.x), &(((Trian*)elems[i])->a3.y),
			(uint8_t*)&(((Trian*)elems[i])->c) );
				break;
			default:
				printf("undefined symbol \'%c\'\t at %ld\n", c, ftell(fin));
		}
		if (c == 'c' || c == 'r' || c == 't')
			i++;
	}
	printf("READ finished: %d objects\n", elemcount);

	sort((struct SHAPE **)elems, elemcount);

	for (uint i = 0; i < elemcount; i++)
	{
		printf ("%c %d %lf\n", ((struct SHAPE*)elems[i])->t, ((struct SHAPE*)elems[i])->c, GetSquare(elems[i] ) );
		switch (((struct SHAPE*)elems[i])->t)
		{
		case 'c':
			fprintf(fout, "c %d %d %d %hhd\n", 
			((Circle*)elems[i])->a1.x, ((Circle*)elems[i])->a1.y,
			((Circle*)elems[i])->radius,
			((Circle*)elems[i])->c);   
			break;
		case 't':
			fprintf(fout, "t %d %d %d %d %d %d %hhd\n", 
			((Trian*)elems[i])->a1.x, ((Trian*)elems[i])->a1.y,
			((Trian*)elems[i])->a2.x, ((Trian*)elems[i])->a2.y,
			((Trian*)elems[i])->a3.x, ((Trian*)elems[i])->a3.y,
			((Trian*)elems[i])->c);   
			break;
		case 'r':
			fprintf(fout, "r %d %d %d %d %hhd\n", 
			((Rect*)elems[i])->a1.x, ((Rect*)elems[i])->a1.y,
			((Rect*)elems[i])->a2.x, ((Rect*)elems[i])->a2.y,
			((Rect*)elems[i])->c);   
			break;
		}
	}
	fclose(fin);
	fclose(fout);
	// cleanup. WTF IF FUCKING WRONG ???
	for (uint i =0; i < elemcount; i++)
	{
		free(elems[i]);
	}
	printf("free(elems)\n");
	free(elems);
	return 0;
}
