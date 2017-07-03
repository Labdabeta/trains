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
	.file	"tout_server.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata
	.align	2
.LC0:
	.ascii	"TOUT\000"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
.LFB0:
	.file 1 "src/tasks/drivers/tout_server.c"
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
	mov	r2, #0
	str	r2, [r3, #256]
	.loc 1 24 0
	ldr	r3, [fp, #-16]
	mov	r2, #0
	str	r2, [r3, #260]
	.loc 1 25 0
	ldr	r3, [fp, #-16]
	mov	r2, #0
	str	r2, [r3, #264]
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
	mov	r0, #1
	bl	CreateSize(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-16]
	str	r2, [r3, #268]
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
	.word	tout_courier(GOT)
	.cfi_endproc
.LFE0:
	.size	initialize, .-initialize
	.section	.rodata
	.align	2
.LC1:
	.ascii	"src/tasks/drivers/tout_server.c\000"
	.align	2
.LC2:
	.ascii	"%s@%s:%d\012\015\000"
	.align	2
.LC3:
	.ascii	"ERROR Invalid message in tout server %d\000"
	.align	2
.LC4:
	.ascii	"\012\015\000"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	handle, %function
handle:
.LFB1:
	.loc 1 32 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
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
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	.loc 1 34 0
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #4]
	cmp	r3, #1
	beq	.L6
	cmp	r3, #2
	beq	.L7
	cmp	r3, #0
	bne	.L16
	.loc 1 36 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #260]
	cmp	r3, #0
	beq	.L9
.LBB2:
	.loc 1 37 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #256]
	ldr	r2, [fp, #-24]
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	strb	r3, [fp, #-17]
	.loc 1 38 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #256]
	add	r2, r3, #1
	asr	r3, r2, #31
	lsr	r3, r3, #24
	add	r2, r2, r3
	and	r2, r2, #255
	sub	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	str	r2, [r3, #256]
	.loc 1 39 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #260]
	sub	r2, r3, #1
	ldr	r3, [fp, #-24]
	str	r2, [r3, #260]
	.loc 1 40 0
	sub	r3, fp, #17
	mov	r2, #1
	mov	r1, r3
	ldr	r0, [fp, #-28]
	bl	Reply(PLT)
.LBE2:
	.loc 1 44 0
	b	.L11
.L9:
	.loc 1 42 0
	ldr	r3, [fp, #-24]
	mov	r2, #1
	str	r2, [r3, #264]
	.loc 1 44 0
	b	.L11
.L6:
	.loc 1 46 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #264]
	cmp	r3, #0
	beq	.L12
	.loc 1 47 0
	ldr	r3, [fp, #-24]
	mov	r2, #0
	str	r2, [r3, #264]
	.loc 1 48 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #268]
	ldr	r1, [fp, #-32]
	mov	r2, #1
	mov	r0, r3
	bl	Reply(PLT)
	b	.L13
.L12:
.LBB3:
	.loc 1 51 0
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #256]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #260]
	add	r0, r3, #1
	ldr	r1, [fp, #-24]
	str	r0, [r1, #260]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	.loc 1 52 0
	ldr	r2, [fp, #-8]
	asr	r3, r2, #31
	lsr	r3, r3, #24
	add	r2, r2, r3
	and	r2, r2, #255
	sub	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-32]
	ldrb	r1, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-24]
	strb	r1, [r3, r2]
.L13:
.LBE3:
	.loc 1 54 0
	mov	r2, #0
	mov	r1, #0
	ldr	r0, [fp, #-28]
	bl	Reply(PLT)
	.loc 1 55 0
	b	.L11
.L7:
	.loc 1 57 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #264]
	cmp	r3, #0
	beq	.L14
.LBB4:
	.loc 1 58 0
	ldr	r3, [fp, #-24]
	mov	r2, #0
	str	r2, [r3, #264]
	.loc 1 59 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #268]
	ldr	r1, [fp, #-32]
	mov	r2, #1
	mov	r0, r3
	bl	Reply(PLT)
	.loc 1 62 0
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #256]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #260]
	add	r0, r3, #1
	ldr	r1, [fp, #-24]
	str	r0, [r1, #260]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	.loc 1 63 0
	ldr	r2, [fp, #-12]
	asr	r3, r2, #31
	lsr	r3, r3, #24
	add	r2, r2, r3
	and	r2, r2, #255
	sub	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-32]
	ldrb	r1, [r3, #1]	@ zero_extendqisi2
	ldr	r3, [fp, #-24]
	strb	r1, [r3, r2]
.LBE4:
	b	.L15
.L14:
.LBB5:
	.loc 1 66 0
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #256]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #260]
	add	r0, r3, #1
	ldr	r1, [fp, #-24]
	str	r0, [r1, #260]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	.loc 1 67 0
	ldr	r2, [fp, #-16]
	asr	r3, r2, #31
	lsr	r3, r3, #24
	add	r2, r2, r3
	and	r2, r2, #255
	sub	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-32]
	ldrb	r1, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-24]
	strb	r1, [r3, r2]
	.loc 1 68 0
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #256]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #260]
	add	r0, r3, #1
	ldr	r1, [fp, #-24]
	str	r0, [r1, #260]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	.loc 1 69 0
	ldr	r2, [fp, #-16]
	asr	r3, r2, #31
	lsr	r3, r3, #24
	add	r2, r2, r3
	and	r2, r2, #255
	sub	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-32]
	ldrb	r1, [r3, #1]	@ zero_extendqisi2
	ldr	r3, [fp, #-24]
	strb	r1, [r3, r2]
.L15:
.LBE5:
	.loc 1 71 0
	mov	r2, #0
	mov	r1, #0
	ldr	r0, [fp, #-28]
	bl	Reply(PLT)
	.loc 1 72 0
	b	.L11
.L16:
	.loc 1 74 0
	mov	r3, #74
	ldr	r2, .L17
.LPIC2:
	add	r2, pc, r2
	ldr	r1, .L17+4
.LPIC3:
	add	r1, pc, r1
	ldr	r0, .L17+8
.LPIC4:
	add	r0, pc, r0
	bl	tfp_dprintf(PLT)
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #4]
	mov	r1, r3
	ldr	r3, .L17+12
.LPIC5:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	ldr	r3, .L17+16
.LPIC6:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
.L11:
	.loc 1 76 0
	nop
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L18:
	.align	2
.L17:
	.word	__func__.4421-(.LPIC2+8)
	.word	.LC1-(.LPIC3+8)
	.word	.LC2-(.LPIC4+8)
	.word	.LC3-(.LPIC5+8)
	.word	.LC4-(.LPIC6+8)
	.cfi_endproc
.LFE1:
	.size	handle, .-handle
	.align	2
	.global	sendToutReady
	.syntax unified
	.arm
	.fpu softvfp
	.type	sendToutReady, %function
sendToutReady:
.LFB2:
	.loc 1 79 0
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
	.loc 1 82 0
	mov	r3, #0
	str	r3, [fp, #-8]
	.loc 1 83 0
	sub	r2, fp, #13
	sub	r1, fp, #12
	mov	r3, #1
	str	r3, [sp]
	mov	r3, r2
	mov	r2, #8
	ldr	r0, [fp, #-24]
	bl	Send(PLT)
	.loc 1 84 0
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	.loc 1 85 0
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
.LFE2:
	.size	sendToutReady, .-sendToutReady
	.align	2
	.global	sendToutByte
	.syntax unified
	.arm
	.fpu softvfp
	.type	sendToutByte, %function
sendToutByte:
.LFB3:
	.loc 1 88 0
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
	mov	r3, r1
	strb	r3, [fp, #-17]
	.loc 1 90 0
	mov	r3, #1
	str	r3, [fp, #-8]
	.loc 1 91 0
	ldrb	r3, [fp, #-17]
	strb	r3, [fp, #-12]
	.loc 1 92 0
	sub	r1, fp, #12
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #8
	ldr	r0, [fp, #-16]
	bl	Send(PLT)
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
.LFE3:
	.size	sendToutByte, .-sendToutByte
	.align	2
	.global	sendToutBytePair
	.syntax unified
	.arm
	.fpu softvfp
	.type	sendToutBytePair, %function
sendToutBytePair:
.LFB4:
	.loc 1 96 0
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
	mov	r3, r1
	strb	r3, [fp, #-17]
	mov	r3, r2
	strb	r3, [fp, #-18]
	.loc 1 98 0
	mov	r3, #2
	str	r3, [fp, #-8]
	.loc 1 99 0
	ldrb	r3, [fp, #-17]
	strb	r3, [fp, #-12]
	.loc 1 100 0
	ldrb	r3, [fp, #-18]
	strb	r3, [fp, #-11]
	.loc 1 101 0
	sub	r1, fp, #12
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #8
	ldr	r0, [fp, #-16]
	bl	Send(PLT)
	.loc 1 102 0
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
	.size	sendToutBytePair, .-sendToutBytePair
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	server_initialize, %function
server_initialize:
.LFB5:
	.loc 1 104 0
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
	.loc 1 104 0
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
	.loc 1 104 0
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
	.loc 1 104 0
	ldr	r3, [fp, #-16]
	add	r1, r3, #272
	sub	r3, fp, #12
	mov	r2, #8
	mov	r0, r3
	bl	Receive(PLT)
	str	r0, [fp, #-8]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r2, r3, #272
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
.LC5:
	.ascii	"tout_server\000"
	.align	2
.LC6:
	.ascii	"Service %s created with tid %d.\012\015\000"
	.text
	.align	2
	.global	tout_server
	.syntax unified
	.arm
	.fpu softvfp
	.type	tout_server, %function
tout_server:
.LFB7:
	.loc 1 104 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 280
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #280
	.loc 1 104 0
	bl	Service(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L27
.LPIC7:
	add	r3, pc, r3
	mov	r1, r3
	ldr	r3, .L27+4
.LPIC8:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	sub	r3, fp, #284
	mov	r0, r3
	bl	server_initialize(PLT)
.L26:
	.loc 1 104 0 is_stmt 0 discriminator 2
	sub	r3, fp, #284
	mov	r0, r3
	bl	server_work(PLT)
	b	.L26
.L28:
	.align	2
.L27:
	.word	.LC5-(.LPIC7+8)
	.word	.LC6-(.LPIC8+8)
	.cfi_endproc
.LFE7:
	.size	tout_server, .-tout_server
	.section	.rodata
	.align	2
	.type	__func__.4421, %object
	.size	__func__.4421, 7
__func__.4421:
	.ascii	"handle\000"
	.text
.Letext0:
	.file 2 "src/syscall.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x392
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
	.4byte	.LASF14
	.2byte	0x110
	.byte	0x1
	.byte	0x6
	.4byte	0xb7
	.uleb128 0x7
	.4byte	.LASF7
	.byte	0x1
	.byte	0x8
	.4byte	0xb7
	.byte	0
	.uleb128 0x8
	.4byte	.LASF8
	.byte	0x1
	.byte	0x9
	.4byte	0x2c
	.2byte	0x100
	.uleb128 0x8
	.4byte	.LASF9
	.byte	0x1
	.byte	0xa
	.4byte	0x2c
	.2byte	0x104
	.uleb128 0x8
	.4byte	.LASF10
	.byte	0x1
	.byte	0xb
	.4byte	0x2c
	.2byte	0x108
	.uleb128 0x8
	.4byte	.LASF11
	.byte	0x1
	.byte	0xc
	.4byte	0x2c
	.2byte	0x10c
	.byte	0
	.uleb128 0x9
	.4byte	0xce
	.4byte	0xc7
	.uleb128 0xa
	.4byte	0xc7
	.byte	0xff
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF13
	.uleb128 0xb
	.4byte	0xce
	.uleb128 0xc
	.4byte	.LASF15
	.byte	0x8
	.byte	0x1
	.byte	0xf
	.4byte	0x109
	.uleb128 0xd
	.ascii	"b1\000"
	.byte	0x1
	.byte	0x10
	.4byte	0xce
	.byte	0
	.uleb128 0xd
	.ascii	"b2\000"
	.byte	0x1
	.byte	0x11
	.4byte	0xce
	.byte	0x1
	.uleb128 0x7
	.4byte	.LASF16
	.byte	0x1
	.byte	0x12
	.4byte	0x2c
	.byte	0x4
	.byte	0
	.uleb128 0x6
	.4byte	.LASF17
	.2byte	0x118
	.byte	0x1
	.byte	0x68
	.4byte	0x130
	.uleb128 0x7
	.4byte	.LASF18
	.byte	0x1
	.byte	0x68
	.4byte	0x69
	.byte	0
	.uleb128 0xe
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x68
	.4byte	0xda
	.2byte	0x110
	.byte	0
	.uleb128 0xf
	.4byte	.LASF23
	.byte	0x1
	.byte	0x68
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x155
	.uleb128 0x10
	.4byte	.LASF19
	.byte	0x1
	.byte	0x68
	.4byte	0x109
	.uleb128 0x3
	.byte	0x91
	.sleb128 -288
	.byte	0
	.uleb128 0x11
	.4byte	.LASF21
	.byte	0x1
	.byte	0x68
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x195
	.uleb128 0x12
	.4byte	.LASF19
	.byte	0x1
	.byte	0x68
	.4byte	0x195
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x68
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x10
	.4byte	.LASF20
	.byte	0x1
	.byte	0x68
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.byte	0x4
	.4byte	0x109
	.uleb128 0x11
	.4byte	.LASF22
	.byte	0x1
	.byte	0x68
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1bf
	.uleb128 0x12
	.4byte	.LASF19
	.byte	0x1
	.byte	0x68
	.4byte	0x195
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xf
	.4byte	.LASF24
	.byte	0x1
	.byte	0x5f
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x20b
	.uleb128 0x15
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x5f
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.ascii	"b1\000"
	.byte	0x1
	.byte	0x5f
	.4byte	0xce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x15
	.ascii	"b2\000"
	.byte	0x1
	.byte	0x5f
	.4byte	0xce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x13
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x61
	.4byte	0xda
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xf
	.4byte	.LASF25
	.byte	0x1
	.byte	0x57
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x24a
	.uleb128 0x15
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x57
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.ascii	"b1\000"
	.byte	0x1
	.byte	0x57
	.4byte	0xce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x13
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x59
	.4byte	0xda
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x16
	.4byte	.LASF33
	.byte	0x1
	.byte	0x4e
	.4byte	0xce
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x28e
	.uleb128 0x15
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x4e
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x13
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x50
	.4byte	0xda
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x10
	.4byte	.LASF26
	.byte	0x1
	.byte	0x51
	.4byte	0xce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x11
	.4byte	.LASF27
	.byte	0x1
	.byte	0x1f
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x354
	.uleb128 0x12
	.4byte	.LASF19
	.byte	0x1
	.byte	0x1f
	.4byte	0x354
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x15
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x1f
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x15
	.ascii	"m\000"
	.byte	0x1
	.byte	0x1f
	.4byte	0x35a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x12
	.4byte	.LASF28
	.byte	0x1
	.byte	0x1f
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x17
	.4byte	.LASF34
	.4byte	0x370
	.uleb128 0x5
	.byte	0x3
	.4byte	__func__.4421
	.uleb128 0x18
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.4byte	0x303
	.uleb128 0x13
	.ascii	"ch\000"
	.byte	0x1
	.byte	0x25
	.4byte	0xce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.byte	0
	.uleb128 0x18
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.4byte	0x31f
	.uleb128 0x13
	.ascii	"idx\000"
	.byte	0x1
	.byte	0x33
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x18
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.4byte	0x33b
	.uleb128 0x13
	.ascii	"idx\000"
	.byte	0x1
	.byte	0x3e
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x19
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.uleb128 0x13
	.ascii	"idx\000"
	.byte	0x1
	.byte	0x42
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x14
	.byte	0x4
	.4byte	0x69
	.uleb128 0x14
	.byte	0x4
	.4byte	0xda
	.uleb128 0x9
	.4byte	0xd5
	.4byte	0x370
	.uleb128 0xa
	.4byte	0xc7
	.byte	0x6
	.byte	0
	.uleb128 0xb
	.4byte	0x360
	.uleb128 0x1a
	.4byte	.LASF35
	.byte	0x1
	.byte	0x15
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x12
	.4byte	.LASF19
	.byte	0x1
	.byte	0x15
	.4byte	0x354
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
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1a
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
.LASF26:
	.ascii	"reply\000"
.LASF22:
	.ascii	"server_initialize\000"
.LASF12:
	.ascii	"sizetype\000"
.LASF8:
	.ascii	"output_idx\000"
.LASF5:
	.ascii	"TASK_SIZE_TINY\000"
.LASF2:
	.ascii	"TASK_SIZE_BIG\000"
.LASF20:
	.ascii	"datalen\000"
.LASF14:
	.ascii	"Data\000"
.LASF35:
	.ascii	"initialize\000"
.LASF6:
	.ascii	"unsigned char\000"
.LASF7:
	.ascii	"outputs\000"
.LASF16:
	.ascii	"type\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF23:
	.ascii	"tout_server\000"
.LASF4:
	.ascii	"TASK_SIZE_SMALL\000"
.LASF31:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF34:
	.ascii	"__func__\000"
.LASF18:
	.ascii	"user\000"
.LASF24:
	.ascii	"sendToutBytePair\000"
.LASF13:
	.ascii	"char\000"
.LASF10:
	.ascii	"ready\000"
.LASF25:
	.ascii	"sendToutByte\000"
.LASF9:
	.ascii	"output_size\000"
.LASF15:
	.ascii	"Message\000"
.LASF19:
	.ascii	"data\000"
.LASF32:
	.ascii	"TaskSize\000"
.LASF33:
	.ascii	"sendToutReady\000"
.LASF27:
	.ascii	"handle\000"
.LASF28:
	.ascii	"size\000"
.LASF11:
	.ascii	"courier\000"
.LASF17:
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
.LASF30:
	.ascii	"src/tasks/drivers/tout_server.c\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
