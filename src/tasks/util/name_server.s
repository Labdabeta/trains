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
	.file	"name_server.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
.LFB1:
	.file 1 "src/tasks/util/name_server.c"
	.loc 1 17 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	.cfi_def_cfa_offset 4
	.cfi_offset 11, -4
	add	fp, sp, #0
	.cfi_def_cfa_register 11
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	.loc 1 18 0
	ldr	r3, [fp, #-8]
	mov	r2, #0
	str	r2, [r3, #2476]
	.loc 1 19 0
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
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	handle, %function
handle:
.LFB2:
	.loc 1 22 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #48
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	str	r2, [fp, #-48]
	str	r3, [fp, #-52]
	.loc 1 25 0
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L3
.LBB2:
	.loc 1 27 0
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #2476]
	cmp	r3, #75
	bne	.L4
	.loc 1 28 0
	mvn	r3, #0
	str	r3, [fp, #-36]
	.loc 1 29 0
	sub	r3, fp, #36
	mov	r2, #4
	mov	r1, r3
	ldr	r0, [fp, #-44]
	bl	Reply(PLT)
	.loc 1 30 0
	b	.L2
.L4:
	.loc 1 32 0
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #2476]
	ldr	r2, [fp, #-44]
	and	r1, r2, #255
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	mov	r2, r1
	strb	r2, [r3, #2400]
	.loc 1 35 0
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #2476]
	add	r1, r3, #1
	ldr	r2, [fp, #-40]
	str	r1, [r2, #2476]
	lsl	r3, r3, #5
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	.loc 1 36 0
	ldr	r3, [fp, #-48]
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	b	.L6
.L7:
	.loc 1 36 0 is_stmt 0 discriminator 3
	ldr	r3, [fp, #-8]
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-12]
	strb	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L6:
	.loc 1 36 0 discriminator 1
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L7
	.loc 1 37 0 is_stmt 1
	ldr	r3, [fp, #-12]
	mov	r2, #0
	strb	r2, [r3]
	.loc 1 39 0
	mov	r3, #0
	str	r3, [fp, #-36]
	.loc 1 40 0
	sub	r3, fp, #36
	mov	r2, #4
	mov	r1, r3
	ldr	r0, [fp, #-44]
	bl	Reply(PLT)
.LBE2:
	b	.L2
.L3:
.LBB3:
	.loc 1 43 0
	mvn	r3, #0
	str	r3, [fp, #-20]
	.loc 1 44 0
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #2476]
	sub	r3, r3, #1
	str	r3, [fp, #-16]
	b	.L9
.L16:
.LBB4:
	.loc 1 46 0
	mov	r3, #1
	str	r3, [fp, #-32]
	.loc 1 47 0
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #5
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	str	r3, [fp, #-28]
	.loc 1 48 0
	ldr	r3, [fp, #-48]
	ldr	r3, [r3]
	str	r3, [fp, #-24]
	b	.L10
.L13:
	.loc 1 49 0
	ldr	r3, [fp, #-24]
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L11
	.loc 1 50 0
	mov	r3, #0
	str	r3, [fp, #-32]
	.loc 1 51 0
	b	.L12
.L11:
	.loc 1 48 0 discriminator 2
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L10:
	.loc 1 48 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L13
	.loc 1 48 0 discriminator 3
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L13
.L12:
	.loc 1 54 0 is_stmt 1
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L14
	.loc 1 55 0
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-20]
	.loc 1 56 0
	b	.L15
.L14:
.LBE4:
	.loc 1 44 0 discriminator 2
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	str	r3, [fp, #-16]
.L9:
	.loc 1 44 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bge	.L16
.L15:
	.loc 1 60 0 is_stmt 1
	ldr	r3, [fp, #-20]
	cmn	r3, #1
	bne	.L17
	.loc 1 61 0
	mvn	r3, #0
	str	r3, [fp, #-36]
	b	.L18
.L17:
	.loc 1 63 0
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	add	r3, r3, #2400
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-36]
.L18:
	.loc 1 65 0
	sub	r3, fp, #36
	mov	r2, #4
	mov	r1, r3
	ldr	r0, [fp, #-44]
	bl	Reply(PLT)
.L2:
.LBE3:
	.loc 1 67 0
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
	.global	sendRegisterAs
	.syntax unified
	.arm
	.fpu softvfp
	.type	sendRegisterAs, %function
sendRegisterAs:
.LFB3:
	.loc 1 70 0
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
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	.loc 1 73 0
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-12]
	.loc 1 74 0
	mov	r3, #1
	str	r3, [fp, #-8]
	.loc 1 76 0
	sub	r2, fp, #16
	sub	r1, fp, #12
	mov	r3, #4
	str	r3, [sp]
	mov	r3, r2
	mov	r2, #8
	ldr	r0, [fp, #-24]
	bl	Send(PLT)
	.loc 1 78 0
	ldr	r3, [fp, #-16]
	.loc 1 79 0
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
	.size	sendRegisterAs, .-sendRegisterAs
	.align	2
	.global	sendWhoIs
	.syntax unified
	.arm
	.fpu softvfp
	.type	sendWhoIs, %function
sendWhoIs:
.LFB4:
	.loc 1 82 0
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
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	.loc 1 86 0
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-12]
	.loc 1 87 0
	mov	r3, #0
	str	r3, [fp, #-8]
	.loc 1 89 0
	sub	r2, fp, #16
	sub	r1, fp, #12
	mov	r3, #4
	str	r3, [sp]
	mov	r3, r2
	mov	r2, #8
	ldr	r0, [fp, #-24]
	bl	Send(PLT)
	.loc 1 91 0
	ldr	r3, [fp, #-16]
	.loc 1 92 0
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
	.size	sendWhoIs, .-sendWhoIs
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	server_initialize, %function
server_initialize:
.LFB5:
	.loc 1 94 0
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
	.loc 1 94 0
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
	.loc 1 94 0
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
	.loc 1 94 0
	ldr	r3, [fp, #-16]
	add	r1, r3, #2480
	sub	r3, fp, #12
	mov	r2, #8
	mov	r0, r3
	bl	Receive(PLT)
	str	r0, [fp, #-8]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r2, r3, #2480
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
.LC0:
	.ascii	"name_server\000"
	.align	2
.LC1:
	.ascii	"Service %s created with tid %d.\012\015\000"
	.text
	.align	2
	.global	name_server
	.syntax unified
	.arm
	.fpu softvfp
	.type	name_server, %function
name_server:
.LFB7:
	.loc 1 94 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 2488
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #2480
	sub	sp, sp, #8
	.loc 1 94 0
	bl	Service(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L28
.LPIC0:
	add	r3, pc, r3
	mov	r1, r3
	ldr	r3, .L28+4
.LPIC1:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	sub	r3, fp, #2480
	sub	r3, r3, #4
	sub	r3, r3, #8
	mov	r0, r3
	bl	server_initialize(PLT)
.L27:
	.loc 1 94 0 is_stmt 0 discriminator 2
	sub	r3, fp, #2480
	sub	r3, r3, #4
	sub	r3, r3, #8
	mov	r0, r3
	bl	server_work(PLT)
	b	.L27
.L29:
	.align	2
.L28:
	.word	.LC0-(.LPIC0+8)
	.word	.LC1-(.LPIC1+8)
	.cfi_endproc
.LFE7:
	.size	name_server, .-name_server
.Letext0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x325
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF23
	.byte	0xc
	.4byte	.LASF24
	.4byte	.LASF25
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
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x4
	.4byte	.LASF8
	.2byte	0x9b0
	.byte	0x1
	.byte	0x5
	.4byte	0x7c
	.uleb128 0x5
	.4byte	.LASF4
	.byte	0x1
	.byte	0x6
	.4byte	0x7c
	.byte	0
	.uleb128 0x6
	.4byte	.LASF5
	.byte	0x1
	.byte	0x7
	.4byte	0x94
	.2byte	0x960
	.uleb128 0x6
	.4byte	.LASF6
	.byte	0x1
	.byte	0x8
	.4byte	0x2c
	.2byte	0x9ac
	.byte	0
	.uleb128 0x7
	.4byte	0x8d
	.4byte	0x8d
	.uleb128 0x8
	.4byte	0x3a
	.2byte	0x95f
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF7
	.uleb128 0x7
	.4byte	0x8d
	.4byte	0xa4
	.uleb128 0x9
	.4byte	0x3a
	.byte	0x4a
	.byte	0
	.uleb128 0xa
	.4byte	.LASF9
	.byte	0x8
	.byte	0x1
	.byte	0xb
	.4byte	0xc9
	.uleb128 0x5
	.4byte	.LASF10
	.byte	0x1
	.byte	0xc
	.4byte	0xc9
	.byte	0
	.uleb128 0x5
	.4byte	.LASF11
	.byte	0x1
	.byte	0xd
	.4byte	0x2c
	.byte	0x4
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x8d
	.uleb128 0x4
	.4byte	.LASF12
	.2byte	0x9b8
	.byte	0x1
	.byte	0x5e
	.4byte	0xf6
	.uleb128 0x5
	.4byte	.LASF13
	.byte	0x1
	.byte	0x5e
	.4byte	0x48
	.byte	0
	.uleb128 0xc
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x5e
	.4byte	0xa4
	.2byte	0x9b0
	.byte	0
	.uleb128 0xd
	.4byte	.LASF26
	.byte	0x1
	.byte	0x5e
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x11b
	.uleb128 0xe
	.4byte	.LASF14
	.byte	0x1
	.byte	0x5e
	.4byte	0xcf
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2496
	.byte	0
	.uleb128 0xf
	.4byte	.LASF16
	.byte	0x1
	.byte	0x5e
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x15b
	.uleb128 0x10
	.4byte	.LASF14
	.byte	0x1
	.byte	0x5e
	.4byte	0x15b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x5e
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xe
	.4byte	.LASF15
	.byte	0x1
	.byte	0x5e
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0xcf
	.uleb128 0xf
	.4byte	.LASF17
	.byte	0x1
	.byte	0x5e
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x185
	.uleb128 0x10
	.4byte	.LASF14
	.byte	0x1
	.byte	0x5e
	.4byte	0x15b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x12
	.4byte	.LASF19
	.byte	0x1
	.byte	0x51
	.4byte	0x2c
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1d7
	.uleb128 0x13
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x51
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x10
	.4byte	.LASF10
	.byte	0x1
	.byte	0x51
	.4byte	0xc9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x11
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x53
	.4byte	0xa4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xe
	.4byte	.LASF18
	.byte	0x1
	.byte	0x54
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x12
	.4byte	.LASF20
	.byte	0x1
	.byte	0x45
	.4byte	0x2c
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x229
	.uleb128 0x13
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x45
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x10
	.4byte	.LASF10
	.byte	0x1
	.byte	0x45
	.4byte	0xc9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x11
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x47
	.4byte	0xa4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xe
	.4byte	.LASF18
	.byte	0x1
	.byte	0x48
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xf
	.4byte	.LASF21
	.byte	0x1
	.byte	0x15
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2fc
	.uleb128 0x10
	.4byte	.LASF14
	.byte	0x1
	.byte	0x15
	.4byte	0x2fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x13
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x15
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x13
	.ascii	"m\000"
	.byte	0x1
	.byte	0x15
	.4byte	0x302
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x10
	.4byte	.LASF6
	.byte	0x1
	.byte	0x15
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xe
	.4byte	.LASF18
	.byte	0x1
	.byte	0x18
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x14
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.4byte	0x2a8
	.uleb128 0x11
	.ascii	"c\000"
	.byte	0x1
	.byte	0x1a
	.4byte	0xc9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x11
	.ascii	"n\000"
	.byte	0x1
	.byte	0x1a
	.4byte	0xc9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x15
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x11
	.ascii	"i\000"
	.byte	0x1
	.byte	0x2a
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.ascii	"id\000"
	.byte	0x1
	.byte	0x2b
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x15
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.uleb128 0x11
	.ascii	"c\000"
	.byte	0x1
	.byte	0x2d
	.4byte	0xc9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.ascii	"n\000"
	.byte	0x1
	.byte	0x2d
	.4byte	0xc9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xe
	.4byte	.LASF22
	.byte	0x1
	.byte	0x2e
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x48
	.uleb128 0xb
	.byte	0x4
	.4byte	0xa4
	.uleb128 0x16
	.4byte	.LASF27
	.byte	0x1
	.byte	0x10
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x10
	.4byte	.LASF14
	.byte	0x1
	.byte	0x10
	.4byte	0x2fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
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
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
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
	.uleb128 0x15
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x16
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
.LASF19:
	.ascii	"sendWhoIs\000"
.LASF18:
	.ascii	"reply\000"
.LASF26:
	.ascii	"name_server\000"
.LASF2:
	.ascii	"sizetype\000"
.LASF5:
	.ascii	"tids\000"
.LASF22:
	.ascii	"same\000"
.LASF15:
	.ascii	"datalen\000"
.LASF17:
	.ascii	"server_initialize\000"
.LASF8:
	.ascii	"Data\000"
.LASF11:
	.ascii	"isRegister\000"
.LASF10:
	.ascii	"name\000"
.LASF27:
	.ascii	"initialize\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF20:
	.ascii	"sendRegisterAs\000"
.LASF3:
	.ascii	"long long unsigned int\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF4:
	.ascii	"names\000"
.LASF25:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF24:
	.ascii	"src/tasks/util/name_server.c\000"
.LASF13:
	.ascii	"user\000"
.LASF7:
	.ascii	"char\000"
.LASF14:
	.ascii	"data\000"
.LASF21:
	.ascii	"handle\000"
.LASF6:
	.ascii	"size\000"
.LASF12:
	.ascii	"server_Data\000"
.LASF9:
	.ascii	"Message\000"
.LASF23:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF16:
	.ascii	"server_work\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
