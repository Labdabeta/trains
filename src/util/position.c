#include "position.h"
#include "fuzzy.h"

void initPositionCalculator(PositionCalculator *pc)
{
	int i;

	for (i = 0; i < NUM_TRAINS; ++i) {
		pc->lastSensor[i] = -1;
		pc->speed[i] = 0;
		pc->newSpeed[i] = 0;
		pc->newSpeedTime[i] = 0;
		pc->expectedTimes[i] = -1;
		pc->initTimes[i] = -1;
	}

	initIST(&pc->n);

	pc->history_size = 0;
	pc->cs_tid = WhoIs("CLOCK");
}

int registerSensorTrigger(PositionCalculator *pc, int sensor, int train, int time)
{
	// Determine the delta
	int delta = 0;
	if (pc->expectedTimes[i] != -1)
		delta = time - pc->expectedTimes[i];

	// Load the neural input
	struct ISTNetworkInputs inputs;
	inputs.isLast = 1 << sensor;
	inputs.isCurved = pc->switches;
	inputs.isTrain = 1 << train;
#warning TODO: use fuzzy logic on newSpeed|newSpeedTime|speed to get (and maybe update) a speed
	inputs.isSpeed = 1 << pc->speed[train];

	int exptime = getIST(&pc->n, &inputs);
	pc->expectedTimes[train] = exptime + time;

	// Should we add this to the training history?
	if (pc->lastSensor[train] >= 0) {
		int idx = (pc->history_size + pc->history_idx) % EPOCH_SIZE;
		pc->history[idx].value = inputs;
		pc->history[idx].time = time - pc->initTimes[train];
	}

	pc->initTimes[train] = time;
	pc->lastSensor[train] = sensor;

	// Return the delta
	return delta;
}
