XCC     = gcc
AS	= as
LD      = ld
CFLAGS  = -c -fPIC -Wall -Iinclude -mcpu=arm920t -msoft-float -fno-builtin -ffreestanding
ASFLAGS	= -mcpu=arm920t -mapcs-32
LDFLAGS = -init main -Map kern.map -N  -T orex.ld -L/u/wbcowan/gnuarm-4.0.2/lib/gcc/arm-elf/4.0.2

src = $(wildcard src/*.c)
asm = $(src:.c=.s) switch.s
obj = $(asm:.s=.o)

all: $(obj,D) context.o kern.elf

cbuff.s: src/cbuff.c
	$(XCC) -S $(CFLAGS) src/cbuff.c

cbuff.o: cbuff.s
	$(AS) $(ASFLAGS) -o cbuff.o cbuff.s

stdlib.s: src/stdlib.c
	$(XCC) -S $(CFLAGS) src/stdlib.c

stdlib.o: stdlib.s
	$(AS) $(ASFLAGS) -o stdlib.o stdlib.s

kern.s: src/kern.c src/switch.s
	$(XCC) -S $(CFLAGS) src/kern.c

kern.o: kern.s
	$(AS) $(ASFLAGS) -o kern.o kern.s

progh.s: src/progh.c
	$(XCC) -S $(CFLAGS) src/progh.c

progh.o: progh.s
	$(AS) $(ASFLAGS) -o progh.o progh.s

task.s: src/task.c
	$(XCC) -S $(CFLAGS) src/task.c

task.o: task.s
	$(AS) $(ASFLAGS) -o task.o task.s

context.o: src/context_switch.s
	$(AS) $(ASFLAGS) -o context.o src/context_switch.s

kern.elf: kern.o cbuff.o stdlib.o progh.o task.o context.o
	$(LD) $(LDFLAGS) -o kern.elf kern.o task.o context.o cbuff.o stdlib.o progh.o -lgcc
	cp kern.elf /u/cs452/tftp/ARM/tkolomat/

clean:
	-rm -f *.s *.a *.o *.map *.elf
