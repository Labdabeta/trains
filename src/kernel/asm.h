#ifndef ASM_H
#define ASM_H

#define ASM asm volatile

#define PUSH(value) ASM ("stmfd sp!, {%0}" :: "r"(value) : "lr")
#define SAVE_STACK() ASM ("mov r8, sp" ::: "r8", "lr")
#define RESTORE_STACK() ASM ("mov sp, r8" ::: "lr")
#define SWI() ASM ("swi 0" ::: "r0", "r1", "r2", "r3", "lr")
#define RET() do { ASM ("bx lr" ::: "lr"); register int __retval asm ("r0"); ASM("":"=r"(__retval)); return __retval; } while (0)

#if 0 /* Some examples */
#define SET_SPSR(new_spsr) ASM ("msr spsr, %0" :: "irm" (new_spsr))
#define PUSH(registers) ASM ("stmfd sp!, {" registers "}")
#define POP(registers) ASM ("ldmfd sp!, {" registers "}")
#define PUSH_STACK(stack, registers) ASM ("stmfd %0, {" registers "}" :: "r" (stack))
#define POP_STACK(stack, registers) ASM ("stmfd %0, {" registers "}" :: "r" (stack))
#define SWITCH_TO_SYSTEM() ASM ("mrs r3, cpsr\norr r3, r3, #12\nmsr cpsr_c, r3" ::: "r3")
#define SWITCH_TO_USER() ASM ("mrs r3, cpsr\neor r3, r3, #12\nmsr cpsr_c, r3" ::: "r3")
#define MOV(dest, src) ASM ("mov " dest ", " src)
#define MOVS(dest, src) ASM ("movs " dest ", " src)
#define STR(dest, src) ASM ("str " dest ", [%0]" :: "irm" (src))
#endif

#endif /* ASM_H */
