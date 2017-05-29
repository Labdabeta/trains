@ Comment starter required as per: https://stackoverflow.com/questions/15663280/gnu-assembler-comments
@ void asm_SetupTrap(struct SyscallArgs *args)
@ Writes the swi handler to the trap table
@ Pass the address where stack pushes will write args then fn
.global asm_SetupTrap
asm_SetupTrap:
	str r0, arg_pointer @ Save the argument in the arg pointer
	adr r0, asm_EnterKernel @ Save the swi callback in r0
	mov r1, #0x28 @ The trap table location
	str r0, [r1] @ Save the callback in the trap table
	mov pc, lr @ return

arg_pointer:
	.word 0

@ void asm_EnterTask(int *sp, int usr_cpsr, int return_value)
@ Enters a userspace task and returns the specified value.
.global asm_EnterTask
asm_EnterTask:
	msr spsr, r1 @ Set spsr to usr_cpsr
	stmfd sp!, {r4-r12, lr} @ Save registers
	ldmfd r0!, {lr} @ Load old pc (top value of user stack)

	@ Switch mode to system
	mrs r3, cpsr
	orr r3, r3, #12
	msr cpsr_c, r3

	mov sp, r0 @ Restore user stack pointer
	ldmfd sp!, {r4-r12, lr} @ Restore registers to the user stack

	@ Switch back to user mode
	mrs r3, cpsr
	eor r3, r3, #12
	msr cpsr_c, r3

	mov r0, r2 @ Return the value
	movs pc, lr @ return and enact mode switch

@ int asm_EnterKernel(void)
@ Enters the kernel, for example for an SWI
@ Returns the new stack pointer.
@ Returns the new status register in r1
.global asm_EnterKernel
asm_EnterKernel:
	@ TODO: save r1-3 if interrupt
	mov r3, lr @ Save the link register

	@ Switch mode to system
	mrs r2, cpsr
	orr r2, r2, #12
	msr cpsr_c, r2

	mov r1, sp
	stmfd sp!, {r4-r12, lr} @ Save registers
	stmfd sp!, {r3} @ Save r3 last

	mov r0, sp @ Return user sp

	ldmfd r1!, {r4-r7} @ Load system arguments

	@ Switch mode to user
	mrs r2, cpsr
	eor r2, r2, #12
	msr cpsr_c, r2

	ldr r1, arg_pointer
	stmed r1!, {r4-r7}
	mrs r1, spsr @ return spsr in r1
	ldmfd sp!, {r4-r12, pc} @ Restore registers (lr->pc)

# int asm_callSystemInterrupt(int a, int b, int c, int code)
# Returns in r0 after swi
.global asm_callSystemInterrupt
asm_callSystemInterrupt:
	@stmdb sp!, {r3}
	@stmdb sp!, {r2}
	@stmdb sp!, {r1}
	@stmdb sp!, {r0}
    stmdb sp!, {r0-r3}
	swi 0
	add sp, sp, #16
	bx lr
