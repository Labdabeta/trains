/*
 * kern.c
*/

#include <ts7200.h>
#include <progh.h>

#define magic 0x00218000

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

int isdigit(char c){
 return c >= '0' && c <= '9';
}

int isspace(char c){
 return c == ' ' || c == '\n' || c == '\r' || c == '\t';
}

void run(void (*taskcode) (), unsigned int stack){
  asm(
    #include "switch.s"
    :
    :"r" (taskcode), "r" (stack)
  );
}

int main(){
  setflags();
  run ( hello + magic , magic + 0x00100000);
#if 0
  vint *flags2 = (int *)( UART2_BASE + UART_FLAG_OFFSET );
  vint *data2 = (int *)( UART2_BASE + UART_DATA_OFFSET );
  while(*flags2 & TXFF_MASK);
  *data2 = 'Y';
	return 0;
#endif
}
