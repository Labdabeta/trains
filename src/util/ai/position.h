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
	unsigned int switches : NUM_SWITCHES;

	// history is a circular buffer of data
	struct PositionDatum history[EPOCH_SIZE];
	int history_size;
	int history_idx;
} PositionCalculator;

struct Position {
	int distance; /* in ticks since tripping (or until tripping if negative)! */
	int sensorId;
};

/* Initializes the position calculator.
 *
 * This must be called before calling any of the other PC actions on the object.
 * The object itself must already be statically allocated.
 *
 * \param[out] pc              The calculator to initialize.
 */
void initPositionCalculator(PositionCalculator *pc);

/* Registers a sensor trip.
 *
 * This registers the actual datapoint of the given train hitting the given
 * sensor at the given time.
 *
 * This function can be told to learn from the datapoint or not. Only learn from
 * the point if it is a fairly steady-state characteristic point. Do not learn
 * if, for example, the train had been stopped between the previous sensor and
 * this one before activating this one again.
 *
 * \param[in,out] pc           The PC to use.
 * \param[in] sensor           The sensor that was tripped.
 * \param[in] train            The train that tripped it.
 * \param[in] time             The time at which the train tripped it.
 * \param[in] learn            If nonzero the network will learn from this point.
 *
 * \return The difference between this sensor trip and what the network
 * predicted.
 */
int registerSensorTrigger(PositionCalculator *pc, int sensor, int train, int time, int learn);

/* Registers a train speed set.
 *
 * This should be called whenever a train's speed has been set to a particular
 * value.
 *
 * \param[in,out] pc           The PC to use.
 * \param[in] train            The train whose speed was set.
 * \param[in] speed            The speed to which the train was set.
 * \param[in] time             The time at which the train's speed was set.
 */
void registerTrainSpeed(PositionCalculator *pc, int train, int speed, int time);

/* Registers a switch being set.
 *
 * This should be called whenever a switch's state has been set.
 *
 * \param[in,out] pc           The PC to use.
 * \param[in] sw               The 0-indexed switch which was set.
 * \param[in] isCurved         If nonzero indicates the switch was set to
 *                              curved, otherwise indicates it was set to
 *                              straight.
 */
void registerSwitchState(PositionCalculator *pc, int sw, int isCurved);

/* Trains the neural network on recent sensor activations.
 *
 * This is a computationally heavy process that calls Pass numerous times so as
 * to prevent starvation of critical processes.
 *
 * \param[in,out] pc           The PC to learn.
 */
void learnPositions(PositionCalculator *pc);

/* Guesses at the current whereabouts of the given train.
 *
 * This returns a position struct whose data is calculated from a connectionist
 * multilayer perceptron taught with the gradient descent backpropogation
 * algorithm and a fuzzy logic inferencing system applied to its output.
 *
 * \param[in] pc               The PC to use.
 * \param[in] train            Which train's position to query.
 * \param[in] time             The current time.
 *
 * \return The estimated position of the train.
 */
struct Position getPosition(PositionCalculator *pc, int train, int time);

/* Guesses at when the next sensor will be tripped by the given train.
 *
 * This can be used to grab a single value from the neural network or just to
 * predict train position.
 *
 * \param[in] pc               The PC to use.
 * \param[in] train            The train whose next sensor time to query.
 *
 * \return The number of ticks expected to elapse before the given train trips a
 * sensor.
 */
int getExpectedNextSensorTime(PositionCalculator *pc, int train);

/* Provides access to the network underlying the position calculator.
 *
 * This can be used to extract information from the network directly.
 *
 * \param[in] pc               The PC to use.
 *
 * \return The underlying neural network of the calculator.
 */
ISTNetwork *getPositionNetworkReference(PositionCalculator *pc);

/* Provides access to the fuzzy logic underlying speed interpolation.
 *
 * This provides a guess as to the current effective speed of the train based on
 * its last known speed and when its speed was last changed. It returns a
 * superposition of which spees are somewhat active in the provided buffer.
 *
 * \param[in] pc               The PC to use.
 * \param[in] train            The train whose effective speed to query.
 * \param[in] time             The current time.
 * \param[out] buf             A buffer of NUM_SPEEDS floats to store the speeds
 * in.
 */
void getEffectiveSpeeds(PositionCalculator *pc, int train, int time, float *buf);

#endif /* POSITION_H */
