/* Assumptions:
 * r0 - sp
 * r1 - usr_cpsr */

.global asm_enter
asm_enter:
	str sp, ker_sp
  mrs r2, spsr
  stmfd sp!, {sl, fp, ip, lr}
  stmfd sp!, {r4-r9}
  mov sp, r0
  ldmfd	sp!, {lr}
	msr cpsr, r0 
  orr r0, r0, #15
	mrs r0, cpsr
  ldmfd	sp!, {r4-r9}
  ldmfd sp!, {sl, fp, ip, lr}
	msr cpsr, r0
  eor r0, r0, #15
	mrs r0, cpsr
  movs pc, lr

.global asm_write_ksp
asm_write_ksp:
	str r0, ker_sp
	mov pc, lr

ker_sp:
	.word 0
