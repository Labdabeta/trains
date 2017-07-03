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
	.file	"gui.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	toGroupNumber, %function
toGroupNumber:
.LFB1:
	.file 1 "src/tasks/sensors.h"
	.loc 1 27 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	.cfi_def_cfa_offset 4
	.cfi_offset 11, -4
	add	fp, sp, #0
	.cfi_def_cfa_register 11
	sub	sp, sp, #20
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	.loc 1 28 0
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L2
	.loc 1 28 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-8]
	rsb	r3, r3, #0
	str	r3, [fp, #-8]
.L2:
	.loc 1 29 0 is_stmt 1
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
	.loc 1 30 0
	ldr	r3, [fp, #-8]
	asr	r3, r3, #4
	and	r3, r3, #255
	add	r3, r3, #65
	and	r2, r3, #255
	ldr	r3, [fp, #-12]
	strb	r2, [r3]
	.loc 1 31 0
	ldr	r3, [fp, #-8]
	and	r3, r3, #15
	add	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3]
	.loc 1 32 0
	nop
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE1:
	.size	toGroupNumber, .-toGroupNumber
	.align	2
	.global	quitter
	.syntax unified
	.arm
	.fpu softvfp
	.type	quitter, %function
quitter:
.LFB2:
	.file 2 "src/tasks/util/gui.c"
	.loc 2 13 0
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
	.loc 2 14 0
	nop
.L4:
	.loc 2 14 0 is_stmt 0 discriminator 1
	bl	cgetc(PLT)
	mov	r3, r0
	cmp	r3, #81
	bne	.L4
	.loc 2 15 0 is_stmt 1
	bl	Exit(PLT)
	.loc 2 16 0
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
.LFE2:
	.size	quitter, .-quitter
	.section	.rodata
	.align	2
.LC0:
	.ascii	"SENSOR\000"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
.LFB3:
	.loc 2 19 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #8
	.cfi_def_cfa 11, 4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	ldr	r4, .L6
.LPIC1:
	add	r4, pc, r4
	.loc 2 20 0
	ldr	r3, .L6+4
.LPIC0:
	add	r3, pc, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	mov	r0, r3
	bl	registerForSensorFlips(PLT)
	.loc 2 21 0
	ldr	r3, .L6+8
	ldr	r3, [r4, r3]
	mov	r1, r3
	mov	r0, #5
	bl	Create(PLT)
	.loc 2 23 0
	ldr	r3, [fp, #-16]
	mov	r2, #0
	strb	r2, [r3, #3]
	.loc 2 25 0
	mov	r0, #2
	bl	cputc(PLT)
	.loc 2 26 0
	nop
	sub	sp, fp, #8
	.cfi_def_cfa 13, 12
	@ sp needed
	pop	{r4, fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.L7:
	.align	2
.L6:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC1+8)
	.word	.LC0-(.LPIC0+8)
	.word	quitter(GOT)
	.cfi_endproc
.LFE3:
	.size	initialize, .-initialize
	.section	.rodata
	.align	2
.LC1:
	.ascii	"Got: %d\012\015\000"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	handle, %function
handle:
.LFB4:
	.loc 2 29 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	.loc 2 31 0
	mov	r2, #0
	mov	r1, #0
	ldr	r0, [fp, #-20]
	bl	Reply(PLT)
	.loc 2 32 0
	ldr	r1, [fp, #-20]
	ldr	r3, .L14
.LPIC2:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	.loc 2 33 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	cmp	r3, #0
	bge	.L9
	.loc 2 34 0
	ldr	r3, [fp, #-16]
	mov	r2, #83
	strb	r2, [r3]
	.loc 2 35 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	rsb	r0, r3, #0
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	sub	r2, fp, #8
	mov	r1, r3
	bl	toGroupNumber(PLT)
	.loc 2 36 0
	ldr	r3, [fp, #-8]
	cmp	r3, #9
	bgt	.L10
	.loc 2 37 0
	ldr	r3, [fp, #-8]
	and	r3, r3, #255
	add	r3, r3, #48
	and	r2, r3, #255
	ldr	r3, [fp, #-16]
	strb	r2, [r3, #2]
	b	.L12
.L10:
	.loc 2 39 0
	ldr	r3, [fp, #-8]
	and	r3, r3, #255
	add	r3, r3, #87
	and	r2, r3, #255
	ldr	r3, [fp, #-16]
	strb	r2, [r3, #2]
	b	.L12
.L9:
	.loc 2 40 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L12
	.loc 2 41 0
	ldr	r3, [fp, #-16]
	mov	r2, #115
	strb	r2, [r3]
	.loc 2 42 0
	ldr	r3, [fp, #-24]
	ldr	r0, [r3]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	sub	r2, fp, #8
	mov	r1, r3
	bl	toGroupNumber(PLT)
	.loc 2 43 0
	ldr	r3, [fp, #-8]
	cmp	r3, #9
	bgt	.L13
	.loc 2 44 0
	ldr	r3, [fp, #-8]
	and	r3, r3, #255
	add	r3, r3, #48
	and	r2, r3, #255
	ldr	r3, [fp, #-16]
	strb	r2, [r3, #2]
	b	.L12
.L13:
	.loc 2 46 0
	ldr	r3, [fp, #-8]
	and	r3, r3, #255
	add	r3, r3, #87
	and	r2, r3, #255
	ldr	r3, [fp, #-16]
	strb	r2, [r3, #2]
.L12:
	.loc 2 49 0
	ldr	r3, [fp, #-16]
	mov	r0, r3
	bl	cputstr(PLT)
	.loc 2 50 0
	nop
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L15:
	.align	2
.L14:
	.word	.LC1-(.LPIC2+8)
	.cfi_endproc
.LFE4:
	.size	handle, .-handle
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	server_initialize, %function
server_initialize:
.LFB5:
	.loc 2 52 0
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
	.loc 2 52 0
	ldr	r3, [fp, #-8]
	mov	r0, r3
	bl	initialize(PLT)
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
.LFE5:
	.size	server_initialize, .-server_initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	server_work, %function
server_work:
.LFB6:
	.loc 2 52 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	.loc 2 52 0
	ldr	r3, [fp, #-16]
	add	r1, r3, #4
	sub	r3, fp, #12
	mov	r2, #4
	mov	r0, r3
	bl	Receive(PLT)
	str	r0, [fp, #-8]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r2, r3, #4
	ldr	r3, [fp, #-8]
	bl	handle(PLT)
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
	.size	server_work, .-server_work
	.section	.rodata
	.align	2
.LC2:
	.ascii	"gui\000"
	.align	2
.LC3:
	.ascii	"Service %s created with tid %d.\012\015\000"
	.text
	.align	2
	.global	gui
	.syntax unified
	.arm
	.fpu softvfp
	.type	gui, %function
gui:
.LFB7:
	.loc 2 52 0
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
	.loc 2 52 0
	bl	Service(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L20
.LPIC3:
	add	r3, pc, r3
	mov	r1, r3
	ldr	r3, .L20+4
.LPIC4:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	sub	r3, fp, #12
	mov	r0, r3
	bl	server_initialize(PLT)
.L19:
	.loc 2 52 0 is_stmt 0 discriminator 2
	sub	r3, fp, #12
	mov	r0, r3
	bl	server_work(PLT)
	b	.L19
.L21:
	.align	2
.L20:
	.word	.LC2-(.LPIC3+8)
	.word	.LC3-(.LPIC4+8)
	.cfi_endproc
.LFE7:
	.size	gui, .-gui
.Letext0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x222
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF18
	.byte	0xc
	.4byte	.LASF19
	.4byte	.LASF20
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x4
	.4byte	.LASF4
	.byte	0x4
	.byte	0x2
	.byte	0x4
	.4byte	0x53
	.uleb128 0x5
	.ascii	"msg\000"
	.byte	0x2
	.byte	0x5
	.4byte	0x53
	.byte	0
	.byte	0
	.uleb128 0x6
	.4byte	0x6a
	.4byte	0x63
	.uleb128 0x7
	.4byte	0x63
	.byte	0x3
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0x4
	.4byte	.LASF5
	.byte	0x4
	.byte	0x2
	.byte	0x8
	.4byte	0x8a
	.uleb128 0x8
	.4byte	.LASF6
	.byte	0x2
	.byte	0x9
	.4byte	0x2c
	.byte	0
	.byte	0
	.uleb128 0x4
	.4byte	.LASF7
	.byte	0x8
	.byte	0x2
	.byte	0x34
	.4byte	0xaf
	.uleb128 0x8
	.4byte	.LASF8
	.byte	0x2
	.byte	0x34
	.4byte	0x3a
	.byte	0
	.uleb128 0x5
	.ascii	"msg\000"
	.byte	0x2
	.byte	0x34
	.4byte	0x71
	.byte	0x4
	.byte	0
	.uleb128 0x9
	.ascii	"gui\000"
	.byte	0x2
	.byte	0x34
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd3
	.uleb128 0xa
	.4byte	.LASF6
	.byte	0x2
	.byte	0x34
	.4byte	0x8a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xb
	.4byte	.LASF10
	.byte	0x2
	.byte	0x34
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x113
	.uleb128 0xc
	.4byte	.LASF6
	.byte	0x2
	.byte	0x34
	.4byte	0x113
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xd
	.ascii	"tid\000"
	.byte	0x2
	.byte	0x34
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xa
	.4byte	.LASF9
	.byte	0x2
	.byte	0x34
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xe
	.byte	0x4
	.4byte	0x8a
	.uleb128 0xb
	.4byte	.LASF11
	.byte	0x2
	.byte	0x34
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x13d
	.uleb128 0xc
	.4byte	.LASF6
	.byte	0x2
	.byte	0x34
	.4byte	0x113
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xb
	.4byte	.LASF12
	.byte	0x2
	.byte	0x1c
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x199
	.uleb128 0xc
	.4byte	.LASF6
	.byte	0x2
	.byte	0x1c
	.4byte	0x199
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xf
	.ascii	"tid\000"
	.byte	0x2
	.byte	0x1c
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xf
	.ascii	"msg\000"
	.byte	0x2
	.byte	0x1c
	.4byte	0x19f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xc
	.4byte	.LASF13
	.byte	0x2
	.byte	0x1c
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xd
	.ascii	"grn\000"
	.byte	0x2
	.byte	0x1e
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xe
	.byte	0x4
	.4byte	0x3a
	.uleb128 0xe
	.byte	0x4
	.4byte	0x71
	.uleb128 0xb
	.4byte	.LASF14
	.byte	0x2
	.byte	0x12
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1c9
	.uleb128 0xc
	.4byte	.LASF6
	.byte	0x2
	.byte	0x12
	.4byte	0x199
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x10
	.4byte	.LASF21
	.byte	0x2
	.byte	0xc
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.4byte	.LASF15
	.byte	0x1
	.byte	0x1a
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x219
	.uleb128 0xf
	.ascii	"id\000"
	.byte	0x1
	.byte	0x1a
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xc
	.4byte	.LASF16
	.byte	0x1
	.byte	0x1a
	.4byte	0x219
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xc
	.4byte	.LASF17
	.byte	0x1
	.byte	0x1a
	.4byte	0x21f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xe
	.byte	0x4
	.4byte	0x6a
	.uleb128 0xe
	.byte	0x4
	.4byte	0x2c
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
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x34
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
	.uleb128 0xe
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
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
.LASF11:
	.ascii	"server_initialize\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF17:
	.ascii	"number\000"
.LASF4:
	.ascii	"Data\000"
.LASF10:
	.ascii	"server_work\000"
.LASF16:
	.ascii	"group\000"
.LASF21:
	.ascii	"quitter\000"
.LASF18:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF6:
	.ascii	"data\000"
.LASF7:
	.ascii	"server_Data\000"
.LASF13:
	.ascii	"size\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF3:
	.ascii	"char\000"
.LASF14:
	.ascii	"initialize\000"
.LASF15:
	.ascii	"toGroupNumber\000"
.LASF5:
	.ascii	"Message\000"
.LASF19:
	.ascii	"src/tasks/util/gui.c\000"
.LASF20:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF8:
	.ascii	"user\000"
.LASF12:
	.ascii	"handle\000"
.LASF9:
	.ascii	"datalen\000"
.LASF2:
	.ascii	"sizetype\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
