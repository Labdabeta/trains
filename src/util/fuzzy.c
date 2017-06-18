#include "fuzzy.h"
#include "zto.h"

#define INT_MAX 0x7FFFFFFF
#define INT_MIN 0x80000000

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

static zto calculateMembershipRange(struct FuzzySet *set, zto min, zto max, int val)
{
	if (val < set->support.left)
		return min;
	else if (val < set->core.left) /* f(x) = ((max-min)/(c.l-s.l))(x-s.l)+min */
		return ztoMultiply(
				ztoMul(
					ztoSub(max,min),
					ztoInverse(set->core.left - set->support.left)),
				val - set->support.left);
	else if (val < set->core.right)
		return max;
	else if (val < set->support.right)
		return ztoMultiply(
				ztoMul(
					ztoSub(max,min),
					ztoInverse(set->support.right - set->core.left)),
				set->support.right - val);
	else
		return min;
}

static zto fuzzy_snorm(zto a, zto b, enum FuzzyTNorm tnorm)
{
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
	return zto_one;
}

static zto fuzzy_tnorm(zto a, zto b, enum FuzzyTNorm tnorm)
{
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
			return fuzzy_snorm(a, b, tnorm);
		case FRT_AND:
			a = calculateRule(rule->args.left, tnorm);
			b = calculateRule(rule->args.right, tnorm);
			return fuzzy_tnorm(a, b, tnorm);
		case FRT_NOT:
			return ztoInvert(calculateRule(rule->arg.rule, tnorm));
	}

	return zto_zero;
}

/* These functions apply the implication rules to each target set using the
 * values as the lhs of the implication. */
static void mamdani_fuzzy(int numRules, zto *ruleValues, struct FuzzySet *targets, struct FuzzySet *inferredTargets, zto *inferredMaxes, zto *inferredMins)
{
	int r;

	for (r = 0; r < numRules; ++r) {
		/* supports don't change under mamdani */
		inferredTargets[r].support.left = targets[r].support.left;
		inferredTargets[r].support.right = targets[r].support.right;

		/* the max value is the minimum of the rule value and max */
		inferredMaxes[r] = ruleValues[r];
		inferredMins[r] = zto_zero;

		/* now the hard part, what is the truncated core */
		inferredTargets[r].core.left = ztoTimes(ruleValues[r], targets[r].core.left - targets[r].support.left) + targets[r].support.left;
		inferredTargets[r].core.right = targets[r].support.right - ztoTimes(ruleValues[r], targets[r].support.right - targets[r].core.right);
	}
}

static void larsen_fuzzy(int numRules, zto *ruleValues, struct FuzzySet *targets, struct FuzzySet *inferredTargets, zto *inferredMaxes, zto *inferredMins)
{
	int r;

	for (r = 0; r < numRules; ++r) {
		/* supports don't change under larsen */
		inferredTargets[r].support.left = targets[r].support.left;
		inferredTargets[r].support.right = targets[r].support.right;

		/* the max value is the minimum of the rule value and max */
		inferredMaxes[r] = ruleValues[r];
		inferredMins[r] = zto_zero;

		/* cores don't change x positions under larsen */
		inferredTargets[r].core.left = targets[r].core.left;
		inferredTargets[r].core.right = targets[r].core.right;
	}
}

static void zadeh_fuzzy(int numRules, zto *ruleValues, struct FuzzySet *targets, struct FuzzySet *inferredTargets, zto *inferredMaxes, zto *inferredMins)
{
	int r;

	for (r = 0; r < numRules; ++r) {
		/* the min value is 1-rule value */
		inferredMins[r] = ztoInvert(ruleValues[r]);
		inferredMaxes[r] = ruleValues[r];

		/* supports shrink to fit under zadeh */
		inferredTargets[r].support.left = ztoTimes(ruleValues[r], targets[r].support.left - targets[r].core.left) + targets[r].core.left;
		inferredTargets[r].support.right = ztoTimes(ruleValues[r], targets[r].support.right - targets[r].core.right) + targets[r].core.right;

		/* cores expand to fit under zadeh - identical to mamdani */
		inferredTargets[r].core.left = ztoTimes(ruleValues[r], targets[r].core.left - targets[r].support.left) + targets[r].support.left;
		inferredTargets[r].core.right = targets[r].support.right - ztoTimes(ruleValues[r], targets[r].support.right - targets[r].core.right);
	}
}

