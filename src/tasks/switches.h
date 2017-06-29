#ifndef SWITCHES_H
#define SWITCHES_H

#define NUM_SWITCHES 22

void switches(void);

void flipSwitch(int tid, int sw, int curved);

/* Responds with 2 bytes: 0/1 | sw [1-indexed] */
void registerForSwitchFlips(int tid);

/* 0 = straight */
int getSwitchState(int tid, int sw);

#endif /* SWITCHES_H */
