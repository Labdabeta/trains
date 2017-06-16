#include "mlp.h"

double log(double);
double pow(double,double);
/* Euler's constant */
#define M_E 	2.71828182845904523536

/* softmax is the integral of sigmoid */
double softmax(double x) {
    double ret = log(1 + pow(M_E, x));
    if (ret != ret)
        return 0.0;
    return ret;
}

double sigmoid(double x) {
    double ret = 1.0 / (1.0 + pow(M_E, -x));
    if (ret != ret)
        return 0.0;
    return ret;
}

double dsigmoid(double x) { return sigmoid(x)*(1.0-sigmoid(x)); }
double rectifier(double x) { return (x < 0) ? 0 : x; }
double step(double x) { return (x < 0) ? 0 : 1; }
double identity(double x) { return x; }
double unity(double x) { return 1.0; }


void mlpInit(NeuralNetwork *nn, int numInputs, int numLayers, int *layerSizes, enum	ActivationFunction *activators, NNLayer *layers, double **weights)
{
	int i, lastSize;
	nn->maxLayer = numInputs; /* First guess at widest layer. */
	nn->inputs = numInputs;
	nn->outputs = layerSizes[numLayers-1];
	nn->numLayers = numLayers;
	nn->numNodes = layerSizes;
	nn->layers = layers;
	nn->activators = activators;

	lastSize = nn->inputs;

	for (i = 0; i < numLayers; ++i) {
		int n;

		double *lastWeight = weights[i];
		for (n = 0; n < nn->numNodes[i]; ++n) {
			nn->layers[i][n].weights = lastWeight;
			lastWeight += (lastSize+1);
			nn->layers[i][n].size = lastSize;
			nn->layers[i][n].last_output = 0;
			nn->layers[i][n].last_doutput = 0;
		}

		if (n > nn->maxLayer)
			nn->maxLayer = n;

		lastSize = nn->numNodes[i];
	}
}

static double node_output(struct PerceptronNode *n, double *inputs, enum ActivationFunction activator)
{
	int i;

	n->last_output = 0;
	for (i = 0; i < n->size; ++i)
		n->last_output += n->weights[i] * inputs[i];
	n->last_output += n->weights[n->size];

	switch (activator) {
		case AF_RELU:
			n->last_doutput = step(n->last_output);
			n->last_output = rectifier(n->last_output);
			break;
		case AF_SOFTMAX:
			n->last_doutput = sigmoid(n->last_output);
			n->last_output = softmax(n->last_output);
			break;
		case AF_SIGMOID:
			n->last_doutput = dsigmoid(n->last_output);
			n->last_output = sigmoid(n->last_output);
			break;
		case AF_IDENTITY:
			n->last_doutput = unity(n->last_output);
			n->last_output = identity(n->last_output);
			break;
	}
	return n->last_output;
}

void network_value(NeuralNetwork *nn, double *inputs, double *outputs)
{
	int i;
	double values_array[nn->maxLayer];
	double new_values_array[nn->maxLayer];
	double *values;
	double *new_values;
	values = values_array;
	new_values = new_values_array;

	/* initialize values */
	for (i = 0; i < nn->inputs; ++i)
		values[i] = inputs[i];

	for (i = 0; i < nn->numLayers; ++i) {
		int x;
		double *swp;

		for (x = 0; x < nn->numNodes[i]; ++x)
			new_values[x] = node_output(&nn->layers[i][x], values, nn->activators[i]);

		/* Pointer-swap values and new_values */
		swp = values;
		values = new_values;
		new_values = swp;
	}

	if (outputs) {
		for (i = 0; i < nn->outputs; ++i)
			outputs[i] = values[i];
	}
}

static double get_back_last_output(NeuralNetwork *nn, double *inputs, int layer, int weight)
{
	if (layer > 0) {
		if (weight >= nn->numNodes[layer-1]) return 1;
		return nn->layers[layer-1][weight].last_output;
	} else {
		if (weight >= nn->inputs) return 1;
		return inputs[weight];
	}
}

void network_train(NeuralNetwork *nn, double *inputs, double *outputs, double *real_outputs, double eta)
{
	int layer, node;
	double deltas[nn->numLayers][nn->maxLayer];

	/* Step 1: Forward propogation */
	network_value(nn, inputs, outputs);

	/* Step 2: Construct Deltas */
	for (layer = 0; layer < nn->numLayers; ++layer) {
		for (node = 0; node < nn->numNodes[layer]; ++node)
			deltas[layer][node] = 0.0;
	}

	/* Step 2a: Output layer deltas */
	layer = nn->numLayers - 1;
	for (node = 0; node < nn->numNodes[layer]; ++node) {
		double val, dval, target;

		val = nn->layers[layer][node].last_output;
		dval = nn->layers[layer][node].last_doutput;
		target = real_outputs[node];
		deltas[layer][node] = dval * (val - target);
	}

	/* Step 2b: Hidden layer deltas */
	for (layer = nn->numLayers - 2; layer >= 0; --layer) {
		for (node = 0; node < nn->numNodes[layer]; ++node) {
			int w;
			double delta;

			delta = 0.0;
			for (w = 0; w < nn->numNodes[layer+1]; ++w)
				delta += deltas[layer+1][w] * nn->layers[layer+1][w].weights[node];

			deltas[layer][node] = nn->layers[layer][w].last_doutput * delta;
		}
	}

	/* Step 3: Back propogation */
	for (layer = 0; layer < nn->numLayers; ++layer) {
		for (node = 0; node < nn->numNodes[layer]; ++node) {
			int weight, num_weights;

			num_weights = nn->layers[layer][node].size;
			for (weight = 0; weight < num_weights-1; ++weight) {
				double last_back_output = get_back_last_output(nn, inputs, layer, weight);
				nn->layers[layer][node].weights[weight] +=
					(-1 * eta * deltas[layer][node] * last_back_output);
			}
			/* Update the bias weight */
			nn->layers[layer][node].weights[num_weights-1] +=
				(-1 * eta * deltas[layer][node]);
		}
	}
}
