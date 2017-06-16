/* A library generalizing fuzzy logic to a universe of discourse of native ints
 * using only static memory. */
#ifndef FUZZY_H
#define FUZZY_H

#include "zto.h"

/* A linear trapezoidal fuzzifier with max 1.
 *
 * This represents the fuzzy membership function:
 *  f(x) = 0 if x <= s.l,
 *         (x-s.l)/(c.l-s.l) if s.l <= x <= c.l
 *         1 if c.l <= x <= c.r
 *         (s.r-x)/(s.r-c.r) if c.r <= x <= s.r
 *         0 otherwise
 *
 *
 *  Invariant: s.l <= c.l <= c.r <= s.r
 * */
struct Fuzzifier {
	/* The area for which the function is non-zero. */
	struct {
		int left;
		int right;
	} support;

	/* The area for which the function is 1. */
	struct {
		int left;
		int right;
	} core;
};

/* Defines complement operators. */
enum FuzzyComplementOperator {
	FCO_CLASSICAL, /* f(x) = 1-x */
	FCO_SUGENO, /* f(x) = (1-x)/(1+ax) */
	FCO_YAGER /* f(x) = (1-x^a)^(1/a) */
};

/* Defines T norms. */
enum FuzzyTNorm {
	FTN_CLASSICAL, /* f(a,b) = min(a,b) */
	FTN_ALGEBRAIC, /* f(a,b) = a*b */
	FTN_BOUNDED, /* f(a,b) = min(0, a+b-1) */
	FTN_BASIC, /* f(a,b) = a if b=1, b if a=1, 0 otherwise */
	FTN_INVERTED, /* f(a,b) = 1-min(1,((1-a)^p+(1-b)^p)^(1/p)) */
	FTN_MAXIMAL /* f(a,b) = max(0, (p+1)(a+b-1)-pab) */
};

/* Defines inferences (for a->b "if a then b"). */
enum FuzzyImplication {
	FI_MAMDANI, /* f(a,b) = min(a,b) */
	FI_LARSEN, /* f(a,b) = a*b */
	FI_ZADEH, /* f(a,b) = max(min(a,b),1-a) */
	FI_DIENES_RASCHER, /* f(a,b) = max(1-a, b) */
	FI_LUKASIEWICZ /* f(a,b) = min(1, 1-a+b) */
}

struct FuzzyLogic {
	enum FuzzyComplementOperator complement; int complementArg;
	enum FuzzyTNorm tnorm; int tnormArg;
	enum FuzzyImplication implication;
};

enum Defuzzifier {
	DF_MEAN_OF_MAX, /* Center of maximums. */
	DF_MIN_OF_MAX, /* Minimum of maximums. */
	DF_MAX_OF_MAX, /* Maximum of maximums. */
	DF_CENTROID, /* Center of mass. int(xf(x))/int(x) */
	DF_CENTER_OF_AREA /* Center of area. */
};

/* Applies fuzzy min-max on the given variables with the given fuzzifiers,
 * logical rules and defuzzifier to produce an output value.
 *
 * \param[in] numVariables     The number of variables to infer on.
 * \param[in] variables	       An array of the input variables of the system.
 * \param[in] fuzzifiers       The fuzzifiers of the system.
 * \param[in] rules            The rules to do logic under.
 * \param[in] defuzzifier      The rule to defuzzify with.
 *
 * \return The result of fuzzy inference on the input variables.
 */
int fuzzy(int numVariables,
		  int *variables,
		  struct Fuzzifer *fuzzifiers,
		  struct FuzzyLogic rules,
		  enum Defuzzifier defuzzifier);

#endif /* FUZZY_H */
