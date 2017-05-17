/*
 * kern.c
*/

#include <ts7200.h>
#include <progh.h>
#include <task.h>

extern void task_start();

void setflags() {
 vint *tctrl = (int *) ( TIMER3_BASE + CRTL_OFFSET );
 *tctrl |= ENABLE_MASK;
 vint* low = (int *)( UART1_BASE + UART_LCRL_OFFSET );
 *low &= 0xffffff00;
 *low |= 191;
 vint* line = (int *)( UART2_BASE + UART_LCRH_OFFSET );
 *line &= ~FEN_MASK;
 vint* vasd = (int *)( UART1_BASE + UART_LCRH_OFFSET );
 *vasd &= 0xffffff00;
 *vasd |= 0x68;
}

int main(){
  setflags();
  cbuff out;
  cbinit(&out);
  cbputstr(&out, "Kernell startup\r\n");
  bwout(&out);

  TD mytask;

  //Causes a casche miss to install en estaz trap frame on the user stack
  activate(&mytask, hello + magic);

  int i;
  for(i = 0; i < 3; i++){
    cbputstr(&out, "Entering task\r\n");
    bwout(&out);

    enter(&mytask);
    
    cbputstr(&out, "Left task\r\n");
    bwout(&out);
  }
}
