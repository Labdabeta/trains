#ifndef DEBUGIO_H
#define DEBUGIO_H

/* Initializes coms for busy-wait debugging. */
void init_debugio(void);

void debugio_putc(char c);

void debugio_putstr(char *str);

void debugio_putint_decimal(int x);

void debugio_putint_hex(int x);

#ifdef DEBUG_MODE
#define DEBUG_DUMP_VAL(val) do { debugio_putstr(__FILE__ ":"); debugio_putint_decimal(__LINE__); debugio_putstr("\t" #val ": "); debugio_putint_decimal((int)(val)); debugio_putstr("\n\r"); } while (0)
#define DEBUG_DUMP_ADR(adr) do { debugio_putstr(__FILE__ ":"); debugio_putint_decimal(__LINE__); debugio_putstr("\t" #adr ": 0x"); debugio_putint_hex((int)(adr)); debugio_putstr("\n\r"); } while (0)
#define DEBUG_DUMP_REG(reg) do { int __tmpreg; asm volatile ("mov %0, " reg : "=r"(__tmpreg)); debugio_putstr(__FILE__ ":"); debugio_putint_decimal(__LINE__); debugio_putstr("\t" reg ": 0x"); debugio_putint_hex(__tmpreg); debugio_putstr("\n\r"); } while (0)
#define DEBUG_DUMP_STACK(offset) do { int __tmpreg; asm volatile ("ldr %0, [sp, #" offset "]": "=r"(__tmpreg)); debugio_putstr(__FILE__ ":"); debugio_putint_decimal(__LINE__); debugio_putstr("\tsp + #" offset ": 0x"); debugio_putint_hex(__tmpreg); debugio_putstr("\n\r"); } while (0)
#define DEBUG_DUMP_FRAME(offset) do { int __tmpreg; asm volatile ("ldr %0, [fp, #" offset "]": "=r"(__tmpreg)); debugio_putstr(__FILE__ ":"); debugio_putint_decimal(__LINE__); debugio_putstr("\tfp + #" offset ": 0x"); debugio_putint_hex(__tmpreg); debugio_putstr("\n\r"); } while (0)
#define DEBUG_PRINT(string) do { debugio_putstr(__FILE__ ":"); debugio_putint_decimal(__LINE__); debugio_putstr("\t"); debugio_putstr(string); debugio_putstr("\n\r"); } while (0)
#else
#define DEBUG_DUMP_VAL(val)
#define DEBUG_DUMP_ADR(adr)
#define DEBUG_DUMP_REG(reg)
#define DEBUG_DUMP_STACK(offset)
#define DEBUG_DUMP_FRAME(offset)
#define DEBUG_PRINT(string)
#endif

void debugio_dump_registers(void);

#endif /* DEBUGIO_H */
