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
	.file	"cin_server.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata
	.align	2
.LC0:
	.ascii	"CIN\000"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
.LFB1:
	.file 1 "src/tasks/drivers/cin_server.c"
	.loc 1 26 0
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
	ldr	r4, .L2
.LPIC1:
	add	r4, pc, r4
	.loc 1 27 0
	ldr	r3, [fp, #-16]
	mov	r2, #0
	str	r2, [r3, #64]
	.loc 1 28 0
	ldr	r3, [fp, #-16]
	mov	r2, #0
	str	r2, [r3, #68]
	.loc 1 29 0
	ldr	r3, [fp, #-16]
	mov	r2, #0
	str	r2, [r3, #328]
	.loc 1 30 0
	ldr	r3, [fp, #-16]
	mov	r2, #0
	str	r2, [r3, #332]
	.loc 1 32 0
	ldr	r3, .L2+4
.LPIC0:
	add	r3, pc, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	.loc 1 33 0
	mov	r2, #4
	ldr	r3, .L2+8
	ldr	r3, [r4, r3]
	mov	r1, r3
	mov	r0, #1
	bl	CreateSize(PLT)
	.loc 1 34 0
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
.L3:
	.align	2
.L2:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC1+8)
	.word	.LC0-(.LPIC0+8)
	.word	cin_courier(GOT)
	.cfi_endproc
.LFE1:
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	handle, %function
handle:
.LFB2:
	.loc 1 37 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #40
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	str	r3, [fp, #-44]
	.loc 1 39 0
	ldr	r3, [fp, #-40]
	ldr	r3, [r3]
	cmp	r3, #0
	bge	.L5
	.loc 1 40 0
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #332]
	cmp	r3, #0
	beq	.L6
.LBB2:
	.loc 1 41 0
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #328]
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldrb	r3, [r3, #72]	@ zero_extendqisi2
	str	r3, [fp, #-20]
	.loc 1 42 0
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #328]
	add	r2, r3, #1
	asr	r3, r2, #31
	lsr	r3, r3, #24
	add	r2, r2, r3
	and	r2, r2, #255
	sub	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-32]
	str	r2, [r3, #328]
	.loc 1 43 0
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #332]
	sub	r2, r3, #1
	ldr	r3, [fp, #-32]
	str	r2, [r3, #332]
	.loc 1 44 0
	sub	r3, fp, #20
	mov	r2, #4
	mov	r1, r3
	ldr	r0, [fp, #-36]
	bl	Reply(PLT)
.LBE2:
	.loc 1 72 0
	b	.L12
.L6:
	.loc 1 46 0
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #68]
	cmp	r3, #16
	bne	.L8
.LBB3:
	.loc 1 47 0 discriminator 2
	mvn	r3, #0
	str	r3, [fp, #-24]
	.loc 1 48 0 discriminator 2
	sub	r3, fp, #24
	mov	r2, #4
	mov	r1, r3
	ldr	r0, [fp, #-36]
	bl	Reply(PLT)
.LBE3:
	.loc 1 72 0 discriminator 2
	b	.L12
.L8:
.LBB4:
	.loc 1 50 0
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #64]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #68]
	add	r0, r3, #1
	ldr	r1, [fp, #-32]
	str	r0, [r1, #68]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	.loc 1 51 0
	ldr	r2, [fp, #-8]
	asr	r3, r2, #31
	lsr	r3, r3, #28
	add	r2, r2, r3
	and	r2, r2, #15
	sub	r3, r2, r3
	mov	r1, r3
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-36]
	str	r2, [r3, r1, lsl #2]
.LBE4:
	.loc 1 72 0
	b	.L12
.L5:
	.loc 1 55 0
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #68]
	cmp	r3, #0
	beq	.L10
.LBB5:
	.loc 1 56 0
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #64]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [fp, #-12]
	.loc 1 57 0
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #64]
	add	r2, r3, #1
	asr	r3, r2, #31
	lsr	r3, r3, #28
	add	r2, r2, r3
	and	r2, r2, #15
	sub	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-32]
	str	r2, [r3, #64]
	.loc 1 58 0
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #68]
	sub	r2, r3, #1
	ldr	r3, [fp, #-32]
	str	r2, [r3, #68]
	.loc 1 59 0
	ldr	r3, [fp, #-40]
	mov	r2, #4
	mov	r1, r3
	ldr	r0, [fp, #-12]
	bl	Reply(PLT)
	.loc 1 60 0
	mov	r2, #0
	mov	r1, #0
	ldr	r0, [fp, #-36]
	bl	Reply(PLT)
.LBE5:
	.loc 1 72 0
	b	.L12
.L10:
	.loc 1 62 0
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #332]
	cmp	r3, #256
	bne	.L11
	.loc 1 65 0
	mov	r2, #0
	mov	r1, #0
	ldr	r0, [fp, #-36]
	bl	Reply(PLT)
	.loc 1 72 0
	b	.L12
.L11:
.LBB6:
	.loc 1 67 0
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #328]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #332]
	add	r0, r3, #1
	ldr	r1, [fp, #-32]
	str	r0, [r1, #332]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	.loc 1 68 0
	ldr	r2, [fp, #-16]
	asr	r3, r2, #31
	lsr	r3, r3, #24
	add	r2, r2, r3
	and	r2, r2, #255
	sub	r3, r2, r3
	mov	r1, r3
	ldr	r3, [fp, #-40]
	ldr	r3, [r3]
	and	r2, r3, #255
	ldr	r3, [fp, #-32]
	add	r3, r3, r1
	strb	r2, [r3, #72]
.L12:
.LBE6:
	.loc 1 72 0
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
	.size	handle, .-handle
	.align	2
	.global	sendCinData
	.syntax unified
	.arm
	.fpu softvfp
	.type	sendCinData, %function
sendCinData:
.LFB3:
	.loc 1 75 0
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
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	.loc 1 77 0
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-8]
	.loc 1 78 0
	sub	r1, fp, #8
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #4
	ldr	r0, [fp, #-16]
	bl	Send(PLT)
	.loc 1 79 0
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
.LFE3:
	.size	sendCinData, .-sendCinData
	.align	2
	.global	sendCinGetc
	.syntax unified
	.arm
	.fpu softvfp
	.type	sendCinGetc, %function
sendCinGetc:
.LFB4:
	.loc 1 82 0
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
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	.loc 1 85 0
	mvn	r3, #0
	str	r3, [fp, #-8]
	.loc 1 86 0
	sub	r2, fp, #12
	sub	r1, fp, #8
	mov	r3, #4
	str	r3, [sp]
	mov	r3, r2
	mov	r2, #4
	ldr	r0, [fp, #-16]
	bl	Send(PLT)
	.loc 1 87 0
	ldr	r3, [fp, #-12]
	.loc 1 88 0
	mov	r0, r3
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE4:
	.size	sendCinGetc, .-sendCinGetc
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	server_initialize, %function
server_initialize:
.LFB5:
	.loc 1 90 0
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
	.loc 1 90 0
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
	.loc 1 90 0
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
	.loc 1 90 0
	ldr	r3, [fp, #-16]
	add	r1, r3, #336
	sub	r3, fp, #12
	mov	r2, #4
	mov	r0, r3
	bl	Receive(PLT)
	str	r0, [fp, #-8]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r2, r3, #336
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
.LC1:
	.ascii	"cin_server\000"
	.align	2
.LC2:
	.ascii	"Service %s created with tid %d.\012\015\000"
	.text
	.align	2
	.global	cin_server
	.syntax unified
	.arm
	.fpu softvfp
	.type	cin_server, %function
cin_server:
.LFB7:
	.loc 1 90 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 344
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #344
	.loc 1 90 0
	bl	Service(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L20
.LPIC2:
	add	r3, pc, r3
	mov	r1, r3
	ldr	r3, .L20+4
.LPIC3:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	sub	r3, fp, #344
	mov	r0, r3
	bl	server_initialize(PLT)
.L19:
	.loc 1 90 0 is_stmt 0 discriminator 2
	sub	r3, fp, #344
	mov	r0, r3
	bl	server_work(PLT)
	b	.L19
.L21:
	.align	2
.L20:
	.word	.LC1-(.LPIC2+8)
	.word	.LC2-(.LPIC3+8)
	.cfi_endproc
.LFE7:
	.size	cin_server, .-cin_server
.Letext0:
	.file 2 "src/syscall.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x345
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF30
	.byte	0xc
	.4byte	.LASF31
	.4byte	.LASF32
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
	.4byte	.LASF33
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
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x6
	.4byte	.LASF16
	.2byte	0x150
	.byte	0x1
	.byte	0x9
	.4byte	0xcf
	.uleb128 0x7
	.4byte	.LASF9
	.byte	0x1
	.byte	0xb
	.4byte	0xcf
	.byte	0
	.uleb128 0x7
	.4byte	.LASF10
	.byte	0x1
	.byte	0xc
	.4byte	0x2c
	.byte	0x40
	.uleb128 0x7
	.4byte	.LASF11
	.byte	0x1
	.byte	0xd
	.4byte	0x2c
	.byte	0x44
	.uleb128 0x7
	.4byte	.LASF12
	.byte	0x1
	.byte	0x10
	.4byte	0xdf
	.byte	0x48
	.uleb128 0x8
	.4byte	.LASF13
	.byte	0x1
	.byte	0x11
	.4byte	0x2c
	.2byte	0x148
	.uleb128 0x8
	.4byte	.LASF14
	.byte	0x1
	.byte	0x12
	.4byte	0x2c
	.2byte	0x14c
	.byte	0
	.uleb128 0x9
	.4byte	0x2c
	.4byte	0xdf
	.uleb128 0xa
	.4byte	0x69
	.byte	0xf
	.byte	0
	.uleb128 0x9
	.4byte	0xef
	.4byte	0xef
	.uleb128 0xa
	.4byte	0x69
	.byte	0xff
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF15
	.uleb128 0xb
	.4byte	.LASF17
	.byte	0x4
	.byte	0x1
	.byte	0x15
	.4byte	0x10f
	.uleb128 0x7
	.4byte	.LASF18
	.byte	0x1
	.byte	0x16
	.4byte	0x2c
	.byte	0
	.byte	0
	.uleb128 0x6
	.4byte	.LASF19
	.2byte	0x154
	.byte	0x1
	.byte	0x5a
	.4byte	0x136
	.uleb128 0x7
	.4byte	.LASF20
	.byte	0x1
	.byte	0x5a
	.4byte	0x77
	.byte	0
	.uleb128 0xc
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x5a
	.4byte	0xf6
	.2byte	0x150
	.byte	0
	.uleb128 0xd
	.4byte	.LASF25
	.byte	0x1
	.byte	0x5a
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x15b
	.uleb128 0xe
	.4byte	.LASF18
	.byte	0x1
	.byte	0x5a
	.4byte	0x10f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -348
	.byte	0
	.uleb128 0xf
	.4byte	.LASF22
	.byte	0x1
	.byte	0x5a
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x19b
	.uleb128 0x10
	.4byte	.LASF18
	.byte	0x1
	.byte	0x5a
	.4byte	0x19b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x5a
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xe
	.4byte	.LASF21
	.byte	0x1
	.byte	0x5a
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.4byte	0x10f
	.uleb128 0xf
	.4byte	.LASF23
	.byte	0x1
	.byte	0x5a
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1c5
	.uleb128 0x10
	.4byte	.LASF18
	.byte	0x1
	.byte	0x5a
	.4byte	0x19b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x13
	.4byte	.LASF34
	.byte	0x1
	.byte	0x51
	.4byte	0x2c
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x209
	.uleb128 0x14
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x51
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x53
	.4byte	0xf6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xe
	.4byte	.LASF24
	.byte	0x1
	.byte	0x54
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xd
	.4byte	.LASF26
	.byte	0x1
	.byte	0x4a
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x248
	.uleb128 0x14
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x4a
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.ascii	"ch\000"
	.byte	0x1
	.byte	0x4a
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x4c
	.4byte	0xf6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xf
	.4byte	.LASF27
	.byte	0x1
	.byte	0x24
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x31c
	.uleb128 0x10
	.4byte	.LASF18
	.byte	0x1
	.byte	0x24
	.4byte	0x31c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x14
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x24
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x14
	.ascii	"m\000"
	.byte	0x1
	.byte	0x24
	.4byte	0x322
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x10
	.4byte	.LASF28
	.byte	0x1
	.byte	0x24
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x15
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.4byte	0x2af
	.uleb128 0xe
	.4byte	.LASF24
	.byte	0x1
	.byte	0x29
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x15
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.4byte	0x2cb
	.uleb128 0xe
	.4byte	.LASF24
	.byte	0x1
	.byte	0x2f
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x15
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.4byte	0x2e7
	.uleb128 0x11
	.ascii	"idx\000"
	.byte	0x1
	.byte	0x32
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x15
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.4byte	0x303
	.uleb128 0xe
	.4byte	.LASF29
	.byte	0x1
	.byte	0x38
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x16
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.uleb128 0x11
	.ascii	"idx\000"
	.byte	0x1
	.byte	0x43
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.4byte	0x77
	.uleb128 0x12
	.byte	0x4
	.4byte	0xf6
	.uleb128 0x17
	.4byte	.LASF35
	.byte	0x1
	.byte	0x19
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x10
	.4byte	.LASF18
	.byte	0x1
	.byte	0x19
	.4byte	0x31c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
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
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.ascii	"block_size\000"
.LASF24:
	.ascii	"reply\000"
.LASF23:
	.ascii	"server_initialize\000"
.LASF7:
	.ascii	"sizetype\000"
.LASF29:
	.ascii	"task\000"
.LASF5:
	.ascii	"TASK_SIZE_TINY\000"
.LASF31:
	.ascii	"src/tasks/drivers/cin_server.c\000"
.LASF2:
	.ascii	"TASK_SIZE_BIG\000"
.LASF34:
	.ascii	"sendCinGetc\000"
.LASF21:
	.ascii	"datalen\000"
.LASF26:
	.ascii	"sendCinData\000"
.LASF16:
	.ascii	"Data\000"
.LASF10:
	.ascii	"block_idx\000"
.LASF35:
	.ascii	"initialize\000"
.LASF6:
	.ascii	"unsigned char\000"
.LASF8:
	.ascii	"long long unsigned int\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF25:
	.ascii	"cin_server\000"
.LASF4:
	.ascii	"TASK_SIZE_SMALL\000"
.LASF12:
	.ascii	"inputs\000"
.LASF32:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF20:
	.ascii	"user\000"
.LASF9:
	.ascii	"blocked_tids\000"
.LASF15:
	.ascii	"char\000"
.LASF17:
	.ascii	"Message\000"
.LASF18:
	.ascii	"data\000"
.LASF33:
	.ascii	"TaskSize\000"
.LASF27:
	.ascii	"handle\000"
.LASF28:
	.ascii	"size\000"
.LASF19:
	.ascii	"server_Data\000"
.LASF3:
	.ascii	"TASK_SIZE_NORMAL\000"
.LASF1:
	.ascii	"TASK_SIZE_GIANT\000"
.LASF30:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF22:
	.ascii	"server_work\000"
.LASF14:
	.ascii	"input_size\000"
.LASF13:
	.ascii	"input_idx\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
