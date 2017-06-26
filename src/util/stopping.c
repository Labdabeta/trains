#include "stopping.h"

/* Implicitly defined to aid in unit testing. */
void Pass(void);

void initStopCalculator(StopCalculator *sc, PositionCalculator *pc)
{
	initS(&sc->n);
	sc->pc = pc;
}

void registerAccurateStopPosition(StopCalculator *sc, int sensor, int train, int speed, int time)
{
	int i;

	// Load the neural input
	struct SNetworkInputs inputs;
	for (i = 0; i < NUM_SENSORS; ++i)
		inputs.isStop[i] = (i == sensor ? 1.0f : 0.0f);
	for (i = 0; i < NUM_SWITCHES; ++i)
		inputs.isCurved[i] = (sc->pc->switches & (1 << i) ? 1.0f : 0.0f);
	for (i = 0; i < NUM_TRAINS; ++i)
		inputs.isTrain[i] = (i == train ? 1.0f : 0.0f);
	for (i = 0; i < NUM_SPEEDS; ++i)
		inputs.isSpeed[i] = (i == speed ? 1.0f : 0.0f);

	// Learn it
	trainS(&sc->n, &inputs, time);
}

struct Position getStopPosition(StopCalculator *sc, struct Position pos, int train)
{
	int i;
	struct SNetworkInputs inputs;
	for (i = 0; i < NUM_SENSORS; ++i)
		inputs.isStop[i] = (i == pos.sensorId ? 1.0f : 0.0f);
	for (i = 0; i < NUM_SWITCHES; ++i)
		inputs.isCurved[i] = (sc->pc->switches & (1 << i) ? 1.0f : 0.0f);
	for (i = 0; i < NUM_TRAINS; ++i)
		inputs.isTrain[i] = (i == train ? 1.0f : 0.0f);

	/* We assume that by the time we want to stop, the train will have achieved
	 * desired speed. */
	for (i = 0; i < NUM_SPEEDS; ++i)
		inputs.isSpeed[i] = (i == sc->pc->newSpeed[train] ? 1.0f : 0.0f);

	int t = getS(&sc->n, &inputs);

// General strategy:
// use network on the reference sensor to get a time.
// compute distance to stop to hit sensor.
// use fuzzy logic to convert computed distance to an actual position for the
// real position argument.
#warning TODO: use the network, position, fuzzy logic, and track data to determine a stop position
	struct Position ret;
	ret.distance = -t;
	ret.sensorId = pos.sensorId;
	return ret;
}
