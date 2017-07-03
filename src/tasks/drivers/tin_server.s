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
	.file	"tin_server.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata
	.align	2
.LC0:
	.ascii	"TIN\000"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
.LFB0:
	.file 1 "src/tasks/drivers/tin_server.c"
	.loc 1 24 0
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
	.loc 1 25 0
	ldr	r3, [fp, #-16]
	mov	r2, #0
	str	r2, [r3, #32]
	.loc 1 26 0
	ldr	r3, [fp, #-16]
	mov	r2, #0
	str	r2, [r3, #36]
	.loc 1 27 0
	ldr	r3, [fp, #-16]
	mov	r2, #0
	str	r2, [r3, #296]
	.loc 1 28 0
	ldr	r3, [fp, #-16]
	mov	r2, #0
	str	r2, [r3, #300]
	.loc 1 30 0
	ldr	r3, .L2+4
.LPIC0:
	add	r3, pc, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	.loc 1 31 0
	mov	r2, #4
	ldr	r3, .L2+8
	ldr	r3, [r4, r3]
	mov	r1, r3
	mov	r0, #1
	bl	CreateSize(PLT)
	.loc 1 32 0
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
	.word	tin_courier(GOT)
	.cfi_endproc
.LFE0:
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	handle, %function
handle:
.LFB1:
	.loc 1 35 0
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
	.loc 1 37 0
	ldr	r3, [fp, #-40]
	ldr	r3, [r3]
	cmp	r3, #0
	bge	.L5
	.loc 1 38 0
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #300]
	cmp	r3, #0
	beq	.L6
.LBB2:
	.loc 1 39 0
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #296]
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldrb	r3, [r3, #40]	@ zero_extendqisi2
	str	r3, [fp, #-20]
	.loc 1 40 0
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #296]
	add	r2, r3, #1
	asr	r3, r2, #31
	lsr	r3, r3, #24
	add	r2, r2, r3
	and	r2, r2, #255
	sub	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-32]
	str	r2, [r3, #296]
	.loc 1 41 0
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #300]
	sub	r2, r3, #1
	ldr	r3, [fp, #-32]
	str	r2, [r3, #300]
	.loc 1 42 0
	sub	r3, fp, #20
	mov	r2, #4
	mov	r1, r3
	ldr	r0, [fp, #-36]
	bl	Reply(PLT)
.LBE2:
	.loc 1 66 0
	b	.L11
.L6:
	.loc 1 44 0
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #36]
	cmp	r3, #8
	bne	.L8
.LBB3:
	.loc 1 45 0 discriminator 2
	mvn	r3, #0
	str	r3, [fp, #-24]
	.loc 1 46 0 discriminator 2
	sub	r3, fp, #24
	mov	r2, #4
	mov	r1, r3
	ldr	r0, [fp, #-36]
	bl	Reply(PLT)
.LBE3:
	.loc 1 66 0 discriminator 2
	b	.L11
.L8:
.LBB4:
	.loc 1 48 0
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #32]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #36]
	add	r0, r3, #1
	ldr	r1, [fp, #-32]
	str	r0, [r1, #36]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	.loc 1 49 0
	ldr	r2, [fp, #-8]
	asr	r3, r2, #31
	lsr	r3, r3, #29
	add	r2, r2, r3
	and	r2, r2, #7
	sub	r3, r2, r3
	mov	r1, r3
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-36]
	str	r2, [r3, r1, lsl #2]
.LBE4:
	.loc 1 66 0
	b	.L11
.L5:
	.loc 1 53 0
	mov	r2, #0
	mov	r1, #0
	ldr	r0, [fp, #-36]
	bl	Reply(PLT)
	.loc 1 54 0
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #36]
	cmp	r3, #0
	beq	.L10
.LBB5:
	.loc 1 55 0
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #32]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [fp, #-12]
	.loc 1 56 0
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #32]
	add	r2, r3, #1
	asr	r3, r2, #31
	lsr	r3, r3, #29
	add	r2, r2, r3
	and	r2, r2, #7
	sub	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-32]
	str	r2, [r3, #32]
	.loc 1 57 0
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #36]
	sub	r2, r3, #1
	ldr	r3, [fp, #-32]
	str	r2, [r3, #36]
	.loc 1 58 0
	ldr	r3, [fp, #-40]
	mov	r2, #4
	mov	r1, r3
	ldr	r0, [fp, #-12]
	bl	Reply(PLT)
.LBE5:
	.loc 1 66 0
	b	.L11
.L10:
	.loc 1 60 0
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #300]
	cmp	r3, #255
	bgt	.L11
.LBB6:
	.loc 1 61 0
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #296]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #300]
	add	r0, r3, #1
	ldr	r1, [fp, #-32]
	str	r0, [r1, #300]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	.loc 1 62 0
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
	strb	r2, [r3, #40]
.L11:
.LBE6:
	.loc 1 66 0
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
.LFE1:
	.size	handle, .-handle
	.align	2
	.global	sendTinData
	.syntax unified
	.arm
	.fpu softvfp
	.type	sendTinData, %function
sendTinData:
.LFB2:
	.loc 1 69 0
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
	.loc 1 71 0
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-8]
	.loc 1 72 0
	sub	r1, fp, #8
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #4
	ldr	r0, [fp, #-16]
	bl	Send(PLT)
	.loc 1 73 0
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
	.size	sendTinData, .-sendTinData
	.align	2
	.global	sendTinGetc
	.syntax unified
	.arm
	.fpu softvfp
	.type	sendTinGetc, %function
sendTinGetc:
.LFB3:
	.loc 1 76 0
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
	.loc 1 79 0
	mvn	r3, #0
	str	r3, [fp, #-8]
	.loc 1 80 0
	sub	r2, fp, #12
	sub	r1, fp, #8
	mov	r3, #4
	str	r3, [sp]
	mov	r3, r2
	mov	r2, #4
	ldr	r0, [fp, #-16]
	bl	Send(PLT)
	.loc 1 81 0
	ldr	r3, [fp, #-12]
	.loc 1 82 0
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
.LFE3:
	.size	sendTinGetc, .-sendTinGetc
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	server_initialize, %function
server_initialize:
.LFB4:
	.loc 1 84 0
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
	.loc 1 84 0
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
.LFE4:
	.size	server_initialize, .-server_initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	server_work, %function
server_work:
.LFB5:
	.loc 1 84 0
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
	.loc 1 84 0
	ldr	r3, [fp, #-16]
	add	r1, r3, #304
	sub	r3, fp, #12
	mov	r2, #4
	mov	r0, r3
	bl	Receive(PLT)
	str	r0, [fp, #-8]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r2, r3, #304
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
.LFE5:
	.size	server_work, .-server_work
	.section	.rodata
	.align	2
.LC1:
	.ascii	"tin_server\000"
	.align	2
.LC2:
	.ascii	"Service %s created with tid %d.\012\015\000"
	.text
	.align	2
	.global	tin_server
	.syntax unified
	.arm
	.fpu softvfp
	.type	tin_server, %function
tin_server:
.LFB6:
	.loc 1 84 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 312
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #312
	.loc 1 84 0
	bl	Service(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L19
.LPIC2:
	add	r3, pc, r3
	mov	r1, r3
	ldr	r3, .L19+4
.LPIC3:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	sub	r3, fp, #312
	mov	r0, r3
	bl	server_initialize(PLT)
.L18:
	.loc 1 84 0 is_stmt 0 discriminator 2
	sub	r3, fp, #312
	mov	r0, r3
	bl	server_work(PLT)
	b	.L18
.L20:
	.align	2
.L19:
	.word	.LC1-(.LPIC2+8)
	.word	.LC2-(.LPIC3+8)
	.cfi_endproc
.LFE6:
	.size	tin_server, .-tin_server
.Letext0:
	.file 2 "src/syscall.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x33e
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF29
	.byte	0xc
	.4byte	.LASF30
	.4byte	.LASF31
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
	.4byte	.LASF32
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
	.uleb128 0x6
	.4byte	.LASF15
	.2byte	0x130
	.byte	0x1
	.byte	0x7
	.4byte	0xc1
	.uleb128 0x7
	.4byte	.LASF7
	.byte	0x1
	.byte	0x9
	.4byte	0xc1
	.byte	0
	.uleb128 0x7
	.4byte	.LASF8
	.byte	0x1
	.byte	0xa
	.4byte	0x2c
	.byte	0x20
	.uleb128 0x7
	.4byte	.LASF9
	.byte	0x1
	.byte	0xb
	.4byte	0x2c
	.byte	0x24
	.uleb128 0x7
	.4byte	.LASF10
	.byte	0x1
	.byte	0xe
	.4byte	0xd8
	.byte	0x28
	.uleb128 0x8
	.4byte	.LASF11
	.byte	0x1
	.byte	0xf
	.4byte	0x2c
	.2byte	0x128
	.uleb128 0x8
	.4byte	.LASF12
	.byte	0x1
	.byte	0x10
	.4byte	0x2c
	.2byte	0x12c
	.byte	0
	.uleb128 0x9
	.4byte	0x2c
	.4byte	0xd1
	.uleb128 0xa
	.4byte	0xd1
	.byte	0x7
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF13
	.uleb128 0x9
	.4byte	0xe8
	.4byte	0xe8
	.uleb128 0xa
	.4byte	0xd1
	.byte	0xff
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF14
	.uleb128 0xb
	.4byte	.LASF16
	.byte	0x4
	.byte	0x1
	.byte	0x13
	.4byte	0x108
	.uleb128 0x7
	.4byte	.LASF17
	.byte	0x1
	.byte	0x14
	.4byte	0x2c
	.byte	0
	.byte	0
	.uleb128 0x6
	.4byte	.LASF18
	.2byte	0x134
	.byte	0x1
	.byte	0x54
	.4byte	0x12f
	.uleb128 0x7
	.4byte	.LASF19
	.byte	0x1
	.byte	0x54
	.4byte	0x69
	.byte	0
	.uleb128 0xc
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x54
	.4byte	0xef
	.2byte	0x130
	.byte	0
	.uleb128 0xd
	.4byte	.LASF24
	.byte	0x1
	.byte	0x54
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x154
	.uleb128 0xe
	.4byte	.LASF17
	.byte	0x1
	.byte	0x54
	.4byte	0x108
	.uleb128 0x3
	.byte	0x91
	.sleb128 -316
	.byte	0
	.uleb128 0xf
	.4byte	.LASF21
	.byte	0x1
	.byte	0x54
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x194
	.uleb128 0x10
	.4byte	.LASF17
	.byte	0x1
	.byte	0x54
	.4byte	0x194
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x54
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xe
	.4byte	.LASF20
	.byte	0x1
	.byte	0x54
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.4byte	0x108
	.uleb128 0xf
	.4byte	.LASF22
	.byte	0x1
	.byte	0x54
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1be
	.uleb128 0x10
	.4byte	.LASF17
	.byte	0x1
	.byte	0x54
	.4byte	0x194
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x13
	.4byte	.LASF33
	.byte	0x1
	.byte	0x4b
	.4byte	0x2c
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x202
	.uleb128 0x14
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x4b
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x4d
	.4byte	0xef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xe
	.4byte	.LASF23
	.byte	0x1
	.byte	0x4e
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xd
	.4byte	.LASF25
	.byte	0x1
	.byte	0x44
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x241
	.uleb128 0x14
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x44
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.ascii	"ch\000"
	.byte	0x1
	.byte	0x44
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x46
	.4byte	0xef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xf
	.4byte	.LASF26
	.byte	0x1
	.byte	0x22
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x315
	.uleb128 0x10
	.4byte	.LASF17
	.byte	0x1
	.byte	0x22
	.4byte	0x315
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x14
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x22
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x14
	.ascii	"m\000"
	.byte	0x1
	.byte	0x22
	.4byte	0x31b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x10
	.4byte	.LASF27
	.byte	0x1
	.byte	0x22
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x15
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.4byte	0x2a8
	.uleb128 0xe
	.4byte	.LASF23
	.byte	0x1
	.byte	0x27
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x15
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.4byte	0x2c4
	.uleb128 0xe
	.4byte	.LASF23
	.byte	0x1
	.byte	0x2d
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x15
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.4byte	0x2e0
	.uleb128 0x11
	.ascii	"idx\000"
	.byte	0x1
	.byte	0x30
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x15
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.4byte	0x2fc
	.uleb128 0xe
	.4byte	.LASF28
	.byte	0x1
	.byte	0x37
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
	.byte	0x3d
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.4byte	0x69
	.uleb128 0x12
	.byte	0x4
	.4byte	0xef
	.uleb128 0x17
	.4byte	.LASF34
	.byte	0x1
	.byte	0x17
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x10
	.4byte	.LASF17
	.byte	0x1
	.byte	0x17
	.4byte	0x315
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
.LASF9:
	.ascii	"block_size\000"
.LASF23:
	.ascii	"reply\000"
.LASF22:
	.ascii	"server_initialize\000"
.LASF25:
	.ascii	"sendTinData\000"
.LASF13:
	.ascii	"sizetype\000"
.LASF28:
	.ascii	"task\000"
.LASF5:
	.ascii	"TASK_SIZE_TINY\000"
.LASF2:
	.ascii	"TASK_SIZE_BIG\000"
.LASF30:
	.ascii	"src/tasks/drivers/tin_server.c\000"
.LASF20:
	.ascii	"datalen\000"
.LASF24:
	.ascii	"tin_server\000"
.LASF15:
	.ascii	"Data\000"
.LASF33:
	.ascii	"sendTinGetc\000"
.LASF8:
	.ascii	"block_idx\000"
.LASF34:
	.ascii	"initialize\000"
.LASF6:
	.ascii	"unsigned char\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF4:
	.ascii	"TASK_SIZE_SMALL\000"
.LASF10:
	.ascii	"inputs\000"
.LASF31:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF19:
	.ascii	"user\000"
.LASF7:
	.ascii	"blocked_tids\000"
.LASF14:
	.ascii	"char\000"
.LASF16:
	.ascii	"Message\000"
.LASF17:
	.ascii	"data\000"
.LASF32:
	.ascii	"TaskSize\000"
.LASF26:
	.ascii	"handle\000"
.LASF27:
	.ascii	"size\000"
.LASF18:
	.ascii	"server_Data\000"
.LASF3:
	.ascii	"TASK_SIZE_NORMAL\000"
.LASF1:
	.ascii	"TASK_SIZE_GIANT\000"
.LASF29:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF21:
	.ascii	"server_work\000"
.LASF12:
	.ascii	"input_size\000"
.LASF11:
	.ascii	"input_idx\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
