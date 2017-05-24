#include "interface.h"
#include "asm.h"

__attribute__((naked)) int callSystemInterrupt(int arg0, int arg1, int arg2, int arg3, int arg4, int code)
{
	/* Terrible code -O0, great code -O2! */
	PUSH(arg4);
	PUSH(arg3);
	PUSH(arg2);
	PUSH(arg1);
	PUSH(arg0);
	PUSH(code);
	SWI();
	RET();

	/* This is a fancy nop with optimization on. (disables warning) */
	register int retval __asm__ ("r0");
    ASM("":"=r"(retval));
	return retval;
}

