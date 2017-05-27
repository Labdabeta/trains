#include "interface.h"
#include "asm.h"

extern int asm_callSystemInterrupt(int arg0, int arg1, int arg2, int code);

int callSystemInterrupt(int arg0, int arg1, int arg2, int code)
{
	return asm_callSystemInterrupt(arg0, arg1, arg2, code);
}

