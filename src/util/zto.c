#include "zto.h"

#define INT_MAX 0xFFFFFFFF

zto ztoInverse(unsigned int x)
{
	return INT_MAX / x;
}

zto ztoAdd(zto a, zto b)
{
	zto res = a+b;
	if (res < a || res < b) { // overflow
		return INT_MAX;
	}
	return res;
}

zto ztoSub(zto a, zto b)
{
	zto res = a-b;
	if (res > a || res > b) { // underflow
		return 0;
	}
	return res;
}

zto ztoMul(zto a, zto b)
{
	unsigned long long int res = a * b;
	return (zto)(res / (unsigned long long int)INT_MAX);
}

zto ztoDiv(zto a, zto b)
{
	unsigned long long int res = (unsigned long long int)a << 32;
	res -= a;
	return (zto)(res / b);
}

zto ztoRoot(zto a, unsigned int b)
{
#warning TODO
}
