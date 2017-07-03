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
	.file	"cout_server.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata
	.align	2
.LC0:
	.ascii	"COUT\000"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
.LFB1:
	.file 1 "src/tasks/drivers/cout_server.c"
	.loc 1 22 0
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
	.loc 1 23 0
	ldr	r3, [fp, #-16]
	add	r3, r3, #65536
	mov	r2, r3
	mov	r3, #0
	str	r3, [r2]
	.loc 1 24 0
	ldr	r3, [fp, #-16]
	add	r3, r3, #65536
	mov	r2, r3
	mov	r3, #0
	str	r3, [r2, #4]
	.loc 1 25 0
	ldr	r3, [fp, #-16]
	add	r3, r3, #65536
	mov	r2, r3
	mov	r3, #0
	str	r3, [r2, #8]
	.loc 1 27 0
	ldr	r3, .L2+4
.LPIC0:
	add	r3, pc, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	.loc 1 28 0
	mov	r2, #4
	ldr	r3, .L2+8
	ldr	r3, [r4, r3]
	mov	r1, r3
	mov	r0, #0
	bl	CreateSize(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-16]
	add	r3, r3, #65536
	str	r2, [r3, #12]
	.loc 1 29 0
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
	.word	cout_courier(GOT)
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
	.loc 1 32 0
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
	.loc 1 33 0
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	beq	.L5
	.loc 1 34 0
	ldr	r3, [fp, #-32]
	add	r3, r3, #65536
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L6
.LBB2:
	.loc 1 36 0
	ldr	r3, [fp, #-32]
	add	r3, r3, #65536
	mov	r2, r3
	mov	r3, #0
	str	r3, [r2, #8]
	.loc 1 37 0
	ldr	r3, [fp, #-32]
	add	r3, r3, #65536
	ldr	r0, [r3, #12]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3]
	mov	r2, #1
	mov	r1, r3
	bl	Reply(PLT)
	.loc 1 40 0
	ldr	r3, [fp, #-40]
	ldr	r3, [r3]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	b	.L7
.L8:
.LBB3:
	.loc 1 41 0 discriminator 3
	ldr	r3, [fp, #-32]
	add	r3, r3, #65536
	ldr	r2, [r3]
	ldr	r3, [fp, #-32]
	add	r3, r3, #65536
	ldr	r3, [r3, #4]
	add	r1, r3, #1
	ldr	r0, [fp, #-32]
	add	r0, r0, #65536
	str	r1, [r0, #4]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	.loc 1 42 0 discriminator 3
	ldr	r3, [fp, #-16]
	asr	r2, r3, #31
	lsr	r2, r2, #16
	add	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, r2
	mov	r2, r3
	ldr	r3, [fp, #-8]
	ldrb	r1, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-32]
	strb	r1, [r3, r2]
.LBE3:
	.loc 1 40 0 discriminator 3
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L7:
	.loc 1 40 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L8
	b	.L9
.L6:
.LBE2:
.LBB4:
	.loc 1 48 0 is_stmt 1
	ldr	r3, [fp, #-40]
	ldr	r3, [r3]
	str	r3, [fp, #-12]
	b	.L10
.L11:
.LBB5:
	.loc 1 49 0 discriminator 3
	ldr	r3, [fp, #-32]
	add	r3, r3, #65536
	ldr	r2, [r3]
	ldr	r3, [fp, #-32]
	add	r3, r3, #65536
	ldr	r3, [r3, #4]
	add	r1, r3, #1
	ldr	r0, [fp, #-32]
	add	r0, r0, #65536
	str	r1, [r0, #4]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	.loc 1 50 0 discriminator 3
	ldr	r3, [fp, #-20]
	asr	r2, r3, #31
	lsr	r2, r2, #16
	add	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, r2
	mov	r2, r3
	ldr	r3, [fp, #-12]
	ldrb	r1, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-32]
	strb	r1, [r3, r2]
.LBE5:
	.loc 1 48 0 discriminator 3
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L10:
	.loc 1 48 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L11
.L9:
.LBE4:
	.loc 1 53 0 is_stmt 1
	mov	r2, #0
	mov	r1, #0
	ldr	r0, [fp, #-36]
	bl	Reply(PLT)
	.loc 1 64 0
	b	.L14
.L5:
	.loc 1 55 0
	ldr	r3, [fp, #-32]
	add	r3, r3, #65536
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L13
.LBB6:
	.loc 1 56 0
	ldr	r3, [fp, #-32]
	add	r3, r3, #65536
	ldr	r3, [r3]
	ldr	r2, [fp, #-32]
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	strb	r3, [fp, #-21]
	.loc 1 57 0
	ldr	r3, [fp, #-32]
	add	r3, r3, #65536
	ldr	r3, [r3]
	add	r3, r3, #1
	asr	r2, r3, #31
	lsr	r2, r2, #16
	add	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, r2
	mov	r2, r3
	ldr	r3, [fp, #-32]
	add	r3, r3, #65536
	str	r2, [r3]
	.loc 1 58 0
	ldr	r3, [fp, #-32]
	add	r3, r3, #65536
	ldr	r3, [r3, #4]
	sub	r3, r3, #1
	ldr	r2, [fp, #-32]
	add	r2, r2, #65536
	str	r3, [r2, #4]
	.loc 1 59 0
	sub	r3, fp, #21
	mov	r2, #1
	mov	r1, r3
	ldr	r0, [fp, #-36]
	bl	Reply(PLT)
.LBE6:
	.loc 1 64 0
	b	.L14
.L13:
	.loc 1 61 0
	ldr	r3, [fp, #-32]
	add	r3, r3, #65536
	mov	r2, r3
	mov	r3, #1
	str	r3, [r2, #8]
.L14:
	.loc 1 64 0
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
	.global	sendCoutReady
	.syntax unified
	.arm
	.fpu softvfp
	.type	sendCoutReady, %function
sendCoutReady:
.LFB3:
	.loc 1 67 0
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
	.loc 1 69 0
	sub	r2, fp, #5
	mov	r3, #1
	str	r3, [sp]
	mov	r3, r2
	mov	r2, #0
	mov	r1, #0
	ldr	r0, [fp, #-16]
	bl	Send(PLT)
	.loc 1 70 0
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	.loc 1 71 0
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
	.size	sendCoutReady, .-sendCoutReady
	.align	2
	.global	sendCoutPutstr
	.syntax unified
	.arm
	.fpu softvfp
	.type	sendCoutPutstr, %function
sendCoutPutstr:
.LFB4:
	.loc 1 74 0
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
	.loc 1 76 0
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-8]
	.loc 1 77 0
	sub	r1, fp, #8
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #4
	ldr	r0, [fp, #-16]
	bl	Send(PLT)
	.loc 1 78 0
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
	.size	sendCoutPutstr, .-sendCoutPutstr
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	server_initialize, %function
server_initialize:
.LFB5:
	.loc 1 80 0
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
	.loc 1 80 0
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
	.loc 1 80 0
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
	.loc 1 80 0
	ldr	r3, [fp, #-16]
	add	r3, r3, #65536
	add	r3, r3, #16
	sub	r0, fp, #12
	mov	r2, #4
	mov	r1, r3
	bl	Receive(PLT)
	str	r0, [fp, #-8]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r2, r3, #65536
	add	r2, r2, #16
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
	.ascii	"cout_server\000"
	.align	2
.LC2:
	.ascii	"Service %s created with tid %d.\012\015\000"
	.text
	.align	2
	.global	cout_server
	.syntax unified
	.arm
	.fpu softvfp
	.type	cout_server, %function
cout_server:
.LFB7:
	.loc 1 80 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 65560
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #65536
	sub	sp, sp, #24
	.loc 1 80 0
	bl	Service(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L22
.LPIC2:
	add	r3, pc, r3
	mov	r1, r3
	ldr	r3, .L22+4
.LPIC3:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	sub	r3, fp, #65536
	sub	r3, r3, #4
	sub	r3, r3, #20
	mov	r0, r3
	bl	server_initialize(PLT)
.L21:
	.loc 1 80 0 is_stmt 0 discriminator 2
	sub	r3, fp, #65536
	sub	r3, r3, #4
	sub	r3, r3, #20
	mov	r0, r3
	bl	server_work(PLT)
	b	.L21
.L23:
	.align	2
.L22:
	.word	.LC1-(.LPIC2+8)
	.word	.LC2-(.LPIC3+8)
	.cfi_endproc
.LFE7:
	.size	cout_server, .-cout_server
.Letext0:
	.file 2 "src/syscall.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x329
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF28
	.byte	0xc
	.4byte	.LASF29
	.4byte	.LASF30
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
	.4byte	.LASF31
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
	.4byte	.LASF15
	.4byte	0x10010
	.byte	0x1
	.byte	0x8
	.4byte	0xcf
	.uleb128 0x7
	.4byte	.LASF9
	.byte	0x1
	.byte	0xa
	.4byte	0xcf
	.byte	0
	.uleb128 0x8
	.4byte	.LASF10
	.byte	0x1
	.byte	0xb
	.4byte	0x2c
	.4byte	0x10000
	.uleb128 0x8
	.4byte	.LASF11
	.byte	0x1
	.byte	0xc
	.4byte	0x2c
	.4byte	0x10004
	.uleb128 0x8
	.4byte	.LASF12
	.byte	0x1
	.byte	0xd
	.4byte	0x2c
	.4byte	0x10008
	.uleb128 0x8
	.4byte	.LASF13
	.byte	0x1
	.byte	0xe
	.4byte	0x2c
	.4byte	0x1000c
	.byte	0
	.uleb128 0x9
	.4byte	0xe0
	.4byte	0xe0
	.uleb128 0xa
	.4byte	0x69
	.2byte	0xffff
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF14
	.uleb128 0xb
	.4byte	.LASF16
	.byte	0x4
	.byte	0x1
	.byte	0x11
	.4byte	0x100
	.uleb128 0x7
	.4byte	.LASF17
	.byte	0x1
	.byte	0x12
	.4byte	0x100
	.byte	0
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0xe0
	.uleb128 0x6
	.4byte	.LASF18
	.4byte	0x10014
	.byte	0x1
	.byte	0x50
	.4byte	0x131
	.uleb128 0x7
	.4byte	.LASF19
	.byte	0x1
	.byte	0x50
	.4byte	0x77
	.byte	0
	.uleb128 0xd
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x50
	.4byte	0xe7
	.4byte	0x10010
	.byte	0
	.uleb128 0xe
	.4byte	.LASF23
	.byte	0x1
	.byte	0x50
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x157
	.uleb128 0xf
	.4byte	.LASF17
	.byte	0x1
	.byte	0x50
	.4byte	0x106
	.uleb128 0x4
	.byte	0x91
	.sleb128 -65564
	.byte	0
	.uleb128 0x10
	.4byte	.LASF21
	.byte	0x1
	.byte	0x50
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x197
	.uleb128 0x11
	.4byte	.LASF17
	.byte	0x1
	.byte	0x50
	.4byte	0x197
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x12
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x50
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xf
	.4byte	.LASF20
	.byte	0x1
	.byte	0x50
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x106
	.uleb128 0x10
	.4byte	.LASF22
	.byte	0x1
	.byte	0x50
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1c1
	.uleb128 0x11
	.4byte	.LASF17
	.byte	0x1
	.byte	0x50
	.4byte	0x197
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xe
	.4byte	.LASF24
	.byte	0x1
	.byte	0x49
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x201
	.uleb128 0x13
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x49
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.ascii	"str\000"
	.byte	0x1
	.byte	0x49
	.4byte	0x100
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x12
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x4b
	.4byte	0xe7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF32
	.byte	0x1
	.byte	0x42
	.4byte	0xe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x237
	.uleb128 0x13
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x42
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xf
	.4byte	.LASF25
	.byte	0x1
	.byte	0x44
	.4byte	0xe0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x10
	.4byte	.LASF26
	.byte	0x1
	.byte	0x1f
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x300
	.uleb128 0x11
	.4byte	.LASF17
	.byte	0x1
	.byte	0x1f
	.4byte	0x300
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x13
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x1f
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x13
	.ascii	"m\000"
	.byte	0x1
	.byte	0x1f
	.4byte	0x306
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x11
	.4byte	.LASF27
	.byte	0x1
	.byte	0x1f
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x15
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.4byte	0x2b5
	.uleb128 0x12
	.ascii	"ch\000"
	.byte	0x1
	.byte	0x23
	.4byte	0x100
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x16
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x12
	.ascii	"idx\000"
	.byte	0x1
	.byte	0x29
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x15
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.4byte	0x2e8
	.uleb128 0x12
	.ascii	"ch\000"
	.byte	0x1
	.byte	0x2d
	.4byte	0x100
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x16
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.uleb128 0x12
	.ascii	"idx\000"
	.byte	0x1
	.byte	0x31
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.uleb128 0x12
	.ascii	"ch\000"
	.byte	0x1
	.byte	0x38
	.4byte	0xe0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.byte	0
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x77
	.uleb128 0xc
	.byte	0x4
	.4byte	0xe7
	.uleb128 0x17
	.4byte	.LASF33
	.byte	0x1
	.byte	0x15
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.4byte	.LASF17
	.byte	0x1
	.byte	0x15
	.4byte	0x300
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
	.uleb128 0x6
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
	.uleb128 0x6
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
	.uleb128 0x5
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
.LASF25:
	.ascii	"reply\000"
.LASF22:
	.ascii	"server_initialize\000"
.LASF7:
	.ascii	"sizetype\000"
.LASF10:
	.ascii	"output_idx\000"
.LASF5:
	.ascii	"TASK_SIZE_TINY\000"
.LASF2:
	.ascii	"TASK_SIZE_BIG\000"
.LASF20:
	.ascii	"datalen\000"
.LASF29:
	.ascii	"src/tasks/drivers/cout_server.c\000"
.LASF15:
	.ascii	"Data\000"
.LASF33:
	.ascii	"initialize\000"
.LASF6:
	.ascii	"unsigned char\000"
.LASF9:
	.ascii	"outputs\000"
.LASF8:
	.ascii	"long long unsigned int\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF4:
	.ascii	"TASK_SIZE_SMALL\000"
.LASF30:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF24:
	.ascii	"sendCoutPutstr\000"
.LASF19:
	.ascii	"user\000"
.LASF14:
	.ascii	"char\000"
.LASF12:
	.ascii	"ready\000"
.LASF11:
	.ascii	"output_size\000"
.LASF16:
	.ascii	"Message\000"
.LASF17:
	.ascii	"data\000"
.LASF23:
	.ascii	"cout_server\000"
.LASF31:
	.ascii	"TaskSize\000"
.LASF26:
	.ascii	"handle\000"
.LASF27:
	.ascii	"size\000"
.LASF13:
	.ascii	"courier\000"
.LASF18:
	.ascii	"server_Data\000"
.LASF3:
	.ascii	"TASK_SIZE_NORMAL\000"
.LASF1:
	.ascii	"TASK_SIZE_GIANT\000"
.LASF28:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF21:
	.ascii	"server_work\000"
.LASF32:
	.ascii	"sendCoutReady\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
