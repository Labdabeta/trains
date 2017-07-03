#ifndef SETUP_H
#define SETUP_H

#include "trains/ts7200.h"

static inline void cleanupTimer1(){
	volatile struct Timer *t1 = (struct Timer*)TIMER1_BASE;
	t1->ctrl &= ~(TIMER_ENABLE_MASK | TIMER_PERIODIC_MASK);
	t1->clear = 0;
	DISABLE_INTERRUPT(1, 4);
}

#endif
