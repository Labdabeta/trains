#include <task.h>

typedef struct State {
  int registers[16]; // indexed backwards as 15 - r
} State;

static void exit(){
  // make a task done sys-call
}

void activate(TD *td, void (*entry) ()){
  State *frame = (State*) (magic + 0x00100000);
  td->sp = magic + 0x00100000 + sizeof(State);
  frame->registers[15] = entry; // PC
  frame->registers[14] = (int) (exit + magic); // LR
  frame->registers[13] = &frame; // SP
  frame->registers[11] = &frame; // FP
  td->CPSR = 16;
}

void enter(TD *td){
  asm_enter(td->sp, td->CPSR);
#if 0
  asm(
    #include "switch.s"
    :
    :"r" (taskcode), "r" (stack)
  );
#endif
}
