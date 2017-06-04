#ifndef SETUP_H
#define SETUP_H

#include "ts7200.h"

static inline void setupTimer(){
  volatile int *load = (int *) ( TIMER_BASE + TIMER_LOAD_OFFSET );
  *load = 1999;
  volatile int *tctrl = (int *) ( TIMER_BASE + TIMER_CTRL_OFFSET );
  *tctrl |= TIMER_ENABLE_MASK + TIMER_PERIODIC_MASK;
  volatile int *enable = (int *) ( VIC2_BASE + VIC_ENABLE_OFFSET );
  *enable |= 1 << 19;
}

#endif
