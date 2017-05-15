task_start:
  stmfd R13! {R4-R9}
  str R13, [R1]
  sub R1, R1, #4
  move R13, R1
  bl R0
  ldr R13, [R13]
