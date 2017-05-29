#ifndef INTERFACE_H
#define INTERFACE_H

/** Passes a 3 argument function call to the kernel.
 *
 * This is significantly faster than callSystemInterruptLong. All fast syscalls
 * use this only.
 *
 * \param[in] arg0             The first argument to the syscall.
 * \param[in] arg1             The second argument to the syscall.
 * \param[in] arg2             The third argument to the syscall.
 * \param[in] code             The code number of the syscall.
 *
 * \return The returned value of the syscall.
 */
extern int asm_callSystemInterrupt(int arg0, int arg1, int arg2, int code);

#endif /* INTERFACE_H */
