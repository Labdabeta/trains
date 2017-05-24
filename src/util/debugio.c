#include "debugio.h"
#include "ts7200.h"

void init_debugio(void)
{
	volatile struct UART *com = (struct UART *)(UART1_BASE);
	com->lcrh &= ~(UART_FIFOEN_MASK);
}

void debugio_putc(char c)
{
	volatile struct UART *com = (struct UART *)(UART1_BASE);
	while (com->flag & UART_TXFULL_MASK);
	com->data = c;
}

void debugio_putstr(char *str)
{
	char *c;
	for (c = str; *c; c++) debugio_putc(*c);
}

