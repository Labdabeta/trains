#include "debugio.h"
#include "trains/ts7200.h"
#include "linker.h"

static volatile char *location;

#define INIT_LOCATION 0x50000

void debug_putc(void *data, char ch)
{
#ifndef REMOTE
	(void)data; // unused
	*(location++) = ch;
	if ((int)location > 0x100000)
		location = (char*)INIT_LOCATION;
	*location = 0;
#endif
}

void init_debugio(void)
{
#ifndef REMOTE
	location = (char*)INIT_LOCATION;
	init_dprintf(0, fn_ptr(debug_putc));
#endif
}
