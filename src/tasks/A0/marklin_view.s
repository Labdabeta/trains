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
	.file	"marklin_view.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	reverse_coordinator
	.syntax unified
	.arm
	.fpu softvfp
	.type	reverse_coordinator, %function
reverse_coordinator:
.LFB0:
	.file 1 "src/tasks/A0/marklin_view.c"
	.loc 1 12 0
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
	.loc 1 16 0
	sub	r1, fp, #24
	sub	r3, fp, #8
	mov	r2, #16
	mov	r0, r3
	bl	Receive(PLT)
	.loc 1 17 0
	ldr	r3, [fp, #-8]
	mov	r2, #0
	mov	r1, #0
	mov	r0, r3
	bl	Reply(PLT)
	.loc 1 20 0
	ldr	r3, [fp, #-20]
	cmp	r3, #15
	bgt	.L2
	.loc 1 20 0 is_stmt 0 discriminator 1
	mov	r3, #0
	b	.L3
.L2:
	.loc 1 20 0 discriminator 2
	mov	r3, #16
.L3:
	.loc 1 20 0 discriminator 4
	strb	r3, [fp, #-28]
	.loc 1 21 0 is_stmt 1 discriminator 4
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
	strb	r3, [fp, #-27]
	.loc 1 22 0 discriminator 4
	mov	r3, #0
	strb	r3, [fp, #-26]
	.loc 1 23 0 discriminator 4
	ldr	r3, [fp, #-16]
	sub	r2, fp, #28
	mov	r1, #1
	mov	r0, r3
	bl	Putstr(PLT)
	.loc 1 24 0 discriminator 4
	ldr	r3, [fp, #-12]
	mov	r1, #300
	mov	r0, r3
	bl	Delay(PLT)
	.loc 1 25 0 discriminator 4
	mov	r3, #15
	strb	r3, [fp, #-28]
	.loc 1 26 0 discriminator 4
	ldr	r3, [fp, #-16]
	sub	r2, fp, #28
	mov	r1, #1
	mov	r0, r3
	bl	Putstr(PLT)
	.loc 1 27 0 discriminator 4
	ldr	r3, [fp, #-12]
	mov	r1, #5
	mov	r0, r3
	bl	Delay(PLT)
	.loc 1 28 0 discriminator 4
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	strb	r3, [fp, #-28]
	.loc 1 29 0 discriminator 4
	ldr	r3, [fp, #-16]
	sub	r2, fp, #28
	mov	r1, #1
	mov	r0, r3
	bl	Putstr(PLT)
	.loc 1 30 0 discriminator 4
	bl	Exit(PLT)
	.loc 1 31 0 discriminator 4
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
.LFE0:
	.size	reverse_coordinator, .-reverse_coordinator
	.section	.rodata
	.align	2
.LC0:
	.ascii	"TOUT\000"
	.align	2
.LC1:
	.ascii	"CLOCK\000"
	.text
	.align	2
	.global	train_state_view
	.syntax unified
	.arm
	.fpu softvfp
	.type	train_state_view, %function
train_state_view:
.LFB1:
	.loc 1 33 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 376
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #8
	.cfi_def_cfa 11, 4
	sub	sp, sp, #388
	ldr	r4, .L12
.LPIC2:
	add	r4, pc, r4
	.loc 1 39 0
	ldr	r3, .L12+4
.LPIC0:
	add	r3, pc, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	str	r0, [fp, #-16]
	.loc 1 40 0
	ldr	r3, .L12+8
.LPIC1:
	add	r3, pc, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	str	r0, [fp, #-20]
	.loc 1 41 0
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-48]
	.loc 1 42 0
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-44]
	.loc 1 45 0
	mov	r3, #0
	strb	r3, [fp, #-60]
	.loc 1 46 0
	mov	r3, #0
	strb	r3, [fp, #-58]
	.loc 1 49 0
	mov	r3, #1
	strb	r3, [fp, #-59]
	b	.L5
.L6:
	.loc 1 50 0 discriminator 3
	ldrb	r3, [fp, #-59]	@ zero_extendqisi2
	lsl	r3, r3, #2
	sub	r2, fp, #12
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [r3, #-372]
	.loc 1 49 0 discriminator 3
	ldrb	r3, [fp, #-59]	@ zero_extendqisi2
	add	r3, r3, #1
	and	r3, r3, #255
	strb	r3, [fp, #-59]
.L5:
	.loc 1 49 0 is_stmt 0 discriminator 1
	ldrb	r3, [fp, #-59]	@ zero_extendqisi2
	cmp	r3, #80
	bls	.L6
	.loc 1 54 0 is_stmt 1
	sub	r3, fp, #28
	mov	r2, #0
	mov	r1, #0
	mov	r0, r3
	bl	Receive(PLT)
	.loc 1 55 0
	ldr	r3, [fp, #-28]
	mov	r2, #0
	mov	r1, #0
	mov	r0, r3
	bl	Reply(PLT)
.L11:
	.loc 1 58 0
	sub	r1, fp, #40
	sub	r3, fp, #28
	mov	r2, #12
	mov	r0, r3
	bl	Receive(PLT)
	.loc 1 59 0
	ldr	r3, [fp, #-28]
	mov	r2, #0
	mov	r1, #0
	mov	r0, r3
	bl	Reply(PLT)
	.loc 1 60 0
	ldrb	r3, [fp, #-40]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L8
	cmp	r3, #2
	beq	.L9
	cmp	r3, #0
	bne	.L7
	.loc 1 62 0
	ldr	r1, [fp, #-36]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #2
	sub	r0, fp, #12
	add	r3, r0, r3
	ldr	r3, [r3, #-372]
	and	r3, r3, #16
	add	r2, r2, r3
	lsl	r3, r1, #2
	sub	r1, fp, #12
	add	r3, r1, r3
	str	r2, [r3, #-372]
	.loc 1 63 0
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #2
	sub	r2, fp, #12
	add	r3, r2, r3
	ldr	r3, [r3, #-372]
	and	r2, r3, #255
	ldr	r3, [fp, #-36]
	and	r3, r3, #255
	mov	r1, r3
	mov	r0, r2
	bl	tput2(PLT)
	.loc 1 64 0
	b	.L7
.L8:
	.loc 1 67 0
	mov	r2, #4
	ldr	r3, .L12+12
	ldr	r3, [r4, r3]
	mov	r1, r3
	mov	r0, #0
	bl	CreateSize(PLT)
	str	r0, [fp, #-24]
	.loc 1 68 0
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-56]
	.loc 1 69 0
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #2
	sub	r2, fp, #12
	add	r3, r2, r3
	ldr	r3, [r3, #-372]
	str	r3, [fp, #-52]
	.loc 1 70 0
	sub	r1, fp, #56
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #16
	ldr	r0, [fp, #-24]
	bl	Send(PLT)
	.loc 1 71 0
	b	.L7
.L9:
	.loc 1 74 0
	ldr	r1, [fp, #-36]
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #2
	sub	r2, fp, #12
	add	r3, r2, r3
	ldr	r3, [r3, #-372]
	eor	r2, r3, #16
	lsl	r3, r1, #2
	sub	r1, fp, #12
	add	r3, r1, r3
	str	r2, [r3, #-372]
	.loc 1 75 0
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #2
	sub	r2, fp, #12
	add	r3, r2, r3
	ldr	r3, [r3, #-372]
	and	r2, r3, #255
	ldr	r3, [fp, #-36]
	and	r3, r3, #255
	mov	r1, r3
	mov	r0, r2
	bl	tput2(PLT)
	.loc 1 76 0
	nop
.L7:
	.loc 1 58 0
	b	.L11
.L13:
	.align	2
.L12:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC2+8)
	.word	.LC0-(.LPIC0+8)
	.word	.LC1-(.LPIC1+8)
	.word	reverse_coordinator(GOT)
	.cfi_endproc
.LFE1:
	.size	train_state_view, .-train_state_view
	.align	2
	.global	switch_coordinator
	.syntax unified
	.arm
	.fpu softvfp
	.type	switch_coordinator, %function
switch_coordinator:
.LFB2:
	.loc 1 81 0
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
	.loc 1 85 0
	sub	r1, fp, #24
	sub	r3, fp, #8
	mov	r2, #16
	mov	r0, r3
	bl	Receive(PLT)
	.loc 1 86 0
	ldr	r3, [fp, #-8]
	mov	r2, #0
	mov	r1, #0
	mov	r0, r3
	bl	Reply(PLT)
	.loc 1 88 0
	ldr	r3, [fp, #-20]
	and	r2, r3, #255
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
	mov	r1, r3
	mov	r0, r2
	bl	tput2(PLT)
	.loc 1 89 0
	ldr	r3, [fp, #-12]
	mov	r1, #10
	mov	r0, r3
	bl	Delay(PLT)
	.loc 1 90 0
	mov	r0, #32
	bl	tputc(PLT)
	.loc 1 92 0
	bl	Exit(PLT)
	.loc 1 93 0
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
	.size	switch_coordinator, .-switch_coordinator
.Letext0:
	.file 2 "src/syscall.h"
	.file 3 "src/tasks/A0/marklin_view.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x2d7
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF38
	.byte	0xc
	.4byte	.LASF39
	.4byte	.LASF40
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
	.uleb128 0x4
	.4byte	.LASF9
	.byte	0x1
	.4byte	0x62
	.byte	0x2
	.byte	0x8
	.4byte	0x62
	.uleb128 0x5
	.4byte	.LASF1
	.byte	0
	.uleb128 0x5
	.4byte	.LASF2
	.byte	0x1
	.uleb128 0x5
	.4byte	.LASF3
	.byte	0x2
	.uleb128 0x5
	.4byte	.LASF4
	.byte	0x3
	.uleb128 0x5
	.4byte	.LASF5
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x4
	.4byte	.LASF10
	.byte	0x1
	.4byte	0x62
	.byte	0x3
	.byte	0x4
	.4byte	0x9a
	.uleb128 0x5
	.4byte	.LASF11
	.byte	0
	.uleb128 0x5
	.4byte	.LASF12
	.byte	0x1
	.uleb128 0x5
	.4byte	.LASF13
	.byte	0x2
	.byte	0
	.uleb128 0x6
	.4byte	.LASF10
	.byte	0x3
	.byte	0x8
	.4byte	0x77
	.uleb128 0x7
	.4byte	.LASF16
	.byte	0x8
	.byte	0x3
	.byte	0xd
	.4byte	0xca
	.uleb128 0x8
	.4byte	.LASF14
	.byte	0x3
	.byte	0xe
	.4byte	0x2c
	.byte	0
	.uleb128 0x8
	.4byte	.LASF15
	.byte	0x3
	.byte	0xf
	.4byte	0x2c
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.4byte	.LASF17
	.byte	0x4
	.byte	0x3
	.byte	0x11
	.4byte	0xe3
	.uleb128 0x8
	.4byte	.LASF14
	.byte	0x3
	.byte	0x12
	.4byte	0x2c
	.byte	0
	.byte	0
	.uleb128 0x7
	.4byte	.LASF18
	.byte	0x4
	.byte	0x3
	.byte	0x14
	.4byte	0xfc
	.uleb128 0x8
	.4byte	.LASF14
	.byte	0x3
	.byte	0x15
	.4byte	0x2c
	.byte	0
	.byte	0
	.uleb128 0x9
	.byte	0x8
	.byte	0x3
	.byte	0xc
	.4byte	0x126
	.uleb128 0xa
	.4byte	.LASF15
	.byte	0x3
	.byte	0x10
	.4byte	0xa5
	.uleb128 0xa
	.4byte	.LASF19
	.byte	0x3
	.byte	0x13
	.4byte	0xca
	.uleb128 0xa
	.4byte	.LASF20
	.byte	0x3
	.byte	0x16
	.4byte	0xe3
	.byte	0
	.uleb128 0x7
	.4byte	.LASF21
	.byte	0xc
	.byte	0x3
	.byte	0xa
	.4byte	0x14b
	.uleb128 0x8
	.4byte	.LASF22
	.byte	0x3
	.byte	0xb
	.4byte	0x9a
	.byte	0
	.uleb128 0x8
	.4byte	.LASF23
	.byte	0x3
	.byte	0x17
	.4byte	0xfc
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.4byte	.LASF24
	.byte	0x10
	.byte	0x3
	.byte	0x1a
	.4byte	0x188
	.uleb128 0x8
	.4byte	.LASF25
	.byte	0x3
	.byte	0x1b
	.4byte	0x2c
	.byte	0
	.uleb128 0x8
	.4byte	.LASF26
	.byte	0x3
	.byte	0x1c
	.4byte	0x2c
	.byte	0x4
	.uleb128 0x8
	.4byte	.LASF27
	.byte	0x3
	.byte	0x1d
	.4byte	0x2c
	.byte	0x8
	.uleb128 0x8
	.4byte	.LASF28
	.byte	0x3
	.byte	0x1e
	.4byte	0x2c
	.byte	0xc
	.byte	0
	.uleb128 0x7
	.4byte	.LASF29
	.byte	0x10
	.byte	0x1
	.byte	0x5
	.4byte	0x1c5
	.uleb128 0x8
	.4byte	.LASF14
	.byte	0x1
	.byte	0x6
	.4byte	0x2c
	.byte	0
	.uleb128 0x8
	.4byte	.LASF15
	.byte	0x1
	.byte	0x7
	.4byte	0x2c
	.byte	0x4
	.uleb128 0x8
	.4byte	.LASF27
	.byte	0x1
	.byte	0x8
	.4byte	0x2c
	.byte	0x8
	.uleb128 0x8
	.4byte	.LASF28
	.byte	0x1
	.byte	0x9
	.4byte	0x2c
	.byte	0xc
	.byte	0
	.uleb128 0xb
	.4byte	.LASF32
	.byte	0x1
	.byte	0x51
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1f7
	.uleb128 0xc
	.4byte	.LASF30
	.byte	0x1
	.byte	0x52
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xc
	.4byte	.LASF31
	.byte	0x1
	.byte	0x53
	.4byte	0x14b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0xb
	.4byte	.LASF33
	.byte	0x1
	.byte	0x21
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x27e
	.uleb128 0xc
	.4byte	.LASF30
	.byte	0x1
	.byte	0x22
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xc
	.4byte	.LASF34
	.byte	0x1
	.byte	0x22
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xc
	.4byte	.LASF35
	.byte	0x1
	.byte	0x23
	.4byte	0x126
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0xc
	.4byte	.LASF36
	.byte	0x1
	.byte	0x25
	.4byte	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0xc
	.4byte	.LASF27
	.byte	0x1
	.byte	0x27
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xc
	.4byte	.LASF28
	.byte	0x1
	.byte	0x28
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xd
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x2c
	.4byte	0x27e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0xc
	.4byte	.LASF37
	.byte	0x1
	.byte	0x30
	.4byte	0x28e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -388
	.byte	0
	.uleb128 0xe
	.4byte	0x69
	.4byte	0x28e
	.uleb128 0xf
	.4byte	0x70
	.byte	0x2
	.byte	0
	.uleb128 0xe
	.4byte	0x2c
	.4byte	0x29e
	.uleb128 0xf
	.4byte	0x70
	.byte	0x50
	.byte	0
	.uleb128 0x10
	.4byte	.LASF41
	.byte	0x1
	.byte	0xc
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF30
	.byte	0x1
	.byte	0xd
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xc
	.4byte	.LASF36
	.byte	0x1
	.byte	0xe
	.4byte	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xd
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x13
	.4byte	0x27e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
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
	.uleb128 0x5
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x17
	.byte	0x1
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
	.uleb128 0xa
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
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
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
.LASF16:
	.ascii	"SetSpeed\000"
.LASF14:
	.ascii	"train\000"
.LASF18:
	.ascii	"Headlights\000"
.LASF36:
	.ascii	"rev_args\000"
.LASF30:
	.ascii	"caller\000"
.LASF26:
	.ascii	"state\000"
.LASF12:
	.ascii	"TYPE_Reverse\000"
.LASF8:
	.ascii	"sizetype\000"
.LASF24:
	.ascii	"switch_coordinator_args\000"
.LASF33:
	.ascii	"train_state_view\000"
.LASF5:
	.ascii	"TASK_SIZE_TINY\000"
.LASF27:
	.ascii	"out_tid\000"
.LASF32:
	.ascii	"switch_coordinator\000"
.LASF2:
	.ascii	"TASK_SIZE_BIG\000"
.LASF17:
	.ascii	"Reverse\000"
.LASF11:
	.ascii	"TYPE_SetSpeed\000"
.LASF39:
	.ascii	"src/tasks/A0/marklin_view.c\000"
.LASF21:
	.ascii	"Train_Command\000"
.LASF28:
	.ascii	"clock_tid\000"
.LASF6:
	.ascii	"unsigned char\000"
.LASF37:
	.ascii	"trainstates\000"
.LASF29:
	.ascii	"reverse_coordinator_args\000"
.LASF35:
	.ascii	"request\000"
.LASF13:
	.ascii	"TYPE_Headlights\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF23:
	.ascii	"args\000"
.LASF15:
	.ascii	"speed\000"
.LASF4:
	.ascii	"TASK_SIZE_SMALL\000"
.LASF40:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF7:
	.ascii	"char\000"
.LASF22:
	.ascii	"type\000"
.LASF9:
	.ascii	"TaskSize\000"
.LASF41:
	.ascii	"reverse_coordinator\000"
.LASF19:
	.ascii	"reverse\000"
.LASF31:
	.ascii	"flip_args\000"
.LASF34:
	.ascii	"child_tid\000"
.LASF3:
	.ascii	"TASK_SIZE_NORMAL\000"
.LASF1:
	.ascii	"TASK_SIZE_GIANT\000"
.LASF38:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF25:
	.ascii	"number\000"
.LASF10:
	.ascii	"Train_Command_Type\000"
.LASF20:
	.ascii	"lights\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
