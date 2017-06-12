#ifndef TS_7200_H
#define TS_7200_H

#define TIMER1_BASE 0x80810000
#define TIMER2_BASE 0x80810020
#define TIMER3_BASE 0x80810080
#define UART1_BASE 0x808c0000
#define UART2_BASE 0x808d0000

#define TIMER_LOAD_OFFSET 0x00
#define TIMER_VALU_OFFSET 0x04
#define TIMER_CTRL_OFFSET 0x08
#define TIMER_ENABLE_MASK 0x80
#define TIMER_PERIODIC_MASK 0x40
#define TIMER_CLR_OFFSET 0x0c

/* As a struct */
struct Timer {
	volatile int load;
	volatile int value;
	volatile int ctrl;
	volatile int clear;
};

#define UART_DATA_OFFSET 0x00
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

#define VIC1_BASE 0x800b0000
#define VIC2_BASE 0x800c0000
#define VIC_STATUS_OFFSET 0x00
#define VIC_RAW_OFFSET 0x08
#define VIC_ENABLE_OFFSET 0x10
#define VIC_CLEAR_OFFSET 0x14

#define ENABLE_INTERRUPT(VIC_NUM, INT_NUM) *(int*)(VIC##VIC_NUM##_BASE + VIC_ENABLE_OFFSET) |= (1 << (INT_NUM))
#define GET_INT(VIC_NUM) (*(int*)(VIC##VIC_NUM##_BASE + VIC_STATUS_OFFSET))
#define GET_ENA(VIC_NUM) (*(int*)(VIC##VIC_NUM##_BASE + VIC_ENABLE_OFFSET))
#define GET_RAW(VIC_NUM) (*(int*)(VIC##VIC_NUM##_BASE + VIC_RAW_OFFSET))
#define DISABLE_INTERRUPT(VIC_NUM, INT_NUM) *(int*)(VIC##VIC_NUM##_BASE + VIC_CLEAR_OFFSET) |= (1 << (INT_NUM))
#define CHECK_INTERRUPT(VIC_NUM, INT_NUM) (*(int*)(VIC##VIC_NUM##_BASE + VIC_STATUS_OFFSET) | (1 << (INT_NUM)))

#endif /* TS_7200_H */
