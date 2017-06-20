#include "conio.h"
#include <stdio.h>

int main()
{
    int i;
    initTerminals();
    while (1) {
        i = local_getc();
        if (!(i < 0)) {
            if (i == 'q' || !i) break;
            local_putc(i);
            com2_putc(i);
        }

        i = com2_getc();
        if (!(i < 0)) {
            local_putc(i);
        }
    }
    quitTerminals();
}
