/* Start execution at "main" */
ENTRY (main)

MEMORY
{
	/* RAM is 32M from 0 */
	ram : ORIGIN = 0x00000000, LENGTH = 32M

	/* ROM is 8M from 0x60000000 */
	rom : ORIGIN = 0x60000000, LENGTH = 8M
}

SECTIONS
{
	/* Start at 0x100000 */
	. = 0x100000;

	CODE_BASE = . ;

	/* Instruction cache sensitive code. */
	good_text : {
		src/kernel/kernel.o(.text)
		src/kernel/scheduler.o(.text)
		src/kernel/context_switch.o(.text)
		src/kernel/handlers.o(.text)
		src/util/buffer.o(.text)
		src/memcpy.o(.text)
		src/syscall.o(.text)
	} >ram /* Put it in ram */

	/* Task's code. */
	tasks : {
		src/tasks/*.o(.text)
	} >ram /* Put it in ram */

	/* Code. */
	text : {
		/* Any file's any of the following sections go here: */
		*(.text)
		*(.got)
		*(.got.plt)
	} >ram /* Put it in ram */

	/* Uninitialized data. */
	bss : {
		_BssStart = . ; /* Save start of bss */
		*(.bss) /* Put any .bss section here */
		*(.rodata)
		*(.glue_7)
		*(.glue_7t)
		*(.rodata.str1.4)
		*(COMMON)
		_BssEnd = . ;  /* Save end of bss */
	} >ram /* Put it in ram */

	/* Instruction cache faulting code. */
	bad_text : {
		src/kernel/task.o(.text)
		src/util/debugio.o(.text)
	} >ram /* Put it in ram */

	/* Initialized data. */
	data : {
		_DataStart = . ; /* Save start of data */
	   	*(.data) /* Put any .data section here */
		_DataEnd = . ;  /* Save end of data */
	} >ram /* Put it in ram */

	_TopOfProgram = . ;
}


/* TIPS:
 * file-glob(.section) puts all files that meet the glob's .section sections
 * here.
 *
 * . is the 'current address.
 *
 * variables created here can be used as addresses in code!
 */
