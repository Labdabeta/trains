/*
 * progh.c
*/

#include <ts7200.h>
#include <cbuff.h>
#include <progh.h>

void hello(){
  cbuff out;
  cbinit(&out);
  char str[] = "Hello world!\r\n";
  cbputstr(&out, str);
  char c;
  vint *flags2 = (int *)( UART2_BASE + UART_FLAG_OFFSET );
  vint *data2 = (int *)( UART2_BASE + UART_DATA_OFFSET );
  while(!cbpeak(&out, &c)){
    if(!( *flags2 & TXFF_MASK )){
      *data2 = c;
      cbpop(&m_out);
    }
  }
}
