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

	for (i = 0; i < NUM_INPUT_WEIGHTS; ++i)
		n.input_weights[i] = float_abs((float)rand(r) / 2147483647.0);

	for (i = 0; i < NUM_LAYER_WEIGHTS; ++i)
		n.layer_weights[i] = float_abs((float)rand(r) / 2147483647.0);

	dumpNetworkState(&n);

	struct ISTNetworkInputs inputs;
	for (i = 0; i < NUM_SENSORS; ++i)
		inputs.isLast[i] = (i ? 1.0f : 0.0f);
	for (i = 0; i < NUM_SWITCHES; ++i)
		inputs.isCurved[i] = (i ? 1.0f : 0.0f);
	for (i = 0; i < NUM_TRAINS; ++i)
		inputs.isTrain[i] = (i ? 1.0f : 0.0f);
	for (i = 0; i < NUM_SPEEDS; ++i)
		inputs.isSpeed[i] = (i ? 1.0f : 0.0f);

	int clock = WhoIs("CLOCK");

	int starttime = Time(clock);
	int t;

	initIST(&n);

	i = 0;
	while ((t = Time(clock)) < (starttime + 100)) {
		trainIST(&n, &inputs, 13); // This converges, 14 diverges!
		dprintf("%d\n\r", getIST(&n, &inputs));
		++i;
	}

	dumpNetworkState(&n);
	dprintf("\n\rGot %d results.\n\r", i);
	Exit();
}
