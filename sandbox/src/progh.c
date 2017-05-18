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
  while(1){
    cbputstr(&out, str);
    bwout(&out);
    /*asm volatile(
      "swi 0"
    );*/
  }
}
