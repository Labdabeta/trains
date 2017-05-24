.PHONY: clean default all debug prod push report small
.SUFFIXES:

CC=res/bin/gcc --prefix=res/4.0.2/
AS=res/bin/as
LD=res/bin/ld

LIBS=-Lres/lib
CLIBS=-lgcc

LDSCRIPT=load.ld
CPU=-mcpu=arm920t

prod:CFLAGS+=-O2
small:CFLAGS+=-Os
debug:CFLAGS+=-g -DDEBUG_MODE

CFLAGS=-c -fPIC -Wall $(CPU) -msoft-float -DEXIT_SUCCESS=0 -DEXIT_FAILURE=1 -Dsize_t="unsigned int" -nostdlib -Isrc -Isrc/kernel/ -Isrc/util/
ASFLAGS=-mcpu=arm920t -mapcs-32
LDFLAGS=-init main -N -T $(LDSCRIPT) $(LIBS)

TARGETS=kernel.elf
SOURCES=$(shell find src -name '*.c')
MODULES=$(filder-out main.c,$(SOURCES))
OBJECTS=$(patsubst %.c,%.o,$(SOURCES)) src/kernel/context_switch.o
HEADERS=$(patsubst %.c,%.h,$(MODULES))

default: debug

all: debug prod report

debug:$(TARGETS)
prod:$(TARGETS)
small:$(TARGETS)

%.s: %.c
	$(CC) $(CFLAGS) $< -S -o $@

%.o: %.s
	$(AS) $(ASFLAGS) $< -o $@

%.elf: $(OBJECTS)
	$(LD) $(LDFLAGS) -Map $*.map -o $@ $^ $(CLIBS)

push:
	./push_kernel.sh

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
