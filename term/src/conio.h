#ifndef CONIO_H
#define CONIO_H

void initTerminals(void);
void quitTerminals(void);

/* Returns the character, or -1 if no input. */
int local_getc(void);
int com2_getc(void);

void local_putc(char);
void com2_putc(char);

#endif /* CONIO_H */