static void dienes_rascher_fuzzy(int numRules, zto *ruleValues, struct FuzzySet *targets, struct FuzzySet *inferredTargets, zto *inferredMaxes, zto *inferredMins)
{
	int r;

	for (r = 0; r < numRules; ++r) {
		/* the min value is 1-rule value */
		inferredMins[r] = ztoInvert(ruleValues[r]);

		/* the max value is a full 1 under dienes-rascher */
		inferredMaxes[r] = zto_one;

		/* supports shrink to fit under dienes-rascher */
		inferredTargets[r].support.left = ztoTimes(ruleValues[r], targets[r].support.left - targets[r].core.left) + targets[r].core.left;
		inferredTargets[r].support.right = ztoTimes(ruleValues[r], targets[r].support.right - targets[r].core.right) + targets[r].core.right;

		/* core stays the same under diene-rascher */
		inferredTargets[r].core.left = targets[r].core.left;
		inferredTargets[r].core.right = targets[r].core.right;
	}
}

static void lukasiewicz_fuzzy(int numRules, zto *ruleValues, struct FuzzySet *targets, struct FuzzySet *inferredTargets, zto *inferredMaxes, zto *inferredMins)
{
	int r;

	for (r = 0; r < numRules; ++r) {
		/* the min value is 1-rule value */
		inferredMins[r] = ztoInvert(ruleValues[r]);

		/* the max value is a full 1 under lukasiewicz */
		inferredMaxes[r] = zto_one;

		/* supports don't change under lukasiewicz */
		inferredTargets[r].support.left = ztoTimes(ruleValues[r], targets[r].support.left - targets[r].core.left) + targets[r].core.left;
		inferredTargets[r].support.right = ztoTimes(ruleValues[r], targets[r].support.right - targets[r].core.right) + targets[r].core.right;

		/* cores expand to fit under lukasiewicz - identical to mamdani */
		inferredTargets[r].core.left = ztoTimes(ruleValues[r], targets[r].core.left - targets[r].support.left) + targets[r].support.left;
		inferredTargets[r].core.right = ztoTimes(ruleValues[r], targets[r].core.right - targets[r].support.right) - targets[r].support.right;
	}
}
static void fuzzy_union(int numRules,
                        struct FuzzySet *inferredTargets,
                        zto *inferredMaxes,
                        zto *inferredMins,
                        int *xbuf,
                        zto *ybuf,
                        int *bufsize,
                        enum FuzzyTNorm tnorm)
{
	int r;
	int xcoord = INT_MIN;
	zto ycoord = zto_zero;
	*bufsize = 0;

	for (ever) {
		/* Find next-smallest coordinate in the rules. */
		int found = INT_MAX;
		for (r = 0; r < numRules; ++r) {
			if (inferredTargets[r].support.left > xcoord && inferredTargets[r].support.left < found)
				found = inferredTargets[r].support.left;
			if (inferredTargets[r].core.left > xcoord && inferredTargets[r].core.left < found)
				found = inferredTargets[r].core.left;
			if (inferredTargets[r].core.right > xcoord && inferredTargets[r].core.right < found)
				found = inferredTargets[r].core.right;
			if (inferredTargets[r].support.right > xcoord && inferredTargets[r].support.right < found)
				found = inferredTargets[r].support.right;
		}

		if (found == INT_MAX || found == INT_MIN) break;

		xcoord = found;

		/* Process the value at xcoord. */
		ycoord = 0; /* x OR 0 = x so this is a safe initial value */
		for (r = 0; r < numRules; ++r) {
			zto membership = calculateMembershipRange(&inferredTargets[r], inferredMins[r], inferredMaxes[r], xcoord);
			ycoord = fuzzy_snorm(ycoord, membership, tnorm);
		}

		xbuf[*bufsize] = xcoord;
		ybuf[(*bufsize)++] = ycoord;
	}
}

