#ifndef LINKER_H
#define LINKER_H

extern char CODE_BASE;

#define fn_ptr(x) (x + (int)(&CODE_BASE))

// gcc provides a stack-based alloc implementation
#define alloc(x) __builtin_alloca(x)

#endif /* LINKER_H */
