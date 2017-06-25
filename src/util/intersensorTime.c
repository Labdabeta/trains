#include "intersensorTime.h"

/* time of 1 = 1 / DILATION_RATE ticks */
#define DILATION_RATE 100.0

void initIST(struct ISTNetwork *n)
{
	n->layerSizes[0] = NUM_LAYER_WEIGHTS;
	n->layerSizes[1] = 1;
	n->layers[0] = n->layer;
	n->layers[1] = n->output_layer;
	n->weights[0] = n->input_weights;
	n->weights[1] = n->layer_weights;
	n->activators[0] = AF_LINEAR;
	n->activators[1] = AF_LINEAR;
	mlpInit(&n->nn, NUM_SENSORS + NUM_SWITCHES + NUM_TRAINS + NUM_SPEEDS,
			2, n->layerSizes, n->activators, n->layers, n->weights);
}

void trainIST(struct ISTNetwork *n, struct ISTNetworkInputs *inputs, int realOutput)
{
	float real = (float)realOutput / DILATION_RATE;
	network_train(&n->nn, (float*)inputs, 0, &real, IST_ETA);
}

int getIST(struct ISTNetwork *n, struct ISTNetworkInputs *inputs)
{
	float output;
	network_value(&n->nn, (float*)inputs, &output);

	return (int)(output * DILATION_RATE);
}
