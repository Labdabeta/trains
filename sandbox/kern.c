/*
 * kern.c
*/

#include <ts7200.h>

void setflags() {
 int *tctrl = (int *) ( TIMER3_BASE + CRTL_OFFSET );
 *tctrl |= ENABLE_MASK;
 int* low = (int *)( UART1_BASE + UART_LCRL_OFFSET );
 *low &= 0xffffff00;
 *low |= 191;
 int* line = (int *)( UART2_BASE + UART_LCRH_OFFSET );
 *line &= ~FEN_MASK;
 int* vasd = (int *)( UART1_BASE + UART_LCRH_OFFSET );
 *vasd &= 0xffffff00;
 *vasd |= 0x68;
}

int main(){
  setflags();
}
