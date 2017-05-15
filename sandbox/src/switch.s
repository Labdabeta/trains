.global task_start
task_start:
  stmfd r13!, {r4-r9}
  str r13, [r1]
  sub r1, r1, #4
  mov r13, r1
  blx r0
  ldr r13, [r13]