static int mean_of_max(int *xs, zto *ys, int bufsize)
{
	/* Takes the means of all of the maximal points, not maximal lines. */
	int i;
	zto max = zto_zero;
	int nummaxes = 0;
	int maxsum = 0;

	for (i = 0; i < bufsize; ++i) {
		if (ys[i] > max) {
			max = ys[i];
			nummaxes = 1;
			maxsum = xs[i];
		} else if (ys[i] == max) {
			nummaxes++;
			maxsum += xs[i];
		}
	}

	return maxsum / nummaxes;
}

static int min_of_max(int *xs, zto *ys, int bufsize)
{
	int i;
	int mx = 0;
	zto max = zto_zero;

	for (i = 0; i < bufsize; ++i) {
		if (ys[i] > max) {
			max = ys[i];
			mx = xs[i];
		}
	}

	return mx;
}

static int max_of_max(int *xs, zto *ys, int bufsize)
{
	int i;
	int mx = 0;
	zto max = zto_zero;

	for (i = 0; i < bufsize; ++i) {
		if (ys[i] >= max) {
			max = ys[i];
			mx = xs[i];
		}
	}

	return mx;
}

static int centroid(int *xs, zto *ys, int bufsize)
{
	int i;
	int integral = 0; /* of f(x) */
	int cintegral = 0; /* of xf(x) */
	zto lastVal = ys[0];

	/* NOTE: these integrals lose too much precision, they must be made more
	 * precise. */
	for (i = 1; i < bufsize; ++i) {
		int init = xs[i-1];
		int width = xs[i] - xs[i-1];
		if (ys[i] == lastVal) { /* Rectangle */
			int area = ztoTimes(lastVal, width);
			integral += area;
			cintegral += area * init; /* next also add the triangle... */
			cintegral += ztoTimes(ztoSub(ys[i], lastVal), width) >> 1;
		} else { /* Triangle */
			zto height = (ys[i] > lastVal ? ys[i] : lastVal);
			zto smaller = (ys[i] < lastVal ? ys[i] : lastVal);
			integral += ztoTimes(lastVal, width) >> 1;
			cintegral += ztoTimes(smaller, width) * init;
			cintegral += ztoTimes(ztoSub(height, smaller), width) >> 1;
		}
	}

	return cintegral / integral;
}

static int center_of_area(int *xs, zto *ys, int bufsize)
{
	return 0; // TODO: return x | integrate(f(x),-oo,x) == integrate(f(x),x,oo)
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
	struct FuzzySet inferredTargets[numRules];
	zto inferredMaxes[numRules];
	zto inferredMins[numRules];

	for (i = 0; i < numRules; ++i)
		ruleValues[i] = calculateRule(&rules[i], tnorm);

	switch (implication) {
		case FI_MAMDANI:
			mamdani_fuzzy(numRules, ruleValues, targets, inferredTargets, inferredMaxes, inferredMins);
			break;
		case FI_LARSEN:
			larsen_fuzzy(numRules, ruleValues, targets, inferredTargets, inferredMaxes, inferredMins);
			break;
		case FI_ZADEH:
			zadeh_fuzzy(numRules, ruleValues, targets, inferredTargets, inferredMaxes, inferredMins);
			break;
		case FI_DIENES_RASCHER:
			dienes_rascher_fuzzy(numRules, ruleValues, targets, inferredTargets, inferredMaxes, inferredMins);
			break;
		case FI_LUKASIEWICZ:
			lukasiewicz_fuzzy(numRules, ruleValues, targets, inferredTargets, inferredMaxes, inferredMins);
			break;
	}

	int xbuf[4 * numRules];
	zto ybuf[4 * numRules];
	int bufsize = 4 * numRules;

	fuzzy_union(numRules, inferredTargets, inferredMaxes, inferredMins, xbuf, ybuf, &bufsize, tnorm);

	switch (defuzzifier) {
		case DF_MEAN_OF_MAX:
			return mean_of_max(xbuf, ybuf, bufsize);
		case DF_MIN_OF_MAX:
			return min_of_max(xbuf, ybuf, bufsize);
		case DF_MAX_OF_MAX:
			return max_of_max(xbuf, ybuf, bufsize);
		case DF_CENTROID:
			return centroid(xbuf, ybuf, bufsize);
		case DF_CENTER_OF_AREA:
			return center_of_area(xbuf, ybuf, bufsize);
	}
	return 0;
}
