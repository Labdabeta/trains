#include "fuzzy.h"
#include "zto.h"

static zto calculateMembership(struct FuzzySet *set, int val)
{
	if (val < set->support.left)
		return zto_zero;
	else if (val < set->core.left)
		return ztoMultiply(
				ztoInverse(set->core.left - set->support.left),
				val - set->support.left);
	else if (val < set->core.right)
		return zto_one;
	else if (val < set->support.right)
		return ztoMultiply(
				ztoInverse(set->support.right - set->core.right),
				set->support.right - val);
	else
		return zto_zero;
}

static zto calculateRule(struct FuzzyRule *rule, enum FuzzyTNorm tnorm)
{
	zto a,b;
	switch (rule->type) {
		case FRT_VARIABLE:
			return calculateMembership(&rule->value.fuzzifier, rule->value.value);
		case FRT_OR:
			a = calculateRule(rule->args.left, tnorm);
			b = calculateRule(rule->args.right, tnorm);
			switch (tnorm) {
				case FTN_CLASSICAL:
					return ztoMax(a,b);
				case FTN_ALGEBRAIC:
					return ztoAddSub(a,b,ztoMul(a,b));
				case FTN_BOUNDED:
					return ztoAdd(a,b);
				case FTN_BASIC:
					if (b == 0)
						return a;
					else if (a == 0)
						return b;
					else
						return zto_one;
			}
		case FRT_AND:
			a = calculateRule(rule->args.left, tnorm);
			b = calculateRule(rule->args.right, tnorm);
			switch (tnorm) {
				case FTN_CLASSICAL:
					return ztoMin(a,b);
				case FTN_ALGEBRAIC:
					return ztoMul(a,b);
				case FTN_BOUNDED:
					return ztoAddSub(a,b,zto_one);
				case FTN_BASIC:
					if (b == 1)
						return a;
					else if (a == 1)
						return b;
					else
						return zto_zero;
			}
		case FRT_NOT:
			return ztoInvert(calculateRule(rule->arg.rule, tnorm));
	}
}

int mamdani_mean_of_max_fuzzy(int numRules, zto *ruleValues, struct FuzzySet *targets)
{
#warning TODO
}

int mamdani_min_of_max_fuzzy(int numRules, zto *ruleValues, struct FuzzySet *targets)
{
#warning TODO
}

int mamdani_max_of_max_fuzzy(int numRules, zto *ruleValues, struct FuzzySet *targets)
{
#warning TODO
}

int mamdani_centroid_fuzzy(int numRules, zto *ruleValues, struct FuzzySet *targets)
{
#warning TODO
}

int mamdani_center_of_area_fuzzy(int numRules, zto *ruleValues, struct FuzzySet *targets)
{
#warning TODO
}

int larsen_mean_of_max_fuzzy(int numRules, zto *ruleValues, struct FuzzySet *targets)
{
#warning TODO
}

int larsen_min_of_max_fuzzy(int numRules, zto *ruleValues, struct FuzzySet *targets)
{
#warning TODO
}

int larsen_max_of_max_fuzzy(int numRules, zto *ruleValues, struct FuzzySet *targets)
{
#warning TODO
}

int larsen_centroid_fuzzy(int numRules, zto *ruleValues, struct FuzzySet *targets)
{
#warning TODO
}

int larsen_center_of_area_fuzzy(int numRules, zto *ruleValues, struct FuzzySet *targets)
{
#warning TODO
}

int zadeh_mean_of_max_fuzzy(int numRules, zto *ruleValues, struct FuzzySet *targets)
{
#warning TODO
}

int zadeh_min_of_max_fuzzy(int numRules, zto *ruleValues, struct FuzzySet *targets)
{
#warning TODO
}

int zadeh_max_of_max_fuzzy(int numRules, zto *ruleValues, struct FuzzySet *targets)
{
#warning TODO
}

int zadeh_centroid_fuzzy(int numRules, zto *ruleValues, struct FuzzySet *targets)
{
#warning TODO
}

int zadeh_center_of_area_fuzzy(int numRules, zto *ruleValues, struct FuzzySet *targets)
{
#warning TODO
}

int dienes_rascher_mean_of_max_fuzzy(int numRules, zto *ruleValues, struct FuzzySet *targets)
{
#warning TODO
}

int dienes_rascher_min_of_max_fuzzy(int numRules, zto *ruleValues, struct FuzzySet *targets)
{
#warning TODO
}

int dienes_rascher_max_of_max_fuzzy(int numRules, zto *ruleValues, struct FuzzySet *targets)
{
#warning TODO
}

int dienes_rascher_centroid_fuzzy(int numRules, zto *ruleValues, struct FuzzySet *targets)
{
#warning TODO
}

int dienes_rascher_center_of_area_fuzzy(int numRules, zto *ruleValues, struct FuzzySet *targets)
{
#warning TODO
}

