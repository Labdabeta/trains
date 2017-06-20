#include "mlp.h"

/* Approximates ln(1+x) */
float approx_ln1(float x) { return x - (x*x/2) + (x*x*x/3); }
float approx_exp(float x) { return 1 + x + (x*x/2) + (x*x*x/6); }

static inline float softplus(float x) { return approx_ln1(approx_exp(x)); }
static inline float sigmoid(float x) { return 1.0 / (1.0 + approx_exp(-x)); }
static inline float dsigmoid(float x) { return sigmoid(x)*(1.0-sigmoid(x)); }
static inline float rectifier(float x) { return (x < 0.0) ? 0.0 : x; }
static inline float step(float x) { return (x < 0.0) ? 0.0 : 1.0; }
static inline float identity(float x) { return x; }
static inline float unity(float x) { return 1.0; }

void mlpInit(NeuralNetwork *nn, int numInputs, int numLayers, int *layerSizes, enum	ActivationFunction *activators, NNLayer *layers, float **weights)
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

		float *lastWeight = weights[i];
		for (n = 0; n < nn->numNodes[i]; ++n) {
			nn->layers[i][n].weights = lastWeight;
            lastWeight = &lastWeight[lastSize+1];
			nn->layers[i][n].size = lastSize;
			nn->layers[i][n].last_output = 0;
			nn->layers[i][n].last_doutput = 0;
		}

		if (n > nn->maxLayer)
			nn->maxLayer = n;

		lastSize = nn->numNodes[i];
	}
}

static float node_output(struct PerceptronNode *n, float *inputs, enum ActivationFunction activator)
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
		case AF_SOFTPLUS:
			n->last_doutput = sigmoid(n->last_output);
			n->last_output = softplus(n->last_output);
			break;
		case AF_SIGMOID:
			n->last_doutput = dsigmoid(n->last_output);
			n->last_output = sigmoid(n->last_output);
			break;
		case AF_LINEAR:
			n->last_doutput = unity(n->last_output);
			n->last_output = identity(n->last_output);
			break;
	}
	return n->last_output;
}

void network_value(NeuralNetwork *nn, float *inputs, float *outputs)
{
	int i;
	float values_array[nn->maxLayer];
	float new_values_array[nn->maxLayer];
	float *values;
	float *new_values;
	values = values_array;
	new_values = new_values_array;

	/* initialize values */
	for (i = 0; i < nn->inputs; ++i)
		values[i] = inputs[i];

	for (i = 0; i < nn->numLayers; ++i) {
		int x;
		float *swp;

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

static float get_back_last_output(NeuralNetwork *nn, float *inputs, int layer, int weight)
{
	if (layer > 0) {
		if (weight >= nn->numNodes[layer-1]) return 1;
		return nn->layers[layer-1][weight].last_output;
	} else {
		if (weight >= nn->inputs) return 1;
		return inputs[weight];
	}
}

void network_train(NeuralNetwork *nn, float *inputs, float *outputs, float *real_outputs, float eta)
{
	int layer, node;
	float deltas[nn->numLayers][nn->maxLayer+1];

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
		float val, dval, target;

		val = nn->layers[layer][node].last_output;
		dval = nn->layers[layer][node].last_doutput;
		target = real_outputs[node];
		deltas[layer][node] = dval * (val - target);
	}

	/* Step 2b: Hidden layer deltas */
	for (layer = nn->numLayers - 2; layer >= 0; --layer) {
		for (node = 0; node < nn->numNodes[layer]; ++node) {
			int w;
			float delta;

			delta = 0.0;
			for (w = 0; w < nn->numNodes[layer+1]; ++w)
				delta += deltas[layer+1][w] * nn->layers[layer+1][w].weights[node];

			deltas[layer][node] = nn->layers[layer][w].last_doutput * delta;
		}
	}

	/* Step 3: Back propogation */
	for (layer = 0; layer < nn->numLayers; ++layer) {
		for (node = 0;
            node < nn->numNodes[layer];
            ++node) {
			int weight, num_weights;

			num_weights = nn->layers[layer][node].size;
			for (weight = 0; weight < num_weights-1; ++weight) {
				float last_back_output = get_back_last_output(nn, inputs, layer, weight);
				nn->layers[layer][node].weights[weight] +=
					(-1 * eta * deltas[layer][node] * last_back_output);
			}

			/* Update the bias weight */
            nn->layers[layer][node].bias += (-1 * eta * deltas[layer][node]);
		}
	}
}
