#ifndef STOP_NETWORK_H
#define STOP_NETWORK_H

#include "mlp.h"

#define STOP_ETA 0.01

#define NUM_SENSORS 80
#define NUM_SENSORS_PER_CLUSTER 0x10
#define NUM_SWITCHES 22
#define NUM_TRAINS 6
#define NUM_SPEEDS 14

#define NUM_INPUT_WEIGHTS ((NUM_SENSORS + NUM_SWITCHES + NUM_TRAINS + NUM_SPEEDS) * (NUM_TRAINS + NUM_SPEEDS))
#define NUM_LAYER_WEIGHTS (NUM_SPEEDS + NUM_TRAINS)

/* Note: I would love to combine this into the IST network as they can share
 * most of their nodes. However we can't train them together so unless we
 * carefully trim nodes I think its better to leave them completely separate.
 * As a bonus the parameters are completely separate so we can train the two
 * differently for better performance. */
typedef struct SNetwork {
	float input_weights[NUM_INPUT_WEIGHTS];
	float layer_weights[NUM_LAYER_WEIGHTS];
	struct PerceptronNode layer[NUM_LAYER_WEIGHTS];
	struct PerceptronNode output_layer[1];
	NeuralNetwork nn;
	int layerSizes[2];
	struct PerceptronNode *layers[2];
	float *weights[2];
	enum ActivationFunction activators[2];
} SNetwork;

struct SNetworkInputs {
	float isStop[NUM_SENSORS];
	float isCurved[NUM_SWITCHES];
	float isTrain[NUM_TRAINS];
	float isSpeed[NUM_SPEEDS];
};

/* Initializes the stop network.
 *
 * Before calling this the weights in the network should be initialized to
 * either small random values (initially) or the last trained weights.
 *
 * \param[out] n               The network to initialize.
 */
void initS(struct SNetwork *n);

/* Trains the stop network.
 *
 * \param[in,out] n            The network to train.
 * \param[in] inputs           The inputs to train on.
 * \param[in] realOutput       The actual -ve time to issue the stop command at.
 */
void trainS(struct SNetwork *n, struct SNetworkInputs *inputs, int realOutput);

/* Gets a value from the stop position network.
 *
 * This can be used to estimate when a train must be stopped to arrive at a
 * specified position.
 *
 * \param[in] n                The network to evaluate.
 * \param[in] inputs           The inputs to the network.
 *
 * \return The estimated stop time before sensor trigger.
 */
int getS(struct SNetwork *n, struct SNetworkInputs *inputs);

#endif /* STOP_NETWORK_H */
