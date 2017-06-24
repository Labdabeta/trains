#ifndef STOP_NETWORK_H
#define STOP_NETWORK_H

#include "mlp.h"
#include "position.h"

typedef struct SNetwork {

} SNetwork;

struct SNetworkInputs {
	int sensorId;
	int train; /* Which train */
	int speed; /* The steady-state speed */
};

/* Trains the stop network.
 *
 * \param[in,out] n            The network to train.
 * \param[in] inputs           The inputs to train on.
 * \param[in] realOutput       The actual position to issue the stop command at.
 */
void trainS(struct SNetwork *n, struct SNetworkInputs *inputs, struct Position *realOutput);

/* Gets a value from the stop position network.
 *
 * This can be used to estimate when a train must be stopped to arrive at a
 * specified position.
 *
 * \param[in] n                The network to evaluate.
 * \param[in] inputs           The inputs to the network.
 *
 * \return The estimated stop position.
 */
struct Position getS(struct SNetwork *n, struct SNetworkInputs *inputs);

#endif /* STOP_NETWORK_H */
