#include "interface.h"
#include "asm.h"

int callSystemInterrupt(int arg0, int arg1, int arg2, int code)
{
	/* Terrible code -O0, great code -O2! */
	PUSH(code);
	PUSH(arg2);
	PUSH(arg1);
	PUSH(arg0);
	SWI(); // <-- clobbers 0-3
#warning TODO: real todo - save and restore sp, don't just assume
    ASM("add sp, sp, #20"); // TODO: try changing to #20/#16 check what's happening
	RET();
}

#if 0
int callSystemInterrupt(int arg5, int arg4, int arg3, int arg2, int arg1, int number)
{
	int rval;
	asm volatile("swi");
	asm volatile("str r0, [%0]"::"r"(&rval));
	return rval;
}
#endif
