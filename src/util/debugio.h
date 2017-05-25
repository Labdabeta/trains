#ifndef DEBUGIO_H
#define DEBUGIO_H

/* Initializes coms for busy-wait debugging. */
void init_debugio(void);

void debugio_putc(char c);

void debugio_putstr(char *str);

void debugio_putint_decimal(int x);

void debugio_putint_hex(int x);

#ifdef DEBUG_MODE
#define DEBUG_DUMP_VAL(val) do { debugio_putstr(#val ": "); debugio_putint_decimal((int)(val)); debugio_putstr("\n\r"); } while (0)
#define DEBUG_DUMP_ADR(adr) do { debugio_putstr(#adr ": 0x"); debugio_putint_hex((int)(adr)); debugio_putstr("\n\r"); } while (0)
#define DEBUG_DUMP_REG(reg) do { int __tmpreg; asm volatile ("mov %0, " reg : "=r"(__tmpreg)); debugio_putstr(reg ": 0x"); debugio_putint_hex(__tmpreg); debugio_putstr("\n\r"); } while (0)
#define DEBUG_DUMP_STACK(offset) do { int __tmpreg; asm volatile ("ldr %0, [sp, #" offset "]": "=r"(__tmpreg)); debugio_putstr("sp + #" offset ": 0x"); debugio_putint_hex(__tmpreg); debugio_putstr("\n\r"); } while (0)
#define DEBUG_DUMP_FRAME(offset) do { int __tmpreg; asm volatile ("ldr %0, [fp, #" offset "]": "=r"(__tmpreg)); debugio_putstr("fp + #" offset ": 0x"); debugio_putint_hex(__tmpreg); debugio_putstr("\n\r"); } while (0)
#else
#define DEBUG_DUMP_VAL(val)
#define DEBUG_DUMP_ADR(adr)
#define DEBUG_DUMP_REG(reg)
#define DEBUG_DUMP_STACK(offset)
#define DEBUG_DUMP_FRAME(offset)
#endif

void debugio_dump_registers(void);

#endif /* DEBUGIO_H */
