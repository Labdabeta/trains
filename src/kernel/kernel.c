extern void asm_write_kernel_stack(volatile int *kernel_sp);

int main(int argc, char *argv[])
{
	volatile int kernel_sp;

	asm_write_kernel_stack(&kernel_sp);
}
