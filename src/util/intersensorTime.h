#ifndef INTERSENSOR_TIME_H
#define INTERSENSOR_TIME_H

#include "mlp.h"

#define IST_ETA 0.1 // If too fast will kill nodes

#define NUM_SENSORS 80
#define NUM_SWITCHES 22
#define NUM_TRAINS 5
#define NUM_SPEEDS 14

#define NUM_INPUT_WEIGHTS ((NUM_SENSORS + NUM_SWITCHES + NUM_TRAINS + NUM_SPEEDS) * (NUM_TRAINS + NUM_SPEEDS))
#define NUM_LAYER_WEIGHTS (NUM_SPEEDS + NUM_TRAINS)

typedef struct ISTNetwork {
	float input_weights[NUM_INPUT_WEIGHTS];
	float layer_weights[NUM_LAYER_WEIGHTS]; // Only 1 output
	struct PerceptronNode layer[NUM_LAYER_WEIGHTS];
	struct PerceptronNode output_layer[1];
	NeuralNetwork nn;
	int layerSizes[2];
	struct PerceptronNode *layers[2];
	float *weights[2];
	enum ActivationFunction activators[2];
} ISTNetwork;

struct ISTNetworkInputs {
	int isLast[NUM_SENSORS]; // It is assumed that this sensor was just triggered
	int isCurved[NUM_SWITCHES];
	int isTrain[NUM_TRAINS];
	int isSpeed[NUM_SPEEDS];
};

/* Initializes the intersensor time network.
 *
 * Before calling this the weights in the network should be initialized to
 * either small random values (initially) or the last trained weights.
 *
 * \param[out] n               The network to initialize.
 */
void initIST(struct ISTNetwork *n);

/* Trains the intersensor time network.
 *
 * \param[in,out] n            The network to train.
 * \param[in] inputs           The inputs to train on.
 * \param[in] realOutput       The actual intersensor time, in ticks.
 */
void trainIST(struct ISTNetwork *n, struct ISTNetworkInputs *inputs, int realOutput);

/* Gets a value from the intersensor time network.
 *
 * This can be used to estimate the time it will take the train to get from one
 * sensor to the next.
 *
 * \param[in] n                The network to evaluate.
 * \param[in] inputs           The inputs to the network.
 *
 * \return The estimated intersensor time, in ticks.
 */
int getIST(struct ISTNetwork *n, struct ISTNetworkInputs *inputs);

#endif /* INTERSENSOR_TIME_H */
