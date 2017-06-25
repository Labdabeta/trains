#include "stopNetwork.h"

#define DILATION_RATE 100.0

void initS(struct SNetwork *n)
{
    n->layerSizes[0] = NUM_LAYER_WEIGHTS;
    n->layerSizes[1] = 1;
    n->layers[0] = n->layer;
    n->layers[1] = n->output_layer;
    n->weights[0] = n->input_weights;
    n->weights[1] = n->layer_weights;
    n->activators[0] = AF_LINEAR;
    n->activators[1] = AF_RELU;
    mlpInit(&n->nn, NUM_SENSORS + NUM_TRAINS + NUM_SPEEDS,
            2, n->layerSizes, n->activators, n->layers, n->weights);
}

void trainS(struct SNetwork *n, struct SNetworkInputs *inputs, int realOutput)
{
    int i;
	float input[NUM_SENSORS + NUM_SWITCHES + NUM_TRAINS + NUM_SPEEDS];
	for (i = 0; i < NUM_SENSORS_PER_CLUSTER; ++i)
		input[i] = (inputs->isLastA & (1 << i) ? 1.0 : 0.0);
	for (i = 0; i < NUM_SENSORS_PER_CLUSTER; ++i)
		input[i] = (inputs->isLastB & (1 << i) ? 1.0 : 0.0);
	for (i = 0; i < NUM_SENSORS_PER_CLUSTER; ++i)
		input[i] = (inputs->isLastC & (1 << i) ? 1.0 : 0.0);
	for (i = 0; i < NUM_SENSORS_PER_CLUSTER; ++i)
		input[i] = (inputs->isLastD & (1 << i) ? 1.0 : 0.0);
	for (i = 0; i < NUM_SENSORS_PER_CLUSTER; ++i)
		input[i] = (inputs->isLastE & (1 << i) ? 1.0 : 0.0);
	for (i = 0; i < NUM_SWITCHES; ++i)
		input[i + NUM_SENSORS] = (inputs->isCurved & (1 << i) ? 1.0 : 0.0);
	for (i = 0; i < NUM_TRAINS; ++i)
		input[i + NUM_SENSORS + NUM_SWITCHES] = (inputs->isTrain & (1 << i) ? 1.0 : 0.0);
	for (i = 0; i < NUM_SPEEDS; ++i)
		input[i + NUM_SENSORS + NUM_SWITCHES + NUM_TRAINS] = (inputs->isSpeed & (1 << i) ? 1.0 : 0.0);

    float real = (float)realOutput / DILATION_RATE;
    network_train(&n->nn, input, 0, &real, STOP_ETA);
}

int getS(struct SNetwork *n, struct SNetworkInputs *inputs)
{
    int i;
	float input[NUM_SENSORS + NUM_SWITCHES + NUM_TRAINS + NUM_SPEEDS];
	for (i = 0; i < NUM_SENSORS_PER_CLUSTER; ++i)
		input[i] = (inputs->isLastA & (1 << i) ? 1.0 : 0.0);
	for (i = 0; i < NUM_SENSORS_PER_CLUSTER; ++i)
		input[i] = (inputs->isLastB & (1 << i) ? 1.0 : 0.0);
	for (i = 0; i < NUM_SENSORS_PER_CLUSTER; ++i)
		input[i] = (inputs->isLastC & (1 << i) ? 1.0 : 0.0);
	for (i = 0; i < NUM_SENSORS_PER_CLUSTER; ++i)
		input[i] = (inputs->isLastD & (1 << i) ? 1.0 : 0.0);
	for (i = 0; i < NUM_SENSORS_PER_CLUSTER; ++i)
		input[i] = (inputs->isLastE & (1 << i) ? 1.0 : 0.0);
	for (i = 0; i < NUM_SWITCHES; ++i)
		input[i + NUM_SENSORS] = (inputs->isCurved & (1 << i) ? 1.0 : 0.0);
	for (i = 0; i < NUM_TRAINS; ++i)
		input[i + NUM_SENSORS + NUM_SWITCHES] = (inputs->isTrain & (1 << i) ? 1.0 : 0.0);
	for (i = 0; i < NUM_SPEEDS; ++i)
		input[i + NUM_SENSORS + NUM_SWITCHES + NUM_TRAINS] = (inputs->isSpeed & (1 << i) ? 1.0 : 0.0);

    float output;
    network_value(&n->nn, input, &output);

    return (int)(output * DILATION_RATE);
}
