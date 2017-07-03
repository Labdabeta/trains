#ifndef NOTO_H
#define NOTO_H

#include "limits.h"

/* A noto is an approximated real number from -1 to 1 (inclusive). */
typedef unsigned int noto;
#define i64 long long int
#define noto_one 0x7FFFFFFF
#define noto_zero 0

/* these are gcc builtins: */
i64 __ashrti3(i64,int);
i64 __ashlti3(i64,int);

static inline noto notoInverse(int x)
{
	if (!x) return noto_one;
	return INT_MAX / x;
}

static inline noto notoAdd(noto a, noto b)
{
	noto ret;
	if (__builtin_add_overflow(a, b, &ret))
		return a > 0 ? noto_one : -noto_one;
	return ret;
}

static inline noto notoSub(noto a, noto b)
{
	return notoAdd(a, -b);
}

static inline noto notoMul(noto a, noto b)
{
	i64 res = (i64)a * (i64)b;
	return (noto)(__ashrti3(res, 32));
}

static inline noto notoDiv(noto a, noto b)
{
	i64 res = __ashlti3((i64)a, 32);
	res -= a;
	return (noto)(res / b);
}

static inline int notoRound(noto a)
{
	return a ? a > 0 ? 1 : -1 : 0;
}

static inline int notoTimes(noto a, int x)
{
	i64 res = (i64)a * (i64)x;
	return (noto)(__ashrti3(res, 32));
}

static inline noto notoMultiply(noto a, int x)
{
	noto ret;
	if (__builtin_mul_overflow(a, x, &ret))
		return a > 0 ? x > 0 ? 1 : -1 : x > 0 ? -1 : 1;
	return ret;
}

static inline noto notoMin(noto a, noto b)
{
	return (a<b?a:b);
}

static inline noto notoMax(noto a, noto b)
{
	return (a>b?a:b);
}

#undef i64
#undef INT_MAX
#undef INT_HALF

#endif /* NOTO_H */
