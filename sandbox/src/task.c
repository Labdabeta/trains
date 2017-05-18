#include <task.h>

typedef struct State {
  int registers[11]; // r4-r12, lr, pc
} State;

static void exit(){
  // make a task done sys-call
}

void activate(TD *td, void (*entry) ()){
  State *frame = (State*) (magic + 0x00100000);
  td->sp = (uint*) (magic + 0x00100000 + sizeof(State) - 0x4);
  frame->registers[10] = (int) entry; // PC
  frame->registers[9] = (int) (exit + magic); // LR
  frame->registers[7] = (int) frame; // FP
  td->CPSR = 0xd0;
}

void enter(TD *td){
  td->sp = asm_enter(td->sp, td->CPSR);
}
