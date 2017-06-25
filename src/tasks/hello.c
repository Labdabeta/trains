// Prints whatever is typed to the trains
// Prints train input to cout
// in unix syntax: cin > tout; tin > cout
#include "tasks.h"
#include "fuzzy.h"
#include "rand.h"
#include "intersensorTime.h"

static void dumpNetworkState(ISTNetwork *n)
{
	int i;
	dprintf("Network state:\n\r");

	dprintf("input_weights[] = {");
	for (i = 0; i < NUM_INPUT_WEIGHTS; ++i)
		dprintf("0x%x,",n->input_weights[i]);

	dprintf("\n\rlayer1_weights[] = {");
	for (i = 0; i < NUM_LAYER_WEIGHTS; ++i)
		dprintf("0x%x,",n->layer_weights[i]);
}

static float float_abs(float x) { if (x < 0.0) return -x; return x; }

void hello()
{
	int i;
	int r = 10;
	ISTNetwork n;
	struct ISTNetworkInputs ni;

	for (i = 0; i < NUM_INPUT_WEIGHTS; ++i)
		n.input_weights[i] = float_abs((float)rand(r) / 2147483647.0);

	for (i = 0; i < NUM_LAYER_WEIGHTS; ++i)
		n.layer_weights[i] = float_abs((float)rand(r) / 2147483647.0);

	dumpNetworkState(&n);

	ni.isLastA = 1;
	ni.isLastB = 0;
	ni.isLastC = 0;
	ni.isLastD = 0;
	ni.isLastE = 0;
	ni.isCurved = 0;
	ni.isTrain = 1;
	ni.isSpeed = 1;

	int clock = WhoIs("CLOCK");

	int starttime = Time(clock);
	int t;

	initIST(&n);

	i = 0;
	while ((t = Time(clock)) < (starttime + 100)) {
		trainIST(&n, &ni, 13); // This converges, 14 diverges!
		dprintf("%d\n\r", getIST(&n, &ni));
		++i;
	}

	dumpNetworkState(&n);
	dprintf("\n\rGot %d results.\n\r", i);
	Exit();
}
