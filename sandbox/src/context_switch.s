/* Assumptions:
 * r0 - sp
 * r1 - usr_cpsr */

.global asm_enter
asm_enter:
  /*msr spsr, r1*/
  stmfd sp!, {r4-r12, lr}
	ldr r1, ker_sp
	str sp, [r1]
  mov sp, r0
  ldmfd	sp!, {lr}
	/*mrs r0, cpsr
  orr r0, r0, #12
	msr cpsr, r0*/

  /*ldmfd	sp!, {r4-r12, lr}*/
  /*mrs r0, cpsr
  eor r0, r0, #12
	msr cpsr, r0*/
  movs pc, lr

.global asm_write_ksp
asm_write_ksp:
	str r0, ker_sp
  /*ldr r0, asm_swi
  mov r1, #0x18
  str r0, [r1]*/
	mov pc, lr

ker_sp:
	.word 0

.global asm_swi
asm_swi:
	mov r3, lr /*lr in svs is the old pc*/
  mrs r2, cpsr
  orr r2, r2, #12
  msr cpsr, r2
	stmfd sp!, {r4-r12, lr, r3}
	mov r0, sp /*return the user's sp*/
  mrs r2, cpsr
  eor r2, r2, #12
  msr cpsr, r2
  ldr r3, ker_sp
  ldr sp, [r3]
	ldmfd sp!, {r4-r12, lr}
	mov pc, lr /*returns from enter*/
