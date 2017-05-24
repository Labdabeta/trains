#include "interface.h"
#include "asm.h"

__attribute__((naked)) int callSystemInterrupt(int arg0, int arg1, int arg2, int arg3, int arg4, int code)
{
	/* Terrible code -O0, great code -O2! */
	SAVE_STACK();
	PUSH(arg4);
	PUSH(arg3);
	PUSH(arg2);
	PUSH(arg1);
	PUSH(arg0);
	PUSH(code);
	SWI();
	RESTORE_STACK();
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
