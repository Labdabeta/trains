#include "debugio.h"
#include "ts7200.h"
#include "linker.h"

static char *location;

#define INIT_LOCATION 0x50000

void init_debugio(void)
{
	location = (char*)INIT_LOCATION;
}

void cleanup_debugio(void)
{
	*location = 0;
}

void debugio_putc(char c)
{
	*(location++) = c;
	if ((int)location > (int)&CODE_BASE)
		location = (char*)INIT_LOCATION;
	*location = 0;
}

int debugio_getc(void)
{
	volatile struct UART *com = (struct UART *)(UART2_BASE);
	while (!(com->flag & UART_RXFULL_MASK));
	return com->data;
}

void debugio_putstr(const char *str)
{
	const char *c;
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

void debugio_putuint_base(unsigned int x, int base)
{
	unsigned int n = 0;
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

void debugio_putuint_decimal(unsigned int x)
{
	debugio_putuint_base(x,10);
}

void debugio_putint_hex(int x)
{
	debugio_putint_base(x,16);
}

void debugio_dump_registers(void)
{
	DEBUG_DUMP_REG("r0");
	DEBUG_DUMP_REG("r1");
	DEBUG_DUMP_REG("r2");
	DEBUG_DUMP_REG("r3");
	DEBUG_DUMP_REG("r4");
	DEBUG_DUMP_REG("r5");
	DEBUG_DUMP_REG("r6");
	DEBUG_DUMP_REG("r7");
	DEBUG_DUMP_REG("r8");
	DEBUG_DUMP_REG("r9");
	DEBUG_DUMP_REG("sl");
	DEBUG_DUMP_REG("fp");
	DEBUG_DUMP_REG("ip");
	DEBUG_DUMP_REG("sp");
	DEBUG_DUMP_REG("lr");
	DEBUG_DUMP_REG("pc");
}

