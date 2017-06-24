#ifndef STOPPING_H
#define STOPPING_H

#include "stopNetwork.h"
#include "position.h"

#define EPOCH_SIZE 0x10

struct StopDatum {
	struct SNetworkInputs value;
	struct Position answer;
};

typedef struct StopCalculator {

} StopCalculator;

void initStopCalculator(StopCalculator *sc, PositionCalculator *pc);
void registerAccurateStopPosition(StopCalculator *sc, int sensor, int train, int speed, struct Position pos);
void learnStops(StopCalculator *sc);
struct Position getStopPosition(StopCalculator *sc, struct Position pos, int train);

#endif /* STOPPING_H */
