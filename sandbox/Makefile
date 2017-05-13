XCC     = gcc
AS	= as
LD      = ld
CFLAGS  = -c -fPIC -Wall -I../include -mcpu=arm920t -msoft-float -fno-builtin -ffreestanding
ASFLAGS	= -mcpu=arm920t -mapcs-32
LDFLAGS = -init main -Map kern.map -N  -T orex.ld -L/u/wbcowan/gnuarm-4.0.2/lib/gcc/arm-elf/4.0.2

src = $(wildcard src/*.c)
asm = $(src:.c=.s) switch.s
obj = $(asm:.s=.o)

all: $(obj) switch.o kern.elf
	cd build

cbuff.s: ../src/cbuff.c
	$(XCC) -S $(CFLAGS) ../src/cbuff.c

cbuff.o: cbuff.s
	$(AS) $(ASFLAGS) -o cbuff.o cbuff.s

stdlib.s: ../src/stdlib.c
	$(XCC) -S $(CFLAGS) ../src/stdlib.c

stdlib.o: stdlib.s
	$(AS) $(ASFLAGS) -o stdlib.o stdlib.s

kern.s: ../src/kern.c
	$(XCC) -S $(CFLAGS) ../src/kern.c

kern.o: kern.s
	$(AS) $(ASFLAGS) -o kern.o kern.s

switch.o: ../src/switch.s
	$(AS) $(ASFLAGS) -o switch.o ../src/switch.s

kern.elf: kern.o cbuff.o stdlib.o switch.o
	$(LD) $(LDFLAGS) -o kern.elf kern.o switch.o cbuff.o stdlib.o -lgcc
	cp kern.elf /u/cs452/tftp/ARM/tkolomat/

clean:
	-rm -f *.s *.a *.o *.map *.elf
