#ifndef DEBUGIO_H
#define DEBUGIO_H

/* Initializes coms for busy-wait debugging. */
void init_debugio(void);

void debugio_putc(char c);

void debugio_putstr(char *str);

void debugio_putint_decimal(int x);

void debugio_putint_hex(int x);

#define DEBUG_DUMP_VAL(val) do { debugio_putstr("\n\r" #val ": "); debugio_putint_decimal((int)(val)); debugio_putstr("\n\r"); } while (0)
#define DEBUG_DUMP_ADR(adr) do { debugio_putstr("\n\r" #adr ": 0x"); debugio_putint_hex((int)(adr)); debugio_putstr("\n\r"); } while (0)

#endif /* DEBUGIO_H */
