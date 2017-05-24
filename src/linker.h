#ifndef LINKER_H
#define LINKER_H

extern char CODE_BASE;

#define fn_ptr(x) (x + (int)(&CODE_BASE))

#endif /* LINKER_H */
