#ifndef DEBUGIO_H
#define DEBUGIO_H

/* Initializes coms for busy-wait debugging. */
void init_debugio(void);

void debugio_putc(char c);

void debugio_putstr(char *str);

#endif /* DEBUGIO_H */
