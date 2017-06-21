#ifndef POSITION_H
#define POSITION_H

#include "intersensorTime.h"
#include "track_data.h"

typedef struct PositionCalculator {

} PositionCalculator;

struct Position {
	int distance;
	struct track_node *reference;
};

void registerSensorTrigger(PositionCalculator *pc, int sensor, int train, int time);
void registerSwitchState(PositionCalculator *pc, int sw, int state);
void learnPositions(PositionCalculator *pc);
struct Position getPosition(PositionCalculator *pc, int train);
int getExpectedNextSensorTime(PositionCalculator *pc, int time);

#endif /* POSITION_H */
