#ifndef RATIONAL_H
#define RATIONAL_H

typedef struct rational {
	unsigned int numerator;
	unsigned int denominator;
	int positive;
} rational;

void ratFromInt(int x, rational *r);
int ratFloor(rational *r);
int ratCeiling(rational *r);
int ratRound(rational *r);
void ratAdd(rational *accumulator, rational *value);
void ratSub(rational *accumulator, rational *value);
void ratMul(rational *accumulator, rational *value);
void ratDiv(rational *accumulator, rational *value);

#endif /* RATIONAL_H */
