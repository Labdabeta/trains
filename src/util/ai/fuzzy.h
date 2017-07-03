/* A library generalizing fuzzy logic to a universe of discourse of native ints
 * using only static memory. */
#ifndef FUZZY_H
#define FUZZY_H

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
 *  Invariant: INT_MIN < s.l <= c.l <= c.r <= s.r
 * */
struct FuzzySet {
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

/* Defines a rule's type */
enum FuzzyRuleType {
	FRT_VARIABLE,
	FRT_OR,
	FRT_AND,
	FRT_NOT,
};

struct FuzzyVariable {
	struct FuzzySet fuzzifier;
	int value;
};

struct FuzzyBinary {
	struct FuzzyRule *left;
	struct FuzzyRule *right;
};

struct FuzzyUnary {
	struct FuzzyRule *rule;
};

struct FuzzyRule {
	enum FuzzyRuleType type;
	union {
		struct FuzzyBinary args;
		struct FuzzyUnary arg;
		struct FuzzyVariable value;
	};
};

/* Defines T norms. */
enum FuzzyTNorm {
	FTN_CLASSICAL, /* f(a,b) = min(a,b) */
	FTN_ALGEBRAIC, /* f(a,b) = a*b */
	FTN_BOUNDED, /* f(a,b) = max(0, a+b-1) */
	FTN_BASIC, /* f(a,b) = a if b=1, b if a=1, 0 otherwise */
};

/* Defines inferences (for a->b "if a then b"). */
enum FuzzyImplication {
	FI_MAMDANI, /* f(a,b) = min(a,b) */
	FI_LARSEN, /* f(a,b) = a*b */
	FI_ZADEH, /* f(a,b) = max(min(a,b),1-a) */
	FI_DIENES_RASCHER, /* f(a,b) = max(1-a, b) */
	FI_LUKASIEWICZ /* f(a,b) = min(1, 1-a+b) */
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
 * \param[in] numRules         The number of inference rules.
 * \param[in] rules            The rules themselves.
 * \param[in] targets          The fuzzy set targets of the rules.
 * \param[in] tnorm            The tnorm to use.
 * \param[in] implication      The implication system to use.
 * \param[in] defuzzifier      The defuzzification scheme to use.
 *
 * \return The result of fuzzy inference on the input variables.
 */
int fuzzy(int numRules,
          struct FuzzyRule *rules,
          struct FuzzySet *targets,
          enum FuzzyTNorm tnorm,
          enum FuzzyImplication implication,
          enum Defuzzifier defuzzifier);

// TODO: if necessary allow more advanced techniques. In order of how useful
// they may be:
//
//  - defuzzification thresholding (to cull weak outputs)
//  - gaussian +other membership functions
//  - more tnorms
//  - more implications
//  - more defuzzifiers
//  - fuzzy setwise operations

#endif /* FUZZY_H */

#if 0
// Example: Metallurgy Process   (ECE457B W17 A2P3)
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Inputs: - Temperature of material in *C
//         - Mass of material in kg
//         - Time spent in min (we want to finish melting in 2 hours)
// Outputs: - Fuel valve opening diameter in mm
//
// Rules: - IF temperature is low AND end is near THEN increase fuel.
//        - IF temperature is high THEN decrease fuel.
//        - IF mass is small AND end is near THEN maintain fuel.
//        - IF mass is large AND end is far THEN increase fuel.
//        - IF end is near THEN decrease fuel.

int determineValveDiameter(int temp, int mass, int time) {
	// Temperature sets:
	// It is possibly cold if temperature is 0->50
	// It is definitely cold if temperature is 0->25
	struct FuzzySet cold = {.support={0,50}, .core={0,25}};
	struct FuzzySet hot = {.support={25,60}, .core={50,60}};
	// Mass fuzzy sets:
	struct FuzzySet small = {.support={0,100}, .core={0,50}};
	struct FuzzySet large = {.support={50,140}, .core={100,140}};
	// Time until end fuzzy sets:
	struct FuzzySet near = {.support={30,120}, .core={90,120}};
	struct FuzzySet far = {.support={0,90}, .core={0,30}};
	// Fuel valve fuzzy sets
	struct FuzzySet decrease = {.support={0,70}, .core={0,50}};
	struct FuzzySet maintain = {.support={50,150}, .core={70,120}};
	struct FuzzySet increase = {.support={120,200}, .core={150,200}};

	struct FuzzyRule coldness = {FRT_VARIABLE, .value = {cold, temp}};
	struct FuzzyRule hotness = {FRT_VARIABLE, .value = {hot, temp}};
	struct FuzzyRule smallness = {FRT_VARIABLE, .value = {small, mass}};
	struct FuzzyRule largeness = {FRT_VARIABLE, .value = {large, mass}};
	struct FuzzyRule nearness = {FRT_VARIABLE, .value = {near, time}};
	struct FuzzyRule farness = {FRT_VARIABLE, .value = {far, time}};

	struct FuzzyRule rules[5] = {
		{FRT_AND, .args = {&coldness, &farness}},
		hotness,
		{FRT_AND, .args = {&smallness, &nearness}},
		{FRT_AND, .args = {&largeness, &farness}},
		nearness};

	struct FuzzySet targets[5] = {increase, decrease, maintain, increase, decrease};

	return fuzzy(5, rules, targets, FTN_CLASSICAL, FI_MAMDANI, DF_CENTROID);
}

// determineValveDiameter(30, 80, 78) should be 7.3 apparently.
// This runs at about 9kHz on the real hardware.

#endif
