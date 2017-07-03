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
	.file	"A0_model.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Model TID: %d\012\015\000"
	.align	2
.LC1:
	.ascii	"TOUT\000"
	.align	2
.LC2:
	.ascii	"CLOCK\000"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
.LFB0:
	.file 1 "src/tasks/A0/A0_model.c"
	.loc 1 22 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #8
	.cfi_def_cfa 11, 4
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	ldr	r4, .L6
.LPIC3:
	add	r4, pc, r4
	.loc 1 24 0
	bl	MyTid(PLT)
	mov	r3, r0
	mov	r1, r3
	ldr	r3, .L6+4
.LPIC0:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	.loc 1 25 0
	ldr	r3, .L6+8
.LPIC1:
	add	r3, pc, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-24]
	str	r2, [r3, #44]
	.loc 1 26 0
	ldr	r3, .L6+12
.LPIC2:
	add	r3, pc, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-24]
	str	r2, [r3, #48]
	.loc 1 27 0
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L2
.L3:
	.loc 1 28 0 discriminator 3
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	add	r3, r3, #52
	mov	r2, #0
	strb	r2, [r3]
	.loc 1 27 0 discriminator 3
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L2:
	.loc 1 27 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-16]
	cmp	r3, #9
	ble	.L3
	.loc 1 30 0 is_stmt 1
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L4
.L5:
	.loc 1 31 0 discriminator 3
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	add	r3, r3, #62
	mov	r2, #63
	strb	r2, [r3]
	.loc 1 30 0 discriminator 3
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L4:
	.loc 1 30 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-16]
	cmp	r3, #20
	ble	.L5
	.loc 1 33 0 is_stmt 1
	mov	r2, #3
	ldr	r3, .L6+16
	ldr	r3, [r4, r3]
	mov	r1, r3
	mov	r0, #1
	bl	CreateSize(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-24]
	str	r2, [r3, #92]
	.loc 1 34 0
	ldr	r3, [fp, #-24]
	ldr	r0, [r3, #92]
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #0
	mov	r1, #0
	bl	Send(PLT)
	.loc 1 36 0
	mov	r2, #3
	ldr	r3, .L6+20
	ldr	r3, [r4, r3]
	mov	r1, r3
	mov	r0, #1
	bl	CreateSize(PLT)
	str	r0, [fp, #-16]
	.loc 1 37 0
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #0
	mov	r1, #0
	ldr	r0, [fp, #-16]
	bl	Send(PLT)
	.loc 1 39 0
	mov	r2, #3
	ldr	r3, .L6+24
	ldr	r3, [r4, r3]
	mov	r1, r3
	mov	r0, #1
	bl	CreateSize(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-24]
	str	r2, [r3, #96]
	.loc 1 40 0
	mov	r2, #3
	ldr	r3, .L6+28
	ldr	r3, [r4, r3]
	mov	r1, r3
	mov	r0, #1
	bl	CreateSize(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-24]
	str	r2, [r3, #100]
	.loc 1 41 0
	mov	r2, #3
	ldr	r3, .L6+32
	ldr	r3, [r4, r3]
	mov	r1, r3
	mov	r0, #1
	bl	CreateSize(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-24]
	str	r2, [r3, #104]
	.loc 1 42 0
	mov	r2, #3
	ldr	r3, .L6+36
	ldr	r3, [r4, r3]
	mov	r1, r3
	mov	r0, #1
	bl	CreateSize(PLT)
	.loc 1 43 0
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
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC3+8)
	.word	.LC0-(.LPIC0+8)
	.word	.LC1-(.LPIC1+8)
	.word	.LC2-(.LPIC2+8)
	.word	train_state_view(GOT)
	.word	setup_t(GOT)
	.word	echo_view_t(GOT)
	.word	flip_view_t(GOT)
	.word	sensor_view_t(GOT)
	.word	time_view_t(GOT)
	.cfi_endproc
.LFE0:
	.size	initialize, .-initialize
	.section	.rodata
	.align	2
.LC3:
	.ascii	"\033[2J\000"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	handle, %function
handle:
.LFB1:
	.loc 1 46 0
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
	sub	sp, sp, #40
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	ldr	r1, .L31
.LPIC4:
	add	r1, pc, r1
	.loc 1 49 0
	ldr	r3, [fp, #-32]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L10
	cmp	r3, #2
	beq	.L11
	cmp	r3, #0
	bne	.L9
	.loc 1 51 0
	ldr	r3, [fp, #-32]
	ldrb	r2, [r3, #4]	@ zero_extendqisi2
	ldr	r3, [fp, #-24]
	strb	r2, [r3, #83]
	.loc 1 52 0
	ldr	r3, [fp, #-24]
	ldr	r0, [r3, #96]
	ldr	r3, [fp, #-24]
	add	r1, r3, #83
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #1
	bl	Send(PLT)
	.loc 1 53 0
	b	.L9
.L10:
	.loc 1 55 0
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L13
.L16:
	.loc 1 56 0
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	add	r3, r3, #4
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r1, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r1, r3
	add	r3, r3, #52
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L14
	.loc 1 57 0
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	add	r3, r3, #4
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	add	r3, r3, #52
	ldrb	r3, [r3]	@ zero_extendqisi2
	mvn	r3, r3
	and	r3, r3, r1
	cmp	r3, #0
	beq	.L15
	.loc 1 58 0
	ldr	r3, [fp, #-8]
	and	r2, r3, #255
	ldr	r3, [fp, #-24]
	strb	r2, [r3, #83]
	.loc 1 59 0
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	add	r3, r3, #4
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsl	r3, r3, #24
	asr	r2, r3, #24
	ldr	r1, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r1, r3
	add	r3, r3, #52
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsl	r3, r3, #24
	asr	r3, r3, #24
	mvn	r3, r3
	lsl	r3, r3, #24
	asr	r3, r3, #24
	and	r3, r3, r2
	lsl	r3, r3, #24
	asr	r3, r3, #24
	and	r2, r3, #255
	ldr	r3, [fp, #-24]
	strb	r2, [r3, #84]
	.loc 1 60 0
	ldr	r3, [fp, #-24]
	ldr	r0, [r3, #104]
	ldr	r3, [fp, #-24]
	add	r1, r3, #83
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #2
	bl	Send(PLT)
.L15:
	.loc 1 62 0
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	add	r3, r3, #4
	ldrb	r1, [r3]	@ zero_extendqisi2
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	add	r3, r3, #52
	mov	r2, r1
	strb	r2, [r3]
.L14:
	.loc 1 55 0 discriminator 2
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L13:
	.loc 1 55 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-8]
	cmp	r3, #9
	ble	.L16
	.loc 1 65 0 is_stmt 1
	b	.L9
.L11:
	.loc 1 67 0
	ldr	r3, [fp, #-32]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #4
	addls	pc, pc, r3, asl #2
	b	.L29
.L19:
	b	.L18
	b	.L20
	b	.L21
	b	.L22
	b	.L23
	.p2align 1
.L18:
	.loc 1 69 0
	ldr	r3, [fp, #-24]
	mov	r2, #0
	strb	r2, [r3, #24]
	.loc 1 70 0
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-24]
	str	r2, [r3, #28]
	.loc 1 71 0
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-24]
	str	r2, [r3, #32]
	.loc 1 72 0
	b	.L24
.L20:
	.loc 1 75 0
	ldr	r3, [fp, #-24]
	mov	r2, #1
	strb	r2, [r3, #24]
	.loc 1 76 0
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-24]
	str	r2, [r3, #28]
	.loc 1 77 0
	b	.L24
.L21:
	.loc 1 80 0
	ldr	r3, [fp, #-24]
	mov	r2, #2
	strb	r2, [r3, #24]
	.loc 1 81 0
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-24]
	str	r2, [r3, #28]
	.loc 1 82 0
	nop
.L24:
	.loc 1 85 0
	ldr	r3, [fp, #-24]
	ldr	r0, [r3, #92]
	ldr	r3, [fp, #-24]
	add	r1, r3, #24
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #12
	bl	Send(PLT)
	.loc 1 86 0
	b	.L17
.L22:
	.loc 1 89 0
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-12]
	.loc 1 90 0
	ldr	r3, [fp, #-12]
	cmp	r3, #18
	ble	.L25
	.loc 1 91 0
	ldr	r3, [fp, #-12]
	sub	r3, r3, #134
	str	r3, [fp, #-12]
.L25:
	.loc 1 92 0
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	add	r3, r3, #62
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-32]
	ldrb	r3, [r3, #12]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L30
	.loc 1 93 0
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-24]
	str	r2, [r3, #36]
	.loc 1 94 0
	ldr	r3, [fp, #-32]
	ldrb	r3, [r3, #12]	@ zero_extendqisi2
	cmp	r3, #83
	bne	.L27
	.loc 1 94 0 is_stmt 0 discriminator 1
	mov	r2, #33
	b	.L28
.L27:
	.loc 1 94 0 discriminator 2
	mov	r2, #34
.L28:
	.loc 1 94 0 discriminator 4
	ldr	r3, [fp, #-24]
	str	r2, [r3, #40]
	.loc 1 95 0 is_stmt 1 discriminator 4
	mov	r2, #4
	ldr	r3, .L31+4
	ldr	r3, [r1, r3]
	mov	r1, r3
	mov	r0, #0
	bl	CreateSize(PLT)
	str	r0, [fp, #-16]
	.loc 1 96 0 discriminator 4
	ldr	r3, [fp, #-24]
	add	r1, r3, #36
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #16
	ldr	r0, [fp, #-16]
	bl	Send(PLT)
	.loc 1 97 0 discriminator 4
	ldr	r3, [fp, #-12]
	and	r2, r3, #255
	ldr	r3, [fp, #-24]
	strb	r2, [r3, #83]
	.loc 1 98 0 discriminator 4
	ldr	r3, [fp, #-32]
	ldrb	r2, [r3, #12]	@ zero_extendqisi2
	ldr	r3, [fp, #-24]
	strb	r2, [r3, #84]
	.loc 1 99 0 discriminator 4
	ldr	r3, [fp, #-24]
	ldr	r0, [r3, #100]
	ldr	r3, [fp, #-24]
	add	r1, r3, #83
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #2
	bl	Send(PLT)
	.loc 1 100 0 discriminator 4
	ldr	r3, [fp, #-32]
	ldrb	r1, [r3, #12]	@ zero_extendqisi2
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	add	r3, r3, #62
	mov	r2, r1
	strb	r2, [r3]
	.loc 1 102 0 discriminator 4
	b	.L30
.L23:
	.loc 1 105 0
	ldr	r3, .L31+8
.LPIC5:
	add	r3, pc, r3
	mov	r0, r3
	bl	cputstr(PLT)
	.loc 1 106 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #48]
	mov	r1, #100
	mov	r0, r3
	bl	Delay(PLT)
	.loc 1 107 0
	bl	KQuit(PLT)
	.loc 1 108 0
	b	.L17
.L30:
	.loc 1 102 0
	nop
.L17:
.L29:
	.loc 1 110 0
	nop
.L9:
	.loc 1 112 0
	mov	r2, #0
	mov	r1, #0
	ldr	r0, [fp, #-28]
	bl	Reply(PLT)
	.loc 1 113 0
	nop
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L32:
	.align	2
.L31:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC4+8)
	.word	switch_coordinator(GOT)
	.word	.LC3-(.LPIC5+8)
	.cfi_endproc
.LFE1:
	.size	handle, .-handle
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	server_initialize, %function
server_initialize:
.LFB2:
	.loc 1 115 0
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
	.loc 1 115 0
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
.LFE2:
	.size	server_initialize, .-server_initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	server_work, %function
server_work:
.LFB3:
	.loc 1 115 0
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
	.loc 1 115 0
	ldr	r3, [fp, #-16]
	add	r1, r3, #108
	sub	r3, fp, #12
	mov	r2, #16
	mov	r0, r3
	bl	Receive(PLT)
	str	r0, [fp, #-8]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r2, r3, #108
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
.LFE3:
	.size	server_work, .-server_work
	.section	.rodata
	.align	2
.LC4:
	.ascii	"A0_model\000"
	.align	2
.LC5:
	.ascii	"Service %s created with tid %d.\012\015\000"
	.text
	.align	2
	.global	A0_model
	.syntax unified
	.arm
	.fpu softvfp
	.type	A0_model, %function
A0_model:
.LFB4:
	.loc 1 115 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #128
	.loc 1 115 0
	bl	Service(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L37
.LPIC6:
	add	r3, pc, r3
	mov	r1, r3
	ldr	r3, .L37+4
.LPIC7:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	sub	r3, fp, #128
	mov	r0, r3
	bl	server_initialize(PLT)
.L36:
	.loc 1 115 0 is_stmt 0 discriminator 2
	sub	r3, fp, #128
	mov	r0, r3
	bl	server_work(PLT)
	b	.L36
.L38:
	.align	2
.L37:
	.word	.LC4-(.LPIC6+8)
	.word	.LC5-(.LPIC7+8)
	.cfi_endproc
.LFE4:
	.size	A0_model, .-A0_model
.Letext0:
	.file 2 "src/syscall.h"
	.file 3 "src/tasks/A0/A0_model.h"
	.file 4 "src/tasks/A0/marklin_view.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x5ab
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF76
	.byte	0xc
	.4byte	.LASF77
	.4byte	.LASF78
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
	.4byte	.LASF7
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
	.uleb128 0x4
	.4byte	.LASF8
	.byte	0x1
	.4byte	0x62
	.byte	0x3
	.byte	0x8
	.4byte	0x8c
	.uleb128 0x5
	.4byte	.LASF9
	.byte	0
	.uleb128 0x5
	.4byte	.LASF10
	.byte	0x1
	.uleb128 0x5
	.4byte	.LASF11
	.byte	0x2
	.byte	0
	.uleb128 0x6
	.4byte	.LASF8
	.byte	0x3
	.byte	0xc
	.4byte	0x69
	.uleb128 0x4
	.4byte	.LASF12
	.byte	0x1
	.4byte	0x62
	.byte	0x3
	.byte	0xe
	.4byte	0xc6
	.uleb128 0x5
	.4byte	.LASF13
	.byte	0
	.uleb128 0x5
	.4byte	.LASF14
	.byte	0x1
	.uleb128 0x5
	.4byte	.LASF15
	.byte	0x2
	.uleb128 0x5
	.4byte	.LASF16
	.byte	0x3
	.uleb128 0x5
	.4byte	.LASF17
	.byte	0x4
	.byte	0
	.uleb128 0x6
	.4byte	.LASF12
	.byte	0x3
	.byte	0x14
	.4byte	0x97
	.uleb128 0x7
	.4byte	.LASF19
	.byte	0x1
	.byte	0x3
	.byte	0x19
	.4byte	0xea
	.uleb128 0x8
	.ascii	"val\000"
	.byte	0x3
	.byte	0x1a
	.4byte	0xea
	.byte	0
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF18
	.uleb128 0x7
	.4byte	.LASF20
	.byte	0xa
	.byte	0x3
	.byte	0x1c
	.4byte	0x10a
	.uleb128 0x9
	.4byte	.LASF21
	.byte	0x3
	.byte	0x1d
	.4byte	0x10a
	.byte	0
	.byte	0
	.uleb128 0xa
	.4byte	0xea
	.4byte	0x11a
	.uleb128 0xb
	.4byte	0x11a
	.byte	0x9
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF22
	.uleb128 0x7
	.4byte	.LASF23
	.byte	0x8
	.byte	0x3
	.byte	0x22
	.4byte	0x146
	.uleb128 0x9
	.4byte	.LASF24
	.byte	0x3
	.byte	0x23
	.4byte	0x2c
	.byte	0
	.uleb128 0x9
	.4byte	.LASF25
	.byte	0x3
	.byte	0x24
	.4byte	0x2c
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.4byte	.LASF26
	.byte	0x4
	.byte	0x3
	.byte	0x26
	.4byte	0x15f
	.uleb128 0x9
	.4byte	.LASF24
	.byte	0x3
	.byte	0x27
	.4byte	0x2c
	.byte	0
	.byte	0
	.uleb128 0x7
	.4byte	.LASF27
	.byte	0x4
	.byte	0x3
	.byte	0x29
	.4byte	0x178
	.uleb128 0x9
	.4byte	.LASF24
	.byte	0x3
	.byte	0x2a
	.4byte	0x2c
	.byte	0
	.byte	0
	.uleb128 0x7
	.4byte	.LASF28
	.byte	0x8
	.byte	0x3
	.byte	0x2c
	.4byte	0x19d
	.uleb128 0x9
	.4byte	.LASF29
	.byte	0x3
	.byte	0x2d
	.4byte	0x2c
	.byte	0
	.uleb128 0x9
	.4byte	.LASF30
	.byte	0x3
	.byte	0x2e
	.4byte	0xea
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.4byte	.LASF31
	.byte	0
	.byte	0x3
	.byte	0x30
	.4byte	0x1b6
	.uleb128 0x9
	.4byte	.LASF32
	.byte	0x3
	.byte	0x31
	.4byte	0x1b6
	.byte	0
	.byte	0
	.uleb128 0xa
	.4byte	0xea
	.4byte	0x1c5
	.uleb128 0xc
	.4byte	0x11a
	.byte	0
	.uleb128 0xd
	.byte	0x8
	.byte	0x3
	.byte	0x21
	.4byte	0x205
	.uleb128 0xe
	.4byte	.LASF25
	.byte	0x3
	.byte	0x25
	.4byte	0x121
	.uleb128 0xe
	.4byte	.LASF33
	.byte	0x3
	.byte	0x28
	.4byte	0x146
	.uleb128 0xe
	.4byte	.LASF34
	.byte	0x3
	.byte	0x2b
	.4byte	0x15f
	.uleb128 0xe
	.4byte	.LASF35
	.byte	0x3
	.byte	0x2f
	.4byte	0x178
	.uleb128 0xe
	.4byte	.LASF36
	.byte	0x3
	.byte	0x32
	.4byte	0x19d
	.byte	0
	.uleb128 0x7
	.4byte	.LASF37
	.byte	0xc
	.byte	0x3
	.byte	0x1f
	.4byte	0x22a
	.uleb128 0x9
	.4byte	.LASF38
	.byte	0x3
	.byte	0x20
	.4byte	0xc6
	.byte	0
	.uleb128 0x9
	.4byte	.LASF39
	.byte	0x3
	.byte	0x33
	.4byte	0x1c5
	.byte	0x4
	.byte	0
	.uleb128 0xd
	.byte	0xc
	.byte	0x3
	.byte	0x18
	.4byte	0x254
	.uleb128 0xe
	.4byte	.LASF40
	.byte	0x3
	.byte	0x1b
	.4byte	0xd1
	.uleb128 0xe
	.4byte	.LASF41
	.byte	0x3
	.byte	0x1e
	.4byte	0xf1
	.uleb128 0xe
	.4byte	.LASF42
	.byte	0x3
	.byte	0x34
	.4byte	0x205
	.byte	0
	.uleb128 0x7
	.4byte	.LASF43
	.byte	0x10
	.byte	0x3
	.byte	0x16
	.4byte	0x273
	.uleb128 0x9
	.4byte	.LASF44
	.byte	0x3
	.byte	0x17
	.4byte	0x8c
	.byte	0
	.uleb128 0xf
	.4byte	0x22a
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.4byte	.LASF45
	.byte	0x1
	.4byte	0x62
	.byte	0x4
	.byte	0x4
	.4byte	0x296
	.uleb128 0x5
	.4byte	.LASF46
	.byte	0
	.uleb128 0x5
	.4byte	.LASF47
	.byte	0x1
	.uleb128 0x5
	.4byte	.LASF48
	.byte	0x2
	.byte	0
	.uleb128 0x6
	.4byte	.LASF45
	.byte	0x4
	.byte	0x8
	.4byte	0x273
	.uleb128 0x7
	.4byte	.LASF49
	.byte	0x8
	.byte	0x4
	.byte	0xd
	.4byte	0x2c6
	.uleb128 0x9
	.4byte	.LASF24
	.byte	0x4
	.byte	0xe
	.4byte	0x2c
	.byte	0
	.uleb128 0x9
	.4byte	.LASF25
	.byte	0x4
	.byte	0xf
	.4byte	0x2c
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.4byte	.LASF50
	.byte	0x4
	.byte	0x4
	.byte	0x11
	.4byte	0x2df
	.uleb128 0x9
	.4byte	.LASF24
	.byte	0x4
	.byte	0x12
	.4byte	0x2c
	.byte	0
	.byte	0
	.uleb128 0x7
	.4byte	.LASF51
	.byte	0x4
	.byte	0x4
	.byte	0x14
	.4byte	0x2f8
	.uleb128 0x9
	.4byte	.LASF24
	.byte	0x4
	.byte	0x15
	.4byte	0x2c
	.byte	0
	.byte	0
	.uleb128 0xd
	.byte	0x8
	.byte	0x4
	.byte	0xc
	.4byte	0x322
	.uleb128 0xe
	.4byte	.LASF25
	.byte	0x4
	.byte	0x10
	.4byte	0x2a1
	.uleb128 0xe
	.4byte	.LASF33
	.byte	0x4
	.byte	0x13
	.4byte	0x2c6
	.uleb128 0xe
	.4byte	.LASF34
	.byte	0x4
	.byte	0x16
	.4byte	0x2df
	.byte	0
	.uleb128 0x7
	.4byte	.LASF52
	.byte	0xc
	.byte	0x4
	.byte	0xa
	.4byte	0x347
	.uleb128 0x9
	.4byte	.LASF38
	.byte	0x4
	.byte	0xb
	.4byte	0x296
	.byte	0
	.uleb128 0x9
	.4byte	.LASF39
	.byte	0x4
	.byte	0x17
	.4byte	0x2f8
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.4byte	.LASF53
	.byte	0x10
	.byte	0x4
	.byte	0x1a
	.4byte	0x384
	.uleb128 0x9
	.4byte	.LASF29
	.byte	0x4
	.byte	0x1b
	.4byte	0x2c
	.byte	0
	.uleb128 0x9
	.4byte	.LASF30
	.byte	0x4
	.byte	0x1c
	.4byte	0x2c
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF54
	.byte	0x4
	.byte	0x1d
	.4byte	0x2c
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF55
	.byte	0x4
	.byte	0x1e
	.4byte	0x2c
	.byte	0xc
	.byte	0
	.uleb128 0x7
	.4byte	.LASF56
	.byte	0x6c
	.byte	0x1
	.byte	0x6
	.4byte	0x421
	.uleb128 0x9
	.4byte	.LASF57
	.byte	0x1
	.byte	0x7
	.4byte	0x2c
	.byte	0
	.uleb128 0x9
	.4byte	.LASF58
	.byte	0x1
	.byte	0x8
	.4byte	0x2c
	.byte	0x4
	.uleb128 0x8
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x9
	.4byte	0x254
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF59
	.byte	0x1
	.byte	0xa
	.4byte	0x322
	.byte	0x18
	.uleb128 0x9
	.4byte	.LASF60
	.byte	0x1
	.byte	0xb
	.4byte	0x347
	.byte	0x24
	.uleb128 0x9
	.4byte	.LASF61
	.byte	0x1
	.byte	0xc
	.4byte	0x10a
	.byte	0x34
	.uleb128 0x9
	.4byte	.LASF62
	.byte	0x1
	.byte	0xd
	.4byte	0x421
	.byte	0x3e
	.uleb128 0x9
	.4byte	.LASF63
	.byte	0x1
	.byte	0xe
	.4byte	0x431
	.byte	0x53
	.uleb128 0x9
	.4byte	.LASF64
	.byte	0x1
	.byte	0xf
	.4byte	0x2c
	.byte	0x5c
	.uleb128 0x9
	.4byte	.LASF65
	.byte	0x1
	.byte	0x10
	.4byte	0x2c
	.byte	0x60
	.uleb128 0x9
	.4byte	.LASF66
	.byte	0x1
	.byte	0x11
	.4byte	0x2c
	.byte	0x64
	.uleb128 0x9
	.4byte	.LASF67
	.byte	0x1
	.byte	0x12
	.4byte	0x2c
	.byte	0x68
	.byte	0
	.uleb128 0xa
	.4byte	0xea
	.4byte	0x431
	.uleb128 0xb
	.4byte	0x11a
	.byte	0x14
	.byte	0
	.uleb128 0xa
	.4byte	0xea
	.4byte	0x441
	.uleb128 0xb
	.4byte	0x11a
	.byte	0x7
	.byte	0
	.uleb128 0x7
	.4byte	.LASF68
	.byte	0x7c
	.byte	0x1
	.byte	0x73
	.4byte	0x466
	.uleb128 0x9
	.4byte	.LASF69
	.byte	0x1
	.byte	0x73
	.4byte	0x384
	.byte	0
	.uleb128 0x8
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x73
	.4byte	0x254
	.byte	0x6c
	.byte	0
	.uleb128 0x10
	.4byte	.LASF79
	.byte	0x1
	.byte	0x73
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x48b
	.uleb128 0x11
	.4byte	.LASF21
	.byte	0x1
	.byte	0x73
	.4byte	0x441
	.uleb128 0x3
	.byte	0x91
	.sleb128 -132
	.byte	0
	.uleb128 0x12
	.4byte	.LASF71
	.byte	0x1
	.byte	0x73
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4cb
	.uleb128 0x13
	.4byte	.LASF21
	.byte	0x1
	.byte	0x73
	.4byte	0x4cb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x73
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x11
	.4byte	.LASF70
	.byte	0x1
	.byte	0x73
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x15
	.byte	0x4
	.4byte	0x441
	.uleb128 0x12
	.4byte	.LASF72
	.byte	0x1
	.byte	0x73
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4f5
	.uleb128 0x13
	.4byte	.LASF21
	.byte	0x1
	.byte	0x73
	.4byte	0x4cb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x12
	.4byte	.LASF73
	.byte	0x1
	.byte	0x2d
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x576
	.uleb128 0x13
	.4byte	.LASF21
	.byte	0x1
	.byte	0x2d
	.4byte	0x576
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x16
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x2d
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x16
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x2d
	.4byte	0x57c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x13
	.4byte	.LASF74
	.byte	0x1
	.byte	0x2d
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x14
	.ascii	"i\000"
	.byte	0x1
	.byte	0x30
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x11
	.4byte	.LASF58
	.byte	0x1
	.byte	0x30
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.4byte	.LASF75
	.byte	0x1
	.byte	0x30
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x17
	.4byte	.LASF80
	.byte	0x1
	.byte	0x54
	.4byte	.L24
	.byte	0
	.uleb128 0x15
	.byte	0x4
	.4byte	0x384
	.uleb128 0x15
	.byte	0x4
	.4byte	0x254
	.uleb128 0x18
	.4byte	.LASF81
	.byte	0x1
	.byte	0x15
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x13
	.4byte	.LASF21
	.byte	0x1
	.byte	0x15
	.4byte	0x576
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.ascii	"i\000"
	.byte	0x1
	.byte	0x17
	.4byte	0x2c
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
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0xd
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x18
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
.LASF79:
	.ascii	"A0_model\000"
.LASF49:
	.ascii	"SetSpeed\000"
.LASF11:
	.ascii	"CODE_Command\000"
.LASF24:
	.ascii	"train\000"
.LASF20:
	.ascii	"MarklinBytes\000"
.LASF62:
	.ascii	"switchstates\000"
.LASF51:
	.ascii	"Headlights\000"
.LASF10:
	.ascii	"CODE_MarklinBytes\000"
.LASF57:
	.ascii	"caller\000"
.LASF30:
	.ascii	"state\000"
.LASF72:
	.ascii	"server_initialize\000"
.LASF47:
	.ascii	"TYPE_Reverse\000"
.LASF8:
	.ascii	"A0_model_message_code\000"
.LASF13:
	.ascii	"A0TYPE_SetSpeed\000"
.LASF53:
	.ascii	"switch_coordinator_args\000"
.LASF61:
	.ascii	"sensors\000"
.LASF41:
	.ascii	"marklin\000"
.LASF27:
	.ascii	"A0Headlights\000"
.LASF5:
	.ascii	"TASK_SIZE_TINY\000"
.LASF26:
	.ascii	"A0Reverse\000"
.LASF71:
	.ascii	"server_work\000"
.LASF75:
	.ascii	"index\000"
.LASF54:
	.ascii	"out_tid\000"
.LASF14:
	.ascii	"A0TYPE_Reverse\000"
.LASF2:
	.ascii	"TASK_SIZE_BIG\000"
.LASF50:
	.ascii	"Reverse\000"
.LASF70:
	.ascii	"datalen\000"
.LASF35:
	.ascii	"flip\000"
.LASF46:
	.ascii	"TYPE_SetSpeed\000"
.LASF60:
	.ascii	"flip_out\000"
.LASF16:
	.ascii	"A0TYPE_SwitchFlip\000"
.LASF23:
	.ascii	"A0SetSpeed\000"
.LASF36:
	.ascii	"quit\000"
.LASF59:
	.ascii	"train_out\000"
.LASF56:
	.ascii	"Data\000"
.LASF52:
	.ascii	"Train_Command\000"
.LASF67:
	.ascii	"sensor_tid\000"
.LASF12:
	.ascii	"A0_Command_type\000"
.LASF55:
	.ascii	"clock_tid\000"
.LASF6:
	.ascii	"unsigned char\000"
.LASF48:
	.ascii	"TYPE_Headlights\000"
.LASF63:
	.ascii	"space\000"
.LASF38:
	.ascii	"type\000"
.LASF37:
	.ascii	"A0Command\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF39:
	.ascii	"args\000"
.LASF25:
	.ascii	"speed\000"
.LASF44:
	.ascii	"code\000"
.LASF4:
	.ascii	"TASK_SIZE_SMALL\000"
.LASF77:
	.ascii	"src/tasks/A0/A0_model.c\000"
.LASF78:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF69:
	.ascii	"user\000"
.LASF15:
	.ascii	"A0TYPE_Headlights\000"
.LASF74:
	.ascii	"msg_size\000"
.LASF18:
	.ascii	"char\000"
.LASF31:
	.ascii	"A0Quit\000"
.LASF80:
	.ascii	"SendTrain\000"
.LASF32:
	.ascii	"_unused\000"
.LASF21:
	.ascii	"data\000"
.LASF66:
	.ascii	"flip_tid\000"
.LASF7:
	.ascii	"TaskSize\000"
.LASF81:
	.ascii	"initialize\000"
.LASF33:
	.ascii	"reverse\000"
.LASF73:
	.ascii	"handle\000"
.LASF40:
	.ascii	"echo\000"
.LASF19:
	.ascii	"COM2byte\000"
.LASF58:
	.ascii	"child_tid\000"
.LASF68:
	.ascii	"server_Data\000"
.LASF64:
	.ascii	"marklin_tid\000"
.LASF3:
	.ascii	"TASK_SIZE_NORMAL\000"
.LASF22:
	.ascii	"sizetype\000"
.LASF43:
	.ascii	"A0_model_message\000"
.LASF1:
	.ascii	"TASK_SIZE_GIANT\000"
.LASF76:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF29:
	.ascii	"number\000"
.LASF28:
	.ascii	"A0SwitchFlip\000"
.LASF65:
	.ascii	"echo_tid\000"
.LASF45:
	.ascii	"Train_Command_Type\000"
.LASF17:
	.ascii	"A0TYPE_Quit\000"
.LASF9:
	.ascii	"CODE_COM2byte\000"
.LASF42:
	.ascii	"command\000"
.LASF34:
	.ascii	"lights\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
