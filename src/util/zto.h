#ifndef ZTO_H
#define ZTO_H

#include "limits.h"

/* A zto is an approximated real number from 0 to 1 (inclusive). */
typedef unsigned int zto;
#define u64 unsigned long long int
#define UINT_HALF 0x7FFFFFFF
#define zto_one 0xFFFFFFFF
#define zto_zero 0

static inline zto ztoInverse(unsigned int x)
{
	if (!x) return zto_one;
	return UINT_MAX / x;
}

static inline zto ztoAdd(zto a, zto b)
{
	zto ret;
	if (__builtin_uadd_overflow(a, b, &ret))
		return UINT_MAX;
	return ret;
}

static inline zto ztoSub(zto a, zto b)
{
	zto ret;
	if (__builtin_usub_overflow(a, b, &ret))
		return 0;
	return ret;
}

static inline zto ztoMul(zto a, zto b)
{
	u64 res = (u64)a * (u64)b;
	return (zto)(res >> 32);
}

static inline zto ztoDiv(zto a, zto b)
{
	u64 res = (u64)a << 32;
	res -= a;
	return (zto)(res / b);
}

static inline int ztoRound(zto a)
{
	return (a >= UINT_HALF);
}

static inline unsigned int ztoTimes(zto a, unsigned int x)
{
	u64 res = (u64)a * (u64)x;
	return (zto)(res >> 32);
}

static inline zto ztoMultiply(zto a, unsigned int x)
{
	zto ret;
	if (__builtin_umul_overflow(a, x, &ret))
		return UINT_MAX;
	return ret;
}

static inline zto ztoInvert(zto a)
{
	return UINT_MAX - a;
}

static inline zto ztoMin(zto a, zto b)
{
	return (a<b?a:b);
}

static inline zto ztoMax(zto a, zto b)
{
	return (a>b?a:b);
}

static inline zto ztoAddSub(zto a, zto b, zto c)
{
	u64 res = (u64)a + (u64)b;
	res -= c;
	return (zto)res;
}

#undef u64
#undef UINT_MAX
#undef UINT_HALF

#endif /* ZTO_H */
