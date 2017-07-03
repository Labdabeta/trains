	.cpu arm920t
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.bss
	.align	2
_cout_tid:
	.space	4
	.size	_cout_tid, 4
	.align	2
_tout_tid:
	.space	4
	.size	_tout_tid, 4
	.align	2
_cin_tid:
	.space	4
	.size	_cin_tid, 4
	.align	2
_tin_tid:
	.space	4
	.size	_tin_tid, 4
	.text
	.align	2
	.global	cgetc
	.syntax unified
	.arm
	.fpu softvfp
	.type	cgetc, %function
cgetc:
.LFB0:
	.file 1 "src/tasks/main.c"
	.loc 1 11 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	.loc 1 11 0
	ldr	r3, .L3
.LPIC0:
	add	r3, pc, r3
	ldr	r3, [r3]
	mov	r1, #2
	mov	r0, r3
	bl	Getc(PLT)
	mov	r3, r0
	and	r3, r3, #255
	mov	r0, r3
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L4:
	.align	2
.L3:
	.word	_cin_tid-(.LPIC0+8)
	.cfi_endproc
.LFE0:
	.size	cgetc, .-cgetc
	.align	2
	.global	tgetc
	.syntax unified
	.arm
	.fpu softvfp
	.type	tgetc, %function
tgetc:
.LFB1:
	.loc 1 12 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	.loc 1 12 0
	ldr	r3, .L7
.LPIC1:
	add	r3, pc, r3
	ldr	r3, [r3]
	mov	r1, #1
	mov	r0, r3
	bl	Getc(PLT)
	mov	r3, r0
	and	r3, r3, #255
	mov	r0, r3
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L8:
	.align	2
.L7:
	.word	_tin_tid-(.LPIC1+8)
	.cfi_endproc
.LFE1:
	.size	tgetc, .-tgetc
	.align	2
	.global	cputc
	.syntax unified
	.arm
	.fpu softvfp
	.type	cputc, %function
