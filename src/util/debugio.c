#include "debugio.h"
#include "ts7200.h"
#include "linker.h"

static char *location;

#define INIT_LOCATION 0x50000

void debug_putc(void *data, char ch)
{
	(void)data; // unused
	*(location++) = ch;
	if ((int)location > (int)&CODE_BASE)
		location = (char*)INIT_LOCATION;
	*location = 0;
}

void init_debugio(void)
{
	location = (char*)INIT_LOCATION;
	init_dprintf(0, fn_ptr(debug_putc));
}