int lukasiewicz_mean_of_max_fuzzy(int numRules, zto *ruleValues, struct FuzzySet *targets)
{
#warning TODO
}

int lukasiewicz_min_of_max_fuzzy(int numRules, zto *ruleValues, struct FuzzySet *targets)
{
#warning TODO
}

int lukasiewicz_max_of_max_fuzzy(int numRules, zto *ruleValues, struct FuzzySet *targets)
{
#warning TODO
}

int lukasiewicz_centroid_fuzzy(int numRules, zto *ruleValues, struct FuzzySet *targets)
{
#warning TODO
}

int lukasiewicz_center_of_area_fuzzy(int numRules, zto *ruleValues, struct FuzzySet *targets)
{
#warning TODO
}

int fuzzy(int numRules,
          struct FuzzyRule *rules,
          struct FuzzySet *targets,
          enum FuzzyTNorm tnorm,
          enum FuzzyImplication implication,
          enum Defuzzifier defuzzifier)
{
	int i;
	zto ruleValues[numRules];

	for (i = 0; i < numRules; ++i)
		ruleValues[i] = calculateRule(&rules[i], tnorm);

	switch (implication) {
		case FI_MAMDANI:
			switch (defuzzifier) {
				case DF_MEAN_OF_MAX:
					return mamdani_mean_of_max_fuzzy(numRules, ruleValues, targets);
				case DF_MIN_OF_MAX:
					return mamdani_min_of_max_fuzzy(numRules, ruleValues, targets);
				case DF_MAX_OF_MAX:
					return mamdani_max_of_max_fuzzy(numRules, ruleValues, targets);
				case DF_CENTROID:
					return mamdani_centroid_fuzzy(numRules, ruleValues, targets);
				case DF_CENTER_OF_AREA:
					return mamdani_center_of_area_fuzzy(numRules, ruleValues, targets);
			}
			return 0;
		case FI_LARSEN:
			switch (defuzzifier) {
				case DF_MEAN_OF_MAX:
					return larsen_mean_of_max_fuzzy(numRules, ruleValues, targets);
				case DF_MIN_OF_MAX:
					return larsen_min_of_max_fuzzy(numRules, ruleValues, targets);
				case DF_MAX_OF_MAX:
					return larsen_max_of_max_fuzzy(numRules, ruleValues, targets);
				case DF_CENTROID:
					return larsen_centroid_fuzzy(numRules, ruleValues, targets);
				case DF_CENTER_OF_AREA:
					return larsen_center_of_area_fuzzy(numRules, ruleValues, targets);
			}
			return 0;
		case FI_ZADEH:
			switch (defuzzifier) {
				case DF_MEAN_OF_MAX:
					return zadeh_mean_of_max_fuzzy(numRules, ruleValues, targets);
				case DF_MIN_OF_MAX:
					return zadeh_min_of_max_fuzzy(numRules, ruleValues, targets);
				case DF_MAX_OF_MAX:
					return zadeh_max_of_max_fuzzy(numRules, ruleValues, targets);
				case DF_CENTROID:
					return zadeh_centroid_fuzzy(numRules, ruleValues, targets);
				case DF_CENTER_OF_AREA:
					return zadeh_center_of_area_fuzzy(numRules, ruleValues, targets);
			}
			return 0;
		case FI_DIENES_RASCHER:
			switch (defuzzifier) {
				case DF_MEAN_OF_MAX:
					return dienes_rascher_mean_of_max_fuzzy(numRules, ruleValues, targets);
				case DF_MIN_OF_MAX:
					return dienes_rascher_min_of_max_fuzzy(numRules, ruleValues, targets);
				case DF_MAX_OF_MAX:
					return dienes_rascher_max_of_max_fuzzy(numRules, ruleValues, targets);
				case DF_CENTROID:
					return dienes_rascher_centroid_fuzzy(numRules, ruleValues, targets);
				case DF_CENTER_OF_AREA:
					return dienes_rascher_center_of_area_fuzzy(numRules, ruleValues, targets);
			}
			return 0;
		case FI_LUKASIEWICZ:
			switch (defuzzifier) {
				case DF_MEAN_OF_MAX:
					return lukasiewicz_mean_of_max_fuzzy(numRules, ruleValues, targets);
				case DF_MIN_OF_MAX:
					return lukasiewicz_min_of_max_fuzzy(numRules, ruleValues, targets);
				case DF_MAX_OF_MAX:
					return lukasiewicz_max_of_max_fuzzy(numRules, ruleValues, targets);
				case DF_CENTROID:
					return lukasiewicz_centroid_fuzzy(numRules, ruleValues, targets);
				case DF_CENTER_OF_AREA:
					return lukasiewicz_center_of_area_fuzzy(numRules, ruleValues, targets);
			}
			return 0;
	}

	return 0;
}
