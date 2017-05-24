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

	/* Initialized data. */
	data : {
		_DataStart = . ; /* Save start of data */
	   	*(.data) /* Put any .data section here */
		_DataEnd = . ;  /* Save end of data */
	} >ram /* Put it in ram */

	/* Uninitialized data. */
	bss : {
		_BssStart = . ; /* Save start of bss */
		*(.bss) /* Put any .bss section here */
		_BssEnd = . ;  /* Save end of bss */
	} >ram /* Put it in ram */

	/* Code. */
	text : {
		/* Any file's any of the following sections go here: */
		*(.text)
		*(.got)
		*(.got.plt)
		*(.rodata)
		*(.glue_7)
		*(.glue_7t)
		*(.rodata.str1.4)
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
