/* Assumptions:
 * %1 - sp
 * %2 - entry
 * %3 - usr_cpsr */

"mov spsr_svs, %3\n"
"stmfd sp!, {sl, fp, ip, lr}\n"
"stmfd sp!, {r4-r9}\n"
"mov lr, %2\n"
"mov sp, %1\n"
"orr cpsr, cpsr, #15\n"
"ldmfd	sp!, {r4-r9}"
"stmfd sp!, {sl, fp, ip, lr}\n"
"eor cpsr, cpsr, #15\n"
"str sp, [%1]\n"
"movs pc, lr\n"
