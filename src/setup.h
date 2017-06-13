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

static inline void setupUART1(){
	volatile int *low = (int *) ( UART1_BASE + UART_LCRL_OFFSET );
	*low &= 0xffffff00;
	*low |= 0x68;
	volatile int *high = (int *)(UART1_BASE + UART_LCRH_OFFSET);
	*high &= ~(UART_FIFOEN_MASK);
}

static inline void setuprecieve(){
	volatile int *uctrl = (int *)( UART2_BASE + UART_CTRL_OFFSET);
	*uctrl |= 1 << 4;
}

static inline void setuptransmit(){
	volatile int *uctrl = (int *)( UART2_BASE + UART_CTRL_OFFSET);
	*uctrl |= 1 << 5;
}

static inline void transmiton(){
	volatile int *enable = (int *) ( VIC1_BASE + VIC_ENABLE_OFFSET );
	*enable |= 1 << 26;
}

static inline void transmitoff(){
	volatile int *clear = (int *) ( VIC1_BASE + VIC_CLEAR_OFFSET );
	*clear |= 1 << 26;
}

static inline void recieveon(){
	volatile int *enable = (int *) ( VIC1_BASE + VIC_ENABLE_OFFSET );
	*enable |= 1 << 25;
}

static inline void recieveoff(){
	volatile int *enable = (int *) ( VIC1_BASE + VIC_CLEAR_OFFSET );
	*enable |= 1 << 25;
}

static inline void putcom2(char c){
	volatile int *data = (int *)(UART2_BASE + UART_DATA_OFFSET);
	*data = c;
}

#endif
