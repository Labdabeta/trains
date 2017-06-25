#include "position.h"
#include "fuzzy.h"

/* Implicitly defined to aid in unit testing. */
void Pass(void);

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
}

int registerSensorTrigger(PositionCalculator *pc, int sensor, int train, int time)
{
	// Determine the delta
	int delta = 0;
	if (pc->expectedTimes[train] != -1)
		delta = time - pc->expectedTimes[train];

	// Load the neural input
	struct ISTNetworkInputs inputs;
	if (sensor > 0x40)
		inputs.isLastE = 1 << (sensor & 0xF);
	else if (sensor > 0x30)
		inputs.isLastD = 1 << (sensor & 0xF);
	else if (sensor > 0x20)
		inputs.isLastC = 1 << (sensor & 0xF);
	else if (sensor > 0x10)
		inputs.isLastB = 1 << (sensor & 0xF);
	else
		inputs.isLastA = 1 << (sensor & 0xF);
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

void registerTrainSpeed(PositionCalculator *pc, int train, int speed, int time)
{
	pc->newSpeed[train] = speed;
	pc->newSpeedTime[train] = time;
}

void registerSwitchState(PositionCalculator *pc, int sw, int isCurved)
{
	if (isCurved)
		pc->switches |= 1 << sw;
	else
		pc->switches &= ~(1 << sw);
}

void learnPositions(PositionCalculator *pc)
{
	int i;
	for (i = 0; i < pc->history_size; ++i) {
		int idx = pc->history_idx + i;
		trainIST(&pc->n, &pc->history[idx % EPOCH_SIZE].value, pc->history[idx % EPOCH_SIZE].time);
		Pass();
	}
}

struct Position getPosition(PositionCalculator *pc, int train, int time)
{
	int expected = pc->expectedTimes[train];
	int initial = pc->initTimes[train];

	// (time - initial) / expected
	struct Position pos;
	pos.distance = (1000 * (time - initial)) / expected;
	pos.sensorId = pc->lastSensor[train];
	return pos;
#warning TODO: use fuzzy logic on expected, initial, and time to get a position
}

int getExpectedNextSensorTime(PositionCalculator *pc, int train)
{
	return pc->expectedTimes[train];
}

ISTNetwork *getPositionNetworkReference(PositionCalculator *pc)
{
	return &pc->n;
}
