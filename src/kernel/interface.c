#include "interface.h"
#include "asm.h"

__attribute__((naked)) int callSystemInterrupt(int arg0, int arg1, int arg2, int code)
{
	/* Terrible code -O0, great code -O2! */
	PUSH(code);
	PUSH(arg2);
	PUSH(arg1);
	PUSH(arg0);
	SWI();
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
