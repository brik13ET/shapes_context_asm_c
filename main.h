#ifndef MAIN_H
#define MAIN_H

#include <stdint.h>

enum COLOR
{
	RED,
	ORANGE,
	YELLOW,
	GREEN,
	SKYBLUE,
	BLUE,
	PURPLE
};

struct SHAPE
{
	const char t;
	enum COLOR c;
};

struct POSITION
{
	int x;
	int y; 
};

struct CIRCLE
{
	const char t;
	enum COLOR c;
	struct POSITION a1;
	uint	radius;
};

struct RECTANGLE
{
	const char t ;
	enum COLOR c;
	struct POSITION a1;
	struct POSITION a2;
};

struct TRIANGLE
{
	const char t ;
	enum COLOR c;
	struct POSITION a1;
	struct POSITION a2;
	struct POSITION a3;
};

struct SHAPE_SQUARE_PAIR
{
	struct SHAPE* s;
	double d;
};

typedef struct CIRCLE Circle;
typedef struct RECTANGLE Rect;
typedef struct TRIANGLE Trian;

extern double GetSquare_CIRCLE (struct CIRCLE);
extern double GetSquare_RECTANGLE (struct RECTANGLE);
extern double GetSquare_TRIANGLE (struct TRIANGLE);

extern Circle* new_CIRCLE(struct POSITION, uint radius, enum COLOR);
extern Rect* new_RECTANGLE(struct POSITION, struct POSITION, enum COLOR);
extern Trian* new_TRIANGLE(struct POSITION, struct POSITION, struct POSITION, enum COLOR);

#endif