cputc:
.LFB2:
	.loc 1 13 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #8
	mov	r3, r0
	strb	r3, [fp, #-5]
	.loc 1 13 0
	ldr	r3, .L10
.LPIC2:
	add	r3, pc, r3
	ldr	r3, [r3]
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	mov	r1, #2
	mov	r0, r3
	bl	Putc(PLT)
	nop
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L11:
	.align	2
.L10:
	.word	_cout_tid-(.LPIC2+8)
	.cfi_endproc
.LFE2:
	.size	cputc, .-cputc
	.align	2
	.global	cputstr
	.syntax unified
	.arm
	.fpu softvfp
	.type	cputstr, %function
cputstr:
.LFB3:
	.loc 1 14 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	.loc 1 14 0
	ldr	r3, .L13
.LPIC3:
	add	r3, pc, r3
	ldr	r3, [r3]
	ldr	r2, [fp, #-8]
	mov	r1, #2
	mov	r0, r3
	bl	Putstr(PLT)
	nop
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L14:
	.align	2
.L13:
	.word	_cout_tid-(.LPIC3+8)
	.cfi_endproc
.LFE3:
	.size	cputstr, .-cputstr
	.align	2
	.global	tputc
	.syntax unified
	.arm
	.fpu softvfp
	.type	tputc, %function
tputc:
.LFB4:
	.loc 1 15 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #8
	mov	r3, r0
	strb	r3, [fp, #-5]
	.loc 1 15 0
	ldr	r3, .L16
.LPIC4:
	add	r3, pc, r3
	ldr	r3, [r3]
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	mov	r1, #1
	mov	r0, r3
	bl	Putc(PLT)
	nop
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L17:
	.align	2
.L16:
	.word	_tout_tid-(.LPIC4+8)
	.cfi_endproc
.LFE4:
	.size	tputc, .-tputc
	.align	2
	.global	tput2
	.syntax unified
	.arm
	.fpu softvfp
	.type	tput2, %function
tput2:
.LFB5:
	.loc 1 16 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #8
	mov	r3, r0
	mov	r2, r1
	strb	r3, [fp, #-5]
	mov	r3, r2
	strb	r3, [fp, #-6]
	.loc 1 16 0
	ldr	r3, .L19
.LPIC5:
	add	r3, pc, r3
	ldr	r3, [r3]
	ldrb	r2, [fp, #-6]	@ zero_extendqisi2
	ldrb	r1, [fp, #-5]	@ zero_extendqisi2
	mov	r0, r3
	bl	sendToutBytePair(PLT)
	nop
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L20:
	.align	2
.L19:
	.word	_tout_tid-(.LPIC5+8)
	.cfi_endproc
.LFE5:
	.size	tput2, .-tput2
	.align	2
	.global	printf_putc
	.syntax unified
	.arm
	.fpu softvfp
	.type	printf_putc, %function
printf_putc:
.LFB6:
	.loc 1 17 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	mov	r3, r1
	strb	r3, [fp, #-9]
	.loc 1 17 0
	ldrb	r3, [fp, #-9]	@ zero_extendqisi2
	mov	r0, r3
	bl	cputc(PLT)
	nop
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE6:
	.size	printf_putc, .-printf_putc
	.section	.rodata
	.align	2
.LC0:
	.ascii	"CLOCK\000"
	.align	2
.LC1:
	.ascii	"CIN\000"
	.align	2
.LC2:
	.ascii	"COUT\000"
	.align	2
.LC3:
	.ascii	"TIN\000"
	.align	2
.LC4:
	.ascii	"TOUT\000"
	.align	2
.LC5:
	.ascii	"SENSOR\000"
	.align	2
.LC6:
	.ascii	"SWITCH\000"
	.align	2
.LC7:
	.ascii	"POSITION\000"
	.text
	.align	2
	.global	main_task
	.syntax unified
	.arm
	.fpu softvfp
	.type	main_task, %function
main_task:
.LFB7:
	.loc 1 20 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #12
	.cfi_def_cfa 11, 4
	ldr	r4, .L39
.LPIC6:
	add	r4, pc, r4
	.loc 1 21 0
	mov	r2, #2
	ldr	r3, .L39+4
	ldr	r3, [r4, r3]
	mov	r1, r3
	mov	r0, #2
	bl	CreateSize(PLT)
	.loc 1 23 0
	mov	r2, #4
	ldr	r3, .L39+8
	ldr	r3, [r4, r3]
	mov	r1, r3
	mov	r0, #2
	bl	CreateSize(PLT)
	.loc 1 24 0
	b	.L23
.L24:
	.loc 1 25 0
	bl	Pass(PLT)
.L23:
	.loc 1 24 0
	ldr	r3, .L39+12
.LPIC7:
	add	r3, pc, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	cmp	r3, #0
	blt	.L24
	.loc 1 27 0
	mov	r2, #1
	ldr	r3, .L39+16
	ldr	r3, [r4, r3]
	mov	r1, r3
	mov	r0, #2
	bl	CreateSize(PLT)
	mov	r2, r0
	ldr	r3, .L39+20
.LPIC8:
	add	r3, pc, r3
	str	r2, [r3]
	.loc 1 28 0
	b	.L25
.L26:
	.loc 1 29 0
	bl	Pass(PLT)
.L25:
	.loc 1 28 0
	ldr	r3, .L39+24
.LPIC9:
	add	r3, pc, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	cmp	r3, #0
	blt	.L26
	.loc 1 31 0
	mov	r2, #2
	ldr	r3, .L39+28
	ldr	r3, [r4, r3]
	mov	r1, r3
	mov	r0, #0
	bl	CreateSize(PLT)
	mov	r2, r0
	ldr	r3, .L39+32
.LPIC10:
	add	r3, pc, r3
	str	r2, [r3]
	.loc 1 32 0
	b	.L27
.L28:
	.loc 1 33 0
	bl	Pass(PLT)
.L27:
	.loc 1 32 0
	ldr	r3, .L39+36
.LPIC11:
	add	r3, pc, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	cmp	r3, #0
	blt	.L28
	.loc 1 35 0
	ldr	r3, .L39+40
	ldr	r3, [r4, r3]
	mov	r2, r3
	ldr	r3, .L39+44
	ldr	r3, [r4, r3]
	add	r3, r2, r3
	mov	r1, r3
	mov	r0, #0
	bl	init_printf(PLT)
	.loc 1 37 0
	mov	r2, #4
	ldr	r3, .L39+48
	ldr	r3, [r4, r3]
	mov	r1, r3
	mov	r0, #2
	bl	CreateSize(PLT)
	mov	r2, r0
	ldr	r3, .L39+52
.LPIC12:
	add	r3, pc, r3
	str	r2, [r3]
	.loc 1 38 0
	b	.L29
.L30:
	.loc 1 39 0
	bl	Pass(PLT)
.L29:
	.loc 1 38 0
	ldr	r3, .L39+56
.LPIC13:
	add	r3, pc, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	cmp	r3, #0
	blt	.L30
	.loc 1 41 0
	mov	r2, #4
	ldr	r3, .L39+60
	ldr	r3, [r4, r3]
	mov	r1, r3
	mov	r0, #2
	bl	CreateSize(PLT)
	mov	r2, r0
	ldr	r3, .L39+64
.LPIC14:
	add	r3, pc, r3
	str	r2, [r3]
	.loc 1 42 0
	b	.L31
.L32:
	.loc 1 43 0
	bl	Pass(PLT)
.L31:
	.loc 1 42 0
	ldr	r3, .L39+68
.LPIC15:
	add	r3, pc, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	cmp	r3, #0
	blt	.L32
	.loc 1 45 0
	mov	r2, #4
	ldr	r3, .L39+72
	ldr	r3, [r4, r3]
	mov	r1, r3
	mov	r0, #3
	bl	CreateSize(PLT)
	.loc 1 46 0
	b	.L33
.L34:
	.loc 1 47 0
	bl	Pass(PLT)
.L33:
	.loc 1 46 0
	ldr	r3, .L39+76
.LPIC16:
	add	r3, pc, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	cmp	r3, #0
	blt	.L34
	.loc 1 49 0
	mov	r2, #4
	ldr	r3, .L39+80
	ldr	r3, [r4, r3]
	mov	r1, r3
	mov	r0, #3
	bl	CreateSize(PLT)
	.loc 1 50 0
	b	.L35
.L36:
	.loc 1 51 0
	bl	Pass(PLT)
.L35:
	.loc 1 50 0
	ldr	r3, .L39+84
.LPIC17:
	add	r3, pc, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	cmp	r3, #0
	blt	.L36
	.loc 1 53 0
	mov	r2, #2
	ldr	r3, .L39+88
	ldr	r3, [r4, r3]
	mov	r1, r3
	mov	r0, #3
	bl	CreateSize(PLT)
	.loc 1 54 0
	b	.L37
.L38:
	.loc 1 55 0
	bl	Pass(PLT)
.L37:
	.loc 1 54 0
	ldr	r3, .L39+92
.LPIC18:
	add	r3, pc, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	cmp	r3, #0
	blt	.L38
	.loc 1 58 0
	ldr	r3, .L39+96
	ldr	r3, [r4, r3]
	mov	r1, r3
	mov	r0, #1
	bl	Create(PLT)
	.loc 1 63 0
	bl	Exit(PLT)
	.loc 1 64 0
	nop
	sub	sp, fp, #12
	.cfi_def_cfa 13, 16
	@ sp needed
	pop	{r4, r5, fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_restore 5
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.L40:
	.align	2
.L39:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC6+8)
	.word	name_server(GOT)
	.word	clock_server(GOT)
	.word	.LC0-(.LPIC7+8)
	.word	cin_server(GOT)
	.word	_cin_tid-(.LPIC8+8)
	.word	.LC1-(.LPIC9+8)
	.word	cout_server(GOT)
	.word	_cout_tid-(.LPIC10+8)
	.word	.LC2-(.LPIC11+8)
	.word	CODE_BASE(GOT)
	.word	printf_putc(GOT)
	.word	tin_server(GOT)
	.word	_tin_tid-(.LPIC12+8)
	.word	.LC3-(.LPIC13+8)
	.word	tout_server(GOT)
	.word	_tout_tid-(.LPIC14+8)
	.word	.LC4-(.LPIC15+8)
	.word	sensors(GOT)
	.word	.LC5-(.LPIC16+8)
	.word	switches(GOT)
	.word	.LC6-(.LPIC17+8)
	.word	position_server(GOT)
	.word	.LC7-(.LPIC18+8)
	.word	gui(GOT)
	.cfi_endproc
.LFE7:
	.size	main_task, .-main_task
.Letext0:
	.file 2 "src/syscall.h"
	.file 3 "src/linker.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x1c8
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF20
	.byte	0xc
	.4byte	.LASF21
	.4byte	.LASF22
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x5
	.4byte	.LASF23
	.byte	0x1
	.4byte	0x64
	.byte	0x2
	.byte	0x8
	.4byte	0x64
	.uleb128 0x6
	.4byte	.LASF1
	.byte	0
	.uleb128 0x6
	.4byte	.LASF2
	.byte	0x1
	.uleb128 0x6
	.4byte	.LASF3
	.byte	0x2
	.uleb128 0x6
	.4byte	.LASF4
	.byte	0x3
	.uleb128 0x6
	.4byte	.LASF5
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.uleb128 0x7
	.4byte	.LASF24
	.byte	0x3
	.byte	0x4
	.4byte	0x76
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF7
	.uleb128 0x8
	.4byte	.LASF8
	.byte	0x1
	.byte	0x7
	.4byte	0x2e
	.uleb128 0x5
	.byte	0x3
	.4byte	_cout_tid
	.uleb128 0x8
	.4byte	.LASF9
	.byte	0x1
	.byte	0x8
	.4byte	0x2e
	.uleb128 0x5
	.byte	0x3
	.4byte	_tout_tid
	.uleb128 0x8
	.4byte	.LASF10
	.byte	0x1
	.byte	0x9
	.4byte	0x2e
	.uleb128 0x5
	.byte	0x3
	.4byte	_cin_tid
	.uleb128 0x8
	.4byte	.LASF11
	.byte	0x1
	.byte	0xa
	.4byte	0x2e
	.uleb128 0x5
	.byte	0x3
	.4byte	_tin_tid
	.uleb128 0x9
	.4byte	.LASF25
	.byte	0x1
	.byte	0x13
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xa
	.4byte	.LASF13
	.byte	0x1
	.byte	0x11
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x103
	.uleb128 0xb
	.4byte	.LASF12
	.byte	0x1
	.byte	0x11
	.4byte	0x25
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xc
	.ascii	"ch\000"
	.byte	0x1
	.byte	0x11
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0xa
	.4byte	.LASF14
	.byte	0x1
	.byte	0x10
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x131
	.uleb128 0xc
	.ascii	"a\000"
	.byte	0x1
	.byte	0x10
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0xc
	.ascii	"b\000"
	.byte	0x1
	.byte	0x10
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0xa
	.4byte	.LASF15
	.byte	0x1
	.byte	0xf
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x154
	.uleb128 0xc
	.ascii	"ch\000"
	.byte	0x1
	.byte	0xf
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0xa
	.4byte	.LASF16
	.byte	0x1
	.byte	0xe
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x178
	.uleb128 0xc
	.ascii	"str\000"
	.byte	0x1
	.byte	0xe
	.4byte	0x178
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.4byte	0x76
	.uleb128 0xa
	.4byte	.LASF17
	.byte	0x1
	.byte	0xd
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1a1
	.uleb128 0xc
	.ascii	"ch\000"
	.byte	0x1
	.byte	0xd
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0xe
	.4byte	.LASF18
	.byte	0x1
	.byte	0xc
	.4byte	0x76
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xe
	.4byte	.LASF19
	.byte	0x1
	.byte	0xb
	.4byte	0x76
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF20:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF17:
	.ascii	"cputc\000"
.LASF9:
	.ascii	"_tout_tid\000"
.LASF6:
	.ascii	"unsigned char\000"
.LASF11:
	.ascii	"_tin_tid\000"
.LASF2:
	.ascii	"TASK_SIZE_BIG\000"
.LASF15:
	.ascii	"tputc\000"
.LASF21:
	.ascii	"src/tasks/main.c\000"
.LASF8:
	.ascii	"_cout_tid\000"
.LASF16:
	.ascii	"cputstr\000"
.LASF12:
	.ascii	"unused\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF7:
	.ascii	"char\000"
.LASF25:
	.ascii	"main_task\000"
.LASF4:
	.ascii	"TASK_SIZE_SMALL\000"
.LASF1:
	.ascii	"TASK_SIZE_GIANT\000"
.LASF22:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF24:
	.ascii	"CODE_BASE\000"
.LASF23:
	.ascii	"TaskSize\000"
.LASF5:
	.ascii	"TASK_SIZE_TINY\000"
.LASF13:
	.ascii	"printf_putc\000"
.LASF10:
	.ascii	"_cin_tid\000"
.LASF3:
	.ascii	"TASK_SIZE_NORMAL\000"
.LASF19:
	.ascii	"cgetc\000"
.LASF18:
	.ascii	"tgetc\000"
.LASF14:
	.ascii	"tput2\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
