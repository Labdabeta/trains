
; asm_enter_task(sp,cpsr)
.global asm_enter_task
asm_enter_task:
	; Set the spsr to the argument
	msr spsr, r1

	; Save the registers and lr
	stmfd sp!, {r4-r12, lr}

	; Get the kernel stack pointer
	ldr r1, kernel_stack

	; Save the kernel sp
	str sp, [r1]

	;-- Only user memory now
	; Restore user sp
	mov sp, r0

	; Top of stack is the saved pc
	ldmfd sp!, {lr}

	; Switch to system mode
	msr cpsr_c, #0xdf

	; Restore the stack and lr (pc already restored)
	ldmfd sp!, {r4-r12, lr}

	; Switch back to supervisor mode
	msr cpsr_c, #0xd3

	; Atomically move lr->pc and switch modes
	movs pc, lr


.global asm_write_kernel_stack
asm_write_kernel_stack:
	; Load sp into r0
	str r0, kernel_stack

	; Normal return
	mov pc, lr

; The kernel stack pointer
kernel_stack: .word 0
