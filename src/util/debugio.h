#ifndef DEBUGIO_H
#define DEBUGIO_H

/* Initializes coms for busy-wait debugging. */
void init_debugio(void);

void cleanup_debugio(void);

void debugio_putc(char c);

void debugio_putstr(const char *str);

void debugio_putint_decimal(int x);

void debugio_putuint_decimal(unsigned int x);

void debugio_putint_hex(int x);

int debugio_getc(void);

#ifdef DEBUG_MODE
#define DEBUG_PREAMBLE() do { \
	debugio_putstr(__FILE__ "@"); \
	debugio_putstr(__func__); \
	debugio_putc(':'); \
	debugio_putint_decimal(__LINE__); \
	debugio_putstr("\t"); \
	} while (0)
#define DEBUG_DUMP_VAL(val) do { \
	DEBUG_PREAMBLE(); \
	debugio_putstr(#val ": "); \
	debugio_putint_decimal((int)(val)); \
	debugio_putstr("\n\r"); \
	} while (0)
#define DEBUG_DUMP_UVAL(val) do { \
	DEBUG_PREAMBLE(); \
	debugio_putstr(#val ": "); \
	debugio_putuint_decimal((unsigned int)(val)); \
	debugio_putstr("\n\r"); \
	} while (0)
#define DEBUG_DUMP_LONG_VAL(val) do { \
	DEBUG_PREAMBLE(); \
	debugio_putstr(#val ": "); \
	debugio_putuint_decimal((unsigned int)(((unsigned long long int)val)>>32)); \
	debugio_putuint_decimal((unsigned int)(((unsigned long long int)val))); \
	debugio_putstr("\n\r"); \
	} while (0)

#define DEBUG_DUMP_ADR(adr) do { debugio_putstr(__FILE__ "@"); debugio_putstr(__func__); debugio_putc(':'); debugio_putint_decimal(__LINE__); debugio_putstr("\t" #adr ": 0x"); debugio_putint_hex((int)(adr)); debugio_putstr("\n\r"); } while (0)
#define DEBUG_DUMP_REG(reg) do { int __tmpreg; asm volatile ("mov %0, " reg : "=r"(__tmpreg)); debugio_putstr(__FILE__ "@"); debugio_putstr(__func__); debugio_putc(':'); debugio_putint_decimal(__LINE__); debugio_putstr("\t" reg ": 0x"); debugio_putint_hex(__tmpreg); debugio_putstr("\n\r"); } while (0)
#define DEBUG_DUMP_STACK(offset) do { int __tmpreg; asm volatile ("ldr %0, [sp, #" offset "]": "=r"(__tmpreg)); debugio_putstr(__FILE__ "@"); debugio_putstr(__func__); debugio_putc(':'); debugio_putint_decimal(__LINE__); debugio_putstr("\tsp + #" offset ": 0x"); debugio_putint_hex(__tmpreg); debugio_putstr("\n\r"); } while (0)
#define DEBUG_DUMP_FRAME(offset) do { int __tmpreg; asm volatile ("ldr %0, [fp, #" offset "]": "=r"(__tmpreg)); debugio_putstr(__FILE__ "@"); debugio_putstr(__func__); debugio_putc(':'); debugio_putint_decimal(__LINE__); debugio_putstr("\tfp + #" offset ": 0x"); debugio_putint_hex(__tmpreg); debugio_putstr("\n\r"); } while (0)
#define DEBUG_PRINT(string) do { debugio_putstr(__FILE__ "@"); debugio_putstr(__func__); debugio_putc(':'); debugio_putint_decimal(__LINE__); debugio_putstr("\t"); debugio_putstr(string); debugio_putstr("\n\r"); } while (0)
#define DEBUG_PASS(X) do { debugio_putstr(X); } while (0)
#else
#define DEBUG_DUMP_VAL(val) ((void)val)
#define DEBUG_DUMP_UVAL(val) ((void)val)
#define DEBUG_DUMP_LONG_VAL(val) ((void)val)
#define DEBUG_DUMP_ADR(adr) ((void)adr)
#define DEBUG_DUMP_REG(reg) ((void)reg)
#define DEBUG_DUMP_STACK(offset) ((void)offset)
#define DEBUG_DUMP_FRAME(offset) ((void)offset)
#define DEBUG_PRINT(string) ((void)string)
#define DEBUG_PASS(X) ((void)X)
#endif

void debugio_dump_registers(void);

#endif /* DEBUGIO_H */
