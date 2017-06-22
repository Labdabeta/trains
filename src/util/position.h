#ifndef POSITION_H
#define POSITION_H

#include "intersensorTime.h"

#define EPOCH_SIZE 0x10

struct PositionDatum {
	struct ISTNetworkInputs value;
	int time;
};

typedef struct PositionCalculator {
	ISTNetwork n;
	int lastSensor[NUM_TRAINS];
	int speed[NUM_TRAINS];
	int newSpeed[NUM_TRAINS]; // This is copied over to speed using fuzzy logic
	int newSpeedTime[NUM_TRAINS]; // This is the time since the new speed was set
	int expectedTimes[NUM_TRAINS];
	int initTimes[NUM_TRAINS];
	unsigned int switches : NUM_SENSORS;

	// history is a circular buffer of data
	struct PositionDatum history[EPOCH_SIZE];
	int history_size;
	int history_idx;

	int cs_tid; // Clock server TID
} PositionCalculator;

struct Position {
	int distance;
	int sensorId;
};

void initPositionCalculator(PositionCalculator *pc);
/* Returns delta from expected. */
int registerSensorTrigger(PositionCalculator *pc, int sensor, int train, int time);
void registerTrainSpeed(PositionCalculator *pc, int train, int speed);
void registerSwitchState(PositionCalculator *pc, int sw, int isCurved);
void learnPositions(PositionCalculator *pc);
struct Position getPosition(PositionCalculator *pc, int train);
int getExpectedNextSensorTime(PositionCalculator *pc, int time);

#endif /* POSITION_H */
