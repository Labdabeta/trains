.PHONY: clean default all debug prod push report small prodebug log
.SUFFIXES:

CC=res/bin/arm-none-eabi-gcc --prefix=./res/6.3.1
AS=res/bin/arm-none-eabi-as
LD=res/bin/arm-none-eabi-ld

LIBS=-Lres/lib
CLIBS=-lgcc

LDSCRIPT=load.ld
CPU=-mcpu=arm920t -mtune=arm920t

prod:CFLAGS+=-O2 -Werror
prodebug:CFLAGS+=-O2 -DDEBUG_MODE
small:CFLAGS+=-Os -Werror
debug:CFLAGS+=-g -DDEBUG_MODE

GIT_STUFF="-DGIT_NAME=\"$(shell git log --pretty='%an %h %d' -n 1)\""

CFLAGS=-c -fPIC -Wall $(CPU) -msoft-float -DEXIT_SUCCESS=0 -DEXIT_FAILURE=1 -Dsize_t="unsigned int" -Dever=";;" -nostdlib -Isrc -Isrc/util/ -Isrc/tasks/ -Isrc/tasks/A0 -Isrc/tasks/drivers $(GIT_STUFF)
ASFLAGS=-mcpu=arm920t -mapcs-32 -march=armv4t
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
prodebug:$(TARGETS)
small:$(TARGETS)

%.s: %.c
	$(CC) $(CFLAGS) $< -S -o $@

%.o: %.s
	$(AS) $(ASFLAGS) $< -o $@

%.elf: $(OBJECTS)
	$(LD) $(LDFLAGS) -Map $*.map -o $@ $^ $(CLIBS)

log: log.c
	$(CC) $(CFLAGS) -Os log.c -S -o log.s
	$(AS) $(ASFLAGS) log.s -o log.o
	$(LD) -init main -N -T log.ld $(LIBS) -lgcc -o log.elf log.o

push:
	./push_kernel.sh

report: reports/k1.pdf reports/k2.pdf reports/k3.pdf reports/k4.pdf reports/ai.pdf reports/tc1.pdf

reports/%.pdf: reports/%.tex
	cd reports && sed "s/{{{commit hash}}}/$(shell git rev-parse HEAD)/g" < $*.tex > real.tex && lualatex --jobname=$* real.tex && rm real.tex

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
