extern void asm_SetupTrap(volatile int *kernel_sp);

int main(int argc, char *argv[])
{
	volatile int kernel_sp;

	asm_SetupTrap(&kernel_sp);

	return 0;
}
