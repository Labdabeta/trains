#ifndef TS_7200_H
#define TS_7200_H

#define TIMER_BASE 0x80810080
#define UART0_BASE 0x808c0000
#define UART1_BASE 0x808d0000

#define TIMER_LOAD_OFFSET 0x00
#define TIMER_VALU_OFFSET 0x04
#define TIMER_CTRL_OFFSET 0x08
#define TIMER_ENABLE_MASK 0x80

#define UART_RECV_OFFSET 0x04
#define UART_LCRH_OFFSET 0x08
#define UART_LCRM_OFFSET 0x0c
#define UART_LCRL_OFFSET 0x10
#define UART_CTRL_OFFSET 0x14
#define UART_FLAG_OFFSET 0x18

/* As a struct */
struct UART {
	volatile int data;
	volatile int recv;
	volatile int lcrh;
	volatile int lcrm;
	volatile int lcrl;
	volatile int ctrl;
	volatile int flag;
};

#define UART_FIFOEN_MASK 0x10
#define UART_RXFULL_MASK 0x40
#define UART_TXFULL_MASK 0x20

#endif /* TS_7200_H */
