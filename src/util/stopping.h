#ifndef STOPPING_H
#define STOPPING_H

#include "stopNetwork.h"
#include "position.h"

typedef struct StopCalculator {
	PositionCalculator *pc;
	SNetwork n;
} StopCalculator;

/* Initializes the stop calculator.
 *
 * This must be called before calling any of the other SC actions on the object.
 * The object itself must already be statically allocated.
 *
 * \param[out] sc              The calculator to initialize.
 */
void initStopCalculator(StopCalculator *sc, PositionCalculator *pc);

/* Registers a new stop time.
 *
 * This registers the actual datapoint of the given train stopping on the given
 * switch from the given initial speed by sending the stop command a given time
 * in advance.
 *
 * This wraps a call to train a neural network, as such it is very
 * computationally expensive.
 *
 * \param[in,out] sc           The SC to use.
 * \param[in] sensor           The sensor stopped on.
 * \param[in] train            The train which stopped.
 * \param[in] speed            The trains speed when the stop command was given.
 * \param[in] time             The time it took the train to stop.
 */
void registerAccurateStopTime(StopCalculator *sc, int sensor, int train, int speed, int time);

/* Make sure you keep the underlying position calculator up to date! */

/* Guesses at the position a train must be stopped at to stop where desired.
 *
 * This uses a conservative fuzzy logic system to determine a position. As such
 * once the train passes that position it is safe to begin stopping to try to
 * stop where desired.
 *
 * \param[in] sc               The SC to use.
 * \param[in] pos              The position desired to stop at.
 * \param[in] train            The train to stop there.
 *
 * \return The position at which to stop the train.
 */
struct Position getStopPosition(StopCalculator *sc, struct Position pos, int train);

#endif /* STOPPING_H */
