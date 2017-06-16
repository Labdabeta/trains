#ifndef ZTO_H
#define ZTO_H

/* A zto is an approximated real number from 0 to 1 (inclusive). */
typedef unsigned int zto;
#define i64 unsigned long long int
#define INT_MAX 0xFFFFFFFF
#define INT_HALF 0x7FFFFFFF
#define zto_one INT_MAX
#define zto_zero 0

static inline zto ztoInverse(unsigned int x)
{
	if (!x) return zto_zero;
	return INT_MAX / x;
}

static inline zto ztoAdd(zto a, zto b)
{
	zto ret;
	if (__builtin_uadd_overflow(a, b, &ret))
		return INT_MAX;
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
	i64 res = (i64)a * (i64)b;
	return (zto)(res >> 32);
}

static inline zto ztoDiv(zto a, zto b)
{
	i64 res = (i64)a << 32;
	res -= a;
	return (zto)(res / b);
}

static inline int ztoRound(zto a)
{
	return (a >= INT_HALF);
}

static inline unsigned int ztoTimes(zto a, unsigned int x)
{
	i64 res = (i64)a * (i64)x;
	return (zto)(res >> 32);
}

static inline zto ztoMultiply(zto a, unsigned int x)
{
	zto ret;
	if (__builtin_umul_overflow(a, x, &ret))
		return INT_MAX;
	return ret;
}

static inline zto ztoInvert(zto a)
{
	return INT_MAX - a;
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
	i64 res = (i64)a + (i64)b;
	res -= c;
	return (zto)res;
}

#endif /* ZTO_H */
