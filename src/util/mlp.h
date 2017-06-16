#ifndef MLP_H
#define MLP_H

typedef struct PerceptronNode {
	int size; /* Number of inputs. */
	double *weights; /* One for each input +1 for bias. */
	double last_output; /* The last value this node produced. */
	double last_doutput; /* The derivative of the last value this node produced. */
} NNNode, *NNLayer;

enum ActivationFunction {
	AF_RELU, /* Rectifier linear */
	AF_SOFTMAX, /* SoftMax */
	AF_SIGMOID, /* Logistic */
	AF_IDENTITY /* Identity */
};

typedef struct MultilayerPerceptron {
	NNLayer *layers; /* The layers themselves. */
	int numLayers; /* The number of layers. */
	int *numNodes; /* Nodes in each layer. */
	enum ActivationFunction *activators; /* Activators for each layer. */
	int outputs; /* Number of outputs. */
	int inputs; /* Number of inputs. */
	int maxLayer; /* Size of largest layer. */
} NeuralNetwork;

void mlpInit(NeuralNetwork *nn, int numInputs, int numLayers, int *layerSizes, enum	ActivationFunction *activators, NNLayer *layers, double **weights);
void network_train(NeuralNetwork *nn, double *inputs, double *outputs, double *real_outputs, double eta);
void network_value(NeuralNetwork *nn, double *inputs, double *outputs);
void network_dump(NeuralNetwork *nn); /* dprintfs a c int array that can be loaded. */
void network_load(NeuralNetwork *nn, int *data); /* loads an initted network from its dumped array. */

#endif /* MLP_H */

#if 0
// Example: Native language identification
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Inputs: - 260 inputs for each max 10 characters
// Layer1: 10 nodes + 1 bias
// Layer2: 3 nodes + 1 bias
// Outputs: - english
//          - esperanto

// output weight arrays
double input_weights[260 * 11];
double layer1_weights[11];
double layer2_weights[4];

// nodes
struct PerceptronNode layer1[10];
struct PerceptronNode layer2[3];
struct PerceptronNode output_layer[2];

NeuralNetwork nn;
void initNN(void) {
	int layerSizes[] = {10, 3, 2};
	struct PerceptronNode *layers[] = {layer1, layer2, output_layer};
	double *weights[] = {input_weights, layer1_weights, layer2_weights};
	enum ActivationFunction activators[] = {AF_RELU, AF_RELU, AF_SOFTMAX};
	mlpInit(&nn, 260, 3, layerSizes, activators, layers, weights);
}

/* 1 = esperanto, 0 = english. */
int determineLanguage(char word[10]) {
	int i;
	double inputs[260];

	for (i = 0; i < 10; ++i) {
		int x;
		for (x = 0; x < 26; ++x) {
			if (word[i]-'a' == x)
				inputs[i*26+x] = 1.0;
			else
				inputs[i*26+x] = 0.0;
		}
	}

	double outputs[2];
	network_value(&nn, inputs, outputs);

	if (outputs[1] > outputs[0])
		return 1;
	return 0;
}

void trainLanguage(char word[10], int isEnglish, int isEsperanto) {
	int i;
	double inputs[260];

	for (i = 0; i < 10; ++i) {
		int x;
		for (x = 0; x < 26; ++x) {
			if (word[i]-'a' == x)
				inputs[i*26+x] = 1.0;
			else
				inputs[i*26+x] = 0.0;
		}
	}

	double outputs[2];
	outputs[0] = (isEnglish ? 1.0 : 0.0);
	outputs[1] = (isEsperanto ? 1.0 : 0.0);

	network_train(&nn, inputs, 0, outputs, 0.1);
}
#endif
