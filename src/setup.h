#ifndef SETUP_H
#define SETUP_H

#include "ts7200.h"

static inline void setupTimer()
{
	volatile int *load = (int *) ( TIMER_BASE + TIMER_LOAD_OFFSET );
	*load = 19;
	volatile int *tctrl = (int *) ( TIMER_BASE + TIMER_CTRL_OFFSET );
	*tctrl |= TIMER_ENABLE_MASK | TIMER_PERIODIC_MASK;
	volatile int *enable = (int *) ( VIC2_BASE + VIC_ENABLE_OFFSET );
	*enable |= 1 << 19;
}

static inline void cleanupTimer(){
	volatile int *tctrl = (int *) ( TIMER_BASE + TIMER_CTRL_OFFSET );
	*tctrl &= ~(TIMER_ENABLE_MASK | TIMER_PERIODIC_MASK);
	volatile int *enable = (int *) ( VIC2_BASE + VIC_ENABLE_OFFSET );
	*enable &= ~(1 << 19);
	volatile int *tclr = (int *) ( TIMER_BASE + TIMER_CLR_OFFSET );
	*tclr = 0;
}

static inline void setupCOM2(){
	volatile int *uctrl = (int *)( UART2_BASE + UART_CTRL_OFFSET);
	*uctrl |= 1 << 4;
	volatile int *enable = (int *) ( VIC1_BASE + VIC_ENABLE_OFFSET );
	*enable |= 1 << 25;
}

#endif
