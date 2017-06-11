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
	. = 0x0ffd00;

    all : { *(*) } > ram
}
