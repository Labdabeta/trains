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

void debugio_putint_base(int x, int base)
{
	if (x < 0) {
		x = -x;
		debugio_putc('-');
	}

	int n = 0;
	int dgt;
	unsigned int d = 1;

	while ((x/d) >= base) d *= base;
	while (d!=0) {
		dgt = x / d;
		x %= d;
		d /= base;
		if (n || dgt > 0 || d == 0) {
			debugio_putc(dgt + (dgt < 10 ? '0' : 'A' - 10));
			n++;
		}
	}
}

void debugio_putint_decimal(int x)
{
	debugio_putint_base(x,10);
}

void debugio_putint_hex(int x)
{
	debugio_putint_base(x,16);
}
