#ifndef MLP_H
#define MLP_H

typedef struct PerceptronNode {
	int size; /* Number of inputs. */
	float *weights; /* One for each input. */
    float bias; /* Weight on the bias. */
	float last_output; /* The last value this node produced. */
	float last_doutput; /* The derivative of the last value this node produced. */
} NNNode, *NNLayer;

enum ActivationFunction {
	AF_RELU, /* Rectifier linear */
	AF_SOFTPLUS, /* SoftPlus */
	AF_SIGMOID, /* Logistic */
	AF_LINEAR /* Identity */
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

void mlpInit(NeuralNetwork *nn, int numInputs, int numLayers, int *layerSizes, enum	ActivationFunction *activators, NNLayer *layers, float **weights);
void network_train(NeuralNetwork *nn, float *inputs, float *outputs, float *real_outputs, float eta);
void network_value(NeuralNetwork *nn, float *inputs, float *outputs);

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
float input_weights[260 * 10];
float layer1_weights[10 * 3];
float layer2_weights[3 * 2];

// nodes
struct PerceptronNode layer1[10];
struct PerceptronNode layer2[3];
struct PerceptronNode output_layer[2];

NeuralNetwork nn;
int layerSizes[] = {10, 3, 2};
struct PerceptronNode *layers[] = {layer1, layer2, output_layer};
float *weights[] = {input_weights, layer1_weights, layer2_weights};
enum ActivationFunction activators[] = {AF_RELU, AF_RELU, AF_SIGMOID};

void initNN(void) {
	int i;
	for (i = 0; i < 260*11; ++i)
		input_weights[i] = 0.1;
	for (i = 0; i < 11 * 3; ++i)
		layer1_weights[i] = 0.1;
	for (i = 0; i < 4 * 2; ++i)
		layer2_weights[i] = 0.1;
	mlpInit(&nn, 260, 3, layerSizes, activators, layers, weights);
}

/* 1 = esperanto, 0 = english. */
int determineLanguage(char word[10]) {
	int i;
	float inputs[260];

	for (i = 0; i < 10; ++i) {
		int x;
		for (x = 0; x < 26; ++x) {
			if (word[i]-'a' == x)
				inputs[i*26+x] = 1.0;
			else
				inputs[i*26+x] = 0.0;
		}
	}

	float outputs[2];
	network_value(&nn, inputs, outputs);

    printf("English: %f, Esperanto: %f\n", outputs[0], outputs[1]);

	if (outputs[1] > outputs[0])
		return 1;
	return 0;
}

void trainLanguage(char word[10], int isEnglish, int isEsperanto) {
	int i;
	float inputs[260];

	for (i = 0; i < 10; ++i) {
		int x;
		for (x = 0; x < 26; ++x) {
			if (word[i]-'a' == x)
				inputs[i*26+x] = 1.0;
			else
				inputs[i*26+x] = 0.0;
		}
	}

	float outputs[2];
	outputs[0] = (isEnglish ? 1.0 : 0.0);
	outputs[1] = (isEsperanto ? 1.0 : 0.0);

	network_train(&nn, inputs, 0, outputs, 0.1);
}

#endif
