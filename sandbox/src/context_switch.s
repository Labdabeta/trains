/* Assumptions:
 * r0 - sp
 * r1 - usr_cpsr */

.global asm_enter
  mov spsr_svs, r2
  stmfd sp!, {sl, fp, ip, lr}
  stmfd sp!, {r4-r9}
  mov sp, r0
  ldmfd	sp!, {lr}
  orr cpsr, cpsr, #15
  ldmfd	sp!, {r4-r9}
  ldmfd sp!, {sl, fp, ip, lr}
  eor cpsr, cpsr, #15
  movs pc, lr
