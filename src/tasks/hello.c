#include "tasks.h"
#include "fuzzy.h"
#include "rand.h"

int determineValveDiameter(int temp, int mass, int time) {
	// Temperature sets:
	// It is possibly cold if temperature is 0->50
	// It is definitely cold if temperature is 0->25
	struct FuzzySet cold = {.support={0,50}, .core={0,25}};
	struct FuzzySet hot = {.support={25,60}, .core={50,60}};
	// Mass fuzzy sets:
	struct FuzzySet small = {.support={0,100}, .core={0,50}};
	struct FuzzySet large = {.support={50,140}, .core={100,140}};
	// Time until end fuzzy sets:
	struct FuzzySet near = {.support={30,120}, .core={90,120}};
	struct FuzzySet far = {.support={0,90}, .core={0,30}};
	// Fuel valve fuzzy sets
	struct FuzzySet decrease = {.support={0,70}, .core={0,50}};
	struct FuzzySet maintain = {.support={50,150}, .core={70,120}};
	struct FuzzySet increase = {.support={120,200}, .core={150,200}};

	struct FuzzyRule coldness = {FRT_VARIABLE, .value = {cold, temp}};
	struct FuzzyRule hotness = {FRT_VARIABLE, .value = {hot, temp}};
	struct FuzzyRule smallness = {FRT_VARIABLE, .value = {small, mass}};
	struct FuzzyRule largeness = {FRT_VARIABLE, .value = {large, mass}};
	struct FuzzyRule nearness = {FRT_VARIABLE, .value = {near, time}};
	struct FuzzyRule farness = {FRT_VARIABLE, .value = {far, time}};

	struct FuzzyRule rules[5] = {
		{FRT_AND, .args = {&coldness, &farness}},
		hotness,
		{FRT_AND, .args = {&smallness, &nearness}},
		{FRT_AND, .args = {&largeness, &farness}},
		nearness};

	struct FuzzySet targets[5] = {increase, decrease, maintain, increase, decrease};

	return fuzzy(5, rules, targets, FTN_CLASSICAL, FI_MAMDANI, DF_CENTROID);
}

void hello()
{
	int cout = WhoIs("COUT");
	int cin = WhoIs("CIN");
	int tout = WhoIs("TOUT");
	int tin = WhoIs("TIN");
	int clock = WhoIs("CLOCK");

	int starttime = Time(clock);
	int t;

	while ((t = Time(clock)) < (starttime + 100)) {
		int temp = (unsigned int)rand(t) % 60;
		int mass = (unsigned int)rand(t) % 140;
		int time = (unsigned int)rand(t) % 200;
		dprintf("Diameter for %d*C, %dkg, %dm: ", temp, mass, time);
		dprintf("%d\n\r", determineValveDiameter(temp, mass, time));
	}

	Exit();
}
