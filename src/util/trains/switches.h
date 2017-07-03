#ifndef SWITCHES_H
#define SWITCHES_H

// max 32 switches, 0x99 = 19, 0x9A = 20, 0x9B = 21, 0x9C = 22
typedef unsigned int switch_state;

#define SW_99 19
#define SW_153 19
#define SW_9A 20
#define SW_154 20
#define SW_9B 21
#define SW_155 21
#define SW_9C 22
#define SW_156 22

#define IS_CURVED(state, X) ((state) & (1 << (X)))

#define SET_CURVED(state, X) do { (state) |= (1 << (X)); } while (0)
#define SET_STRAIGHT(state, X) do { (state) &= ~(1 << (X)); } while (0)

#define SWITCH_STATE_CURVED (~(unsigned int)0)
#define SWITCH_STATE_STRAIGHT (0)

#endif /* SWITCHES_H */
