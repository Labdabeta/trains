.PHONY: clean default all debug prod qemu run-qemu push report
.SUFFIXES:

CC=res/bin/gcc --prefix=res/4.0.2/
AS=res/bin/as
LD=res/bin/ld

LIBS=-Lres/lib
CLIBS=-lgcc

LDSCRIPT=load.ld
CPU=-mcpu=arm920t

prod:CFLAGS+=-O2
debug:CFLAGS+=-g -DDEBUG_MODE
qemu:CFLAGS+=-DQEMU
qemu:CC=arm-none-eabi-gcc
qemu:AS=arm-none-eabi-as
qemu:LD=arm-none-eabi-ld
qemu:CLIBS=
qemu:LDSCRIPT=qemu.ld

CFLAGS=-c -fPIC -Wall $(CPU) -msoft-float -ansi -DEXIT_SUCCESS=0 -DEXIT_FAILURE=1 -Dsize_t="unsigned int"
ASFLAGS=-mcpu=arm920t -mapcs-32
LDFLAGS=-init main -N -T $(LDSCRIPT) $(LIBS)

TARGETS=kernel.elf
SOURCES=$(shell find src -name '*.c')
MODULES=$(filder-out main.c,$(SOURCES))
OBJECTS=$(patsubst %.c,%.o,$(SOURCES)) src/kernel/context_switch.o
HEADERS=$(patsubst %.c,%.h,$(MODULES))

default: debug

qemu: kernel.bin

all: debug prod report

debug:$(TARGETS)
prod:$(TARGETS)

%.s: %.c
	$(CC) $(CFLAGS) $< -S -o $@

%.o: %.s
	$(AS) $(ASFLAGS) $< -o $@

%.elf: $(OBJECTS)
	$(LD) $(LDFLAGS) -Map $*.map -o $@ $^ $(CLIBS)

%.bin: %.elf
	arm-none-eabi-objcopy -O binary $< $@

run-qemu:
	qemu-system-arm -M versatilepb -m 32M -nographic -nodefaults -kernel kernel.bin

push:
	scp kernel.elf laburke@linux.student.csuwaterloo.ca:/u/cs452/tftp/ARM/laburke/kernel.elf

report:
	echo --- TODO

clean:
	-@find -name '*.map' -delete
	-@find -name '*.o' -delete
	-@find -name '*.bin' -delete
	-@find -name '*.elf' -delete
	-@find -name '*.pdf' -delete
	-@find -name '*.aux' -delete
	-@find -name '*.log' -delete

print-%:
	@echo $* = $($*)
