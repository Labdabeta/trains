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
	.file	"syscall.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	Exit
	.syntax unified
	.arm
	.fpu softvfp
	.type	Exit, %function
Exit:
.LFB0:
	.file 1 "src/syscall.c"
	.loc 1 16 0
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
	.loc 1 17 0
	mov	r3, #0
	mov	r2, #0
	mov	r1, #0
	mov	r0, #0
	bl	asm_callSystemInterrupt(PLT)
	.loc 1 18 0
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
	.size	Exit, .-Exit
	.align	2
	.global	CreateSize
	.syntax unified
	.arm
	.fpu softvfp
	.type	CreateSize, %function
CreateSize:
.LFB1:
	.loc 1 21 0
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
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	mov	r3, r2
	strb	r3, [fp, #-13]
	.loc 1 22 0
	ldr	r1, [fp, #-12]
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	mov	r3, #3
	ldr	r0, [fp, #-8]
	bl	asm_callSystemInterrupt(PLT)
	mov	r3, r0
	.loc 1 23 0
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
.LFE1:
	.size	CreateSize, .-CreateSize
	.align	2
	.global	Create
	.syntax unified
	.arm
	.fpu softvfp
	.type	Create, %function
Create:
.LFB2:
	.loc 1 26 0
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
	str	r1, [fp, #-12]
	.loc 1 27 0
	mov	r2, #2
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	CreateSize(PLT)
	mov	r3, r0
	.loc 1 28 0
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
	.size	Create, .-Create
	.align	2
	.global	MyTid
	.syntax unified
	.arm
	.fpu softvfp
	.type	MyTid, %function
MyTid:
.LFB3:
	.loc 1 31 0
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
	.loc 1 32 0
	mov	r3, #1
	mov	r2, #0
	mov	r1, #0
	mov	r0, #0
	bl	asm_callSystemInterrupt(PLT)
	mov	r3, r0
	.loc 1 33 0
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
	.size	MyTid, .-MyTid
	.align	2
	.global	MyParentTid
	.syntax unified
	.arm
	.fpu softvfp
	.type	MyParentTid, %function
MyParentTid:
.LFB4:
	.loc 1 36 0
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
	.loc 1 37 0
	mov	r3, #2
	mov	r2, #0
	mov	r1, #0
	mov	r0, #0
	bl	asm_callSystemInterrupt(PLT)
	mov	r3, r0
	.loc 1 38 0
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
	.size	MyParentTid, .-MyParentTid
	.align	2
	.global	Pass
	.syntax unified
	.arm
	.fpu softvfp
	.type	Pass, %function
Pass:
.LFB5:
	.loc 1 41 0
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
	.loc 1 42 0
	mov	r3, #4
	mov	r2, #0
	mov	r1, #0
	mov	r0, #0
	bl	asm_callSystemInterrupt(PLT)
	.loc 1 43 0
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
	.size	Pass, .-Pass
	.align	2
	.global	SendBuffer
	.syntax unified
	.arm
	.fpu softvfp
	.type	SendBuffer, %function
SendBuffer:
.LFB6:
	.loc 1 46 0
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
	.loc 1 47 0
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-24]
	mov	r3, #5
	ldr	r0, [fp, #-16]
	bl	asm_callSystemInterrupt(PLT)
	str	r0, [fp, #-8]
	.loc 1 49 0
	ldr	r3, [fp, #-8]
	cmn	r3, #2
	bne	.L12
	.loc 1 50 0
	mvn	r3, #1
	b	.L13
.L12:
	.loc 1 52 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L14
	.loc 1 53 0
	mvn	r3, #0
	b	.L13
.L14:
	.loc 1 55 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
.L13:
	.loc 1 56 0
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
.LFE6:
	.size	SendBuffer, .-SendBuffer
	.align	2
	.global	Send
	.syntax unified
	.arm
	.fpu softvfp
	.type	Send, %function
Send:
.LFB7:
	.loc 1 59 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 40
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
	.loc 1 63 0
	ldr	r2, [fp, #-40]
	sub	r3, fp, #16
	ldr	r1, [fp, #-36]
	mov	r0, r3
	bl	loadBuffer(PLT)
	.loc 1 64 0
	ldr	r2, [fp, #4]
	sub	r3, fp, #28
	ldr	r1, [fp, #-44]
	mov	r0, r3
	bl	loadBuffer(PLT)
	.loc 1 66 0
	sub	r2, fp, #28
	sub	r3, fp, #16
	mov	r1, r3
	ldr	r0, [fp, #-32]
	bl	SendBuffer(PLT)
	mov	r3, r0
	.loc 1 67 0
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
.LFE7:
	.size	Send, .-Send
	.align	2
	.global	Share
	.syntax unified
	.arm
	.fpu softvfp
	.type	Share, %function
Share:
.LFB8:
	.loc 1 70 0
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
	str	r1, [fp, #-20]
	.loc 1 71 0
	mov	r3, #0
	str	r3, [fp, #-8]
	.loc 1 72 0
	ldr	r1, [fp, #-20]
	sub	r2, fp, #8
	mov	r3, #8
	ldr	r0, [fp, #-16]
	bl	asm_callSystemInterrupt(PLT)
	.loc 1 73 0
	ldr	r3, [fp, #-8]
	.loc 1 74 0
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
.LFE8:
	.size	Share, .-Share
	.align	2
	.global	ReceiveBuffer
	.syntax unified
	.arm
	.fpu softvfp
	.type	ReceiveBuffer, %function
ReceiveBuffer:
.LFB9:
	.loc 1 77 0
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
	str	r1, [fp, #-12]
	.loc 1 78 0
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-12]
	mov	r3, #6
	mov	r2, #0
	bl	asm_callSystemInterrupt(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L20
	.loc 1 79 0
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-12]
	mov	r3, #6
	mov	r2, #0
	bl	asm_callSystemInterrupt(PLT)
.L20:
	.loc 1 82 0
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L21
	.loc 1 83 0
	mvn	r3, #0
	b	.L22
.L21:
	.loc 1 85 0
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #4]
.L22:
	.loc 1 86 0
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
.LFE9:
	.size	ReceiveBuffer, .-ReceiveBuffer
	.align	2
	.global	Receive
	.syntax unified
	.arm
	.fpu softvfp
	.type	Receive, %function
Receive:
.LFB10:
	.loc 1 89 0
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
	.loc 1 92 0
	ldr	r2, [fp, #-32]
	sub	r3, fp, #16
	ldr	r1, [fp, #-28]
	mov	r0, r3
	bl	loadBuffer(PLT)
	.loc 1 94 0
	sub	r3, fp, #16
	mov	r1, r3
	ldr	r0, [fp, #-24]
	bl	ReceiveBuffer(PLT)
	mov	r3, r0
	.loc 1 95 0
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
.LFE10:
	.size	Receive, .-Receive
	.align	2
	.global	Obtain
	.syntax unified
	.arm
	.fpu softvfp
	.type	Obtain, %function
Obtain:
.LFB11:
	.loc 1 98 0
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
	.loc 1 99 0
	mov	r3, #0
	str	r3, [fp, #-8]
	.loc 1 100 0
	ldr	r0, [fp, #-16]
	sub	r1, fp, #8
	mov	r3, #9
	mov	r2, #0
	bl	asm_callSystemInterrupt(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L26
	.loc 1 101 0
	ldr	r0, [fp, #-16]
	sub	r1, fp, #8
	mov	r3, #9
	mov	r2, #0
	bl	asm_callSystemInterrupt(PLT)
.L26:
	.loc 1 103 0
	ldr	r3, [fp, #-8]
	.loc 1 104 0
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
.LFE11:
	.size	Obtain, .-Obtain
	.align	2
	.global	ReplyBuffer
	.syntax unified
	.arm
	.fpu softvfp
	.type	ReplyBuffer, %function
ReplyBuffer:
.LFB12:
	.loc 1 107 0
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
	str	r1, [fp, #-12]
	.loc 1 108 0
	ldr	r1, [fp, #-12]
	mov	r3, #7
	mov	r2, #0
	ldr	r0, [fp, #-8]
	bl	asm_callSystemInterrupt(PLT)
	mov	r3, r0
	.loc 1 109 0
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
.LFE12:
	.size	ReplyBuffer, .-ReplyBuffer
	.align	2
	.global	Reply
	.syntax unified
	.arm
	.fpu softvfp
	.type	Reply, %function
Reply:
.LFB13:
	.loc 1 112 0
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
	.loc 1 115 0
	ldr	r2, [fp, #-32]
	sub	r3, fp, #16
	ldr	r1, [fp, #-28]
	mov	r0, r3
	bl	loadBuffer(PLT)
	.loc 1 117 0
	sub	r3, fp, #16
	mov	r1, r3
	ldr	r0, [fp, #-24]
	bl	ReplyBuffer(PLT)
	mov	r3, r0
	.loc 1 118 0
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
.LFE13:
	.size	Reply, .-Reply
	.align	2
	.global	Respond
	.syntax unified
	.arm
	.fpu softvfp
	.type	Respond, %function
Respond:
.LFB14:
	.loc 1 121 0
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
	str	r1, [fp, #-12]
	.loc 1 122 0
	ldr	r1, [fp, #-12]
	mov	r3, #10
	mov	r2, #0
	ldr	r0, [fp, #-8]
	bl	asm_callSystemInterrupt(PLT)
	.loc 1 123 0
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
.LFE14:
	.size	Respond, .-Respond
	.align	2
	.global	RegisterAs
	.syntax unified
	.arm
	.fpu softvfp
	.type	RegisterAs, %function
RegisterAs:
.LFB15:
	.loc 1 126 0
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
	.loc 1 127 0
	ldr	r1, [fp, #-8]
	mov	r0, #13
	bl	sendRegisterAs(PLT)
	mov	r3, r0
	.loc 1 128 0
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
.LFE15:
	.size	RegisterAs, .-RegisterAs
	.align	2
	.global	WhoIs
	.syntax unified
	.arm
	.fpu softvfp
	.type	WhoIs, %function
WhoIs:
.LFB16:
	.loc 1 131 0
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
	.loc 1 132 0
	ldr	r1, [fp, #-8]
	mov	r0, #13
	bl	sendWhoIs(PLT)
	mov	r3, r0
	.loc 1 133 0
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
.LFE16:
	.size	WhoIs, .-WhoIs
	.align	2
	.global	AwaitEvent
	.syntax unified
	.arm
	.fpu softvfp
	.type	AwaitEvent, %function
AwaitEvent:
.LFB17:
	.loc 1 136 0
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
	.loc 1 137 0
	ldrb	r0, [fp, #-5]	@ zero_extendqisi2
	mov	r3, #11
	mov	r2, #0
	mov	r1, #0
	bl	asm_callSystemInterrupt(PLT)
	.loc 1 138 0
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
.LFE17:
	.size	AwaitEvent, .-AwaitEvent
	.align	2
	.global	AwaitTransmission
	.syntax unified
	.arm
	.fpu softvfp
	.type	AwaitTransmission, %function
AwaitTransmission:
.LFB18:
	.loc 1 141 0
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
	mov	r3, r0
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	strb	r3, [fp, #-5]
	.loc 1 142 0
	ldrb	r0, [fp, #-5]	@ zero_extendqisi2
	ldr	r2, [fp, #-16]
	mov	r3, #12
	ldr	r1, [fp, #-12]
	bl	asm_callSystemInterrupt(PLT)
	.loc 1 143 0
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
.LFE18:
	.size	AwaitTransmission, .-AwaitTransmission
	.align	2
	.global	AwaitReceive
	.syntax unified
	.arm
	.fpu softvfp
	.type	AwaitReceive, %function
AwaitReceive:
.LFB19:
	.loc 1 146 0
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
	str	r1, [fp, #-12]
	strb	r3, [fp, #-5]
	.loc 1 147 0
	ldrb	r0, [fp, #-5]	@ zero_extendqisi2
	ldr	r2, [fp, #-12]
	mov	r3, #13
	mov	r1, #0
	bl	asm_callSystemInterrupt(PLT)
	mov	r3, r0
	.loc 1 148 0
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
.LFE19:
	.size	AwaitReceive, .-AwaitReceive
	.align	2
	.global	Time
	.syntax unified
	.arm
	.fpu softvfp
	.type	Time, %function
Time:
.LFB20:
	.loc 1 151 0
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
	.loc 1 152 0
	ldr	r0, [fp, #-8]
	bl	sendGetTime(PLT)
	mov	r3, r0
	.loc 1 153 0
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
.LFE20:
	.size	Time, .-Time
	.align	2
	.global	Delay
	.syntax unified
	.arm
	.fpu softvfp
	.type	Delay, %function
Delay:
.LFB21:
	.loc 1 156 0
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
	str	r1, [fp, #-12]
	.loc 1 157 0
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	ble	.L45
	.loc 1 158 0
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	sendDelay(PLT)
.L45:
	.loc 1 159 0
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
.LFE21:
	.size	Delay, .-Delay
	.align	2
	.global	DelayUntil
	.syntax unified
	.arm
	.fpu softvfp
	.type	DelayUntil, %function
DelayUntil:
.LFB22:
	.loc 1 162 0
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
	str	r1, [fp, #-12]
	.loc 1 163 0
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	ble	.L48
	.loc 1 164 0
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	sendDelayUntil(PLT)
.L48:
	.loc 1 165 0
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
.LFE22:
	.size	DelayUntil, .-DelayUntil
	.align	2
	.global	UTime
	.syntax unified
	.arm
	.fpu softvfp
	.type	UTime, %function
UTime:
.LFB23:
	.loc 1 168 0
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
	sub	sp, sp, #20
	mov	r3, r0
	strb	r3, [fp, #-21]
	.loc 1 169 0
	mov	r3, #0
	mov	r4, #0
	str	r3, [fp, #-20]
	str	r4, [fp, #-16]
	.loc 1 170 0
	sub	r0, fp, #20
	ldrb	r1, [fp, #-21]	@ zero_extendqisi2
	mov	r3, #14
	mov	r2, #0
	bl	asm_callSystemInterrupt(PLT)
	.loc 1 171 0
	sub	r4, fp, #20
	ldmia	r4, {r3-r4}
	.loc 1 172 0
	mov	r0, r3
	mov	r1, r4
	sub	sp, fp, #8
	.cfi_def_cfa 13, 12
	@ sp needed
	pop	{r4, fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE23:
	.size	UTime, .-UTime
	.align	2
	.global	Getc
	.syntax unified
	.arm
	.fpu softvfp
	.type	Getc, %function
Getc:
.LFB24:
	.loc 1 175 0
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
	str	r1, [fp, #-12]
	.loc 1 176 0
	ldr	r3, [fp, #-12]
	cmp	r3, #1
	bne	.L52
	.loc 1 177 0
	ldr	r0, [fp, #-8]
	bl	sendTinGetc(PLT)
	mov	r3, r0
	b	.L53
.L52:
	.loc 1 178 0
	ldr	r0, [fp, #-8]
	bl	sendCinGetc(PLT)
	mov	r3, r0
.L53:
	.loc 1 179 0
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
.LFE24:
	.size	Getc, .-Getc
	.align	2
	.global	Putc
	.syntax unified
	.arm
	.fpu softvfp
	.type	Putc, %function
Putc:
.LFB25:
	.loc 1 182 0
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
	mov	r3, r2
	strb	r3, [fp, #-21]
	.loc 1 183 0
	ldr	r3, [fp, #-20]
	cmp	r3, #1
	bne	.L55
	.loc 1 184 0
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, [fp, #-16]
	bl	sendToutByte(PLT)
	.loc 1 185 0
	mov	r3, #0
	b	.L57
.L55:
	.loc 1 188 0
	ldrb	r3, [fp, #-21]
	strb	r3, [fp, #-8]
	.loc 1 189 0
	mov	r3, #0
	strb	r3, [fp, #-7]
	.loc 1 190 0
	sub	r3, fp, #8
	mov	r1, r3
	ldr	r0, [fp, #-16]
	bl	sendCoutPutstr(PLT)
	.loc 1 191 0
	mov	r3, #0
.L57:
	.loc 1 192 0 discriminator 1
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
.LFE25:
	.size	Putc, .-Putc
	.align	2
	.global	Putstr
	.syntax unified
	.arm
	.fpu softvfp
	.type	Putstr, %function
Putstr:
.LFB26:
	.loc 1 195 0
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
	.loc 1 196 0
	ldr	r3, [fp, #-20]
	cmp	r3, #1
	bne	.L59
.LBB2:
	.loc 1 198 0
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-8]
	b	.L60
.L62:
	.loc 1 199 0 discriminator 4
	ldr	r3, [fp, #-8]
	ldrb	r1, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r0, [fp, #-16]
	bl	sendToutBytePair(PLT)
	.loc 1 198 0 discriminator 4
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	str	r3, [fp, #-8]
.L60:
	.loc 1 198 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L61
	.loc 1 198 0 discriminator 3
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L62
.L61:
	.loc 1 200 0 is_stmt 1
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L63
	.loc 1 201 0
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, [fp, #-16]
	bl	sendToutByte(PLT)
.L63:
	.loc 1 202 0
	mov	r3, #0
	b	.L64
.L59:
.LBE2:
	.loc 1 204 0
	ldr	r1, [fp, #-24]
	ldr	r0, [fp, #-16]
	bl	sendCoutPutstr(PLT)
	.loc 1 205 0
	mov	r3, #0
.L64:
	.loc 1 206 0
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
.LFE26:
	.size	Putstr, .-Putstr
	.align	2
	.global	Service
	.syntax unified
	.arm
	.fpu softvfp
	.type	Service, %function
Service:
.LFB27:
	.loc 1 209 0
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
	.loc 1 210 0
	mov	r3, #15
	mov	r2, #0
	mov	r1, #0
	mov	r0, #0
	bl	asm_callSystemInterrupt(PLT)
	.loc 1 211 0
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
.LFE27:
	.size	Service, .-Service
	.align	2
	.global	KQuit
	.syntax unified
	.arm
	.fpu softvfp
	.type	KQuit, %function
KQuit:
.LFB28:
	.loc 1 214 0
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
	.loc 1 215 0
	mov	r3, #16
	mov	r2, #0
	mov	r1, #0
	mov	r0, #0
	bl	asm_callSystemInterrupt(PLT)
	.loc 1 216 0
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
.LFE28:
	.size	KQuit, .-KQuit
.Letext0:
	.file 2 "src/util/data/buffer.h"
	.file 3 "src/syscall.h"
	.file 4 "src/kernel/handlers.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x939
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF146
	.byte	0xc
	.4byte	.LASF147
	.4byte	.LASF148
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF10
	.byte	0xc
	.byte	0x2
	.byte	0x5
	.4byte	0x56
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x2
	.byte	0x6
	.4byte	0x56
	.byte	0
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x2
	.byte	0x7
	.4byte	0x58
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x2
	.byte	0x8
	.4byte	0x5f
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x7
	.4byte	.LASF10
	.byte	0x2
	.byte	0x9
	.4byte	0x25
	.uleb128 0x8
	.4byte	.LASF11
	.byte	0x1
	.4byte	0xa0
	.byte	0x3
	.byte	0x8
	.4byte	0xa0
	.uleb128 0x9
	.4byte	.LASF4
	.byte	0
	.uleb128 0x9
	.4byte	.LASF5
	.byte	0x1
	.uleb128 0x9
	.4byte	.LASF6
	.byte	0x2
	.uleb128 0x9
	.4byte	.LASF7
	.byte	0x3
	.uleb128 0x9
	.4byte	.LASF8
	.byte	0x4
	.byte	0
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF9
	.uleb128 0x7
	.4byte	.LASF11
	.byte	0x3
	.byte	0xe
	.4byte	0x71
	.uleb128 0x8
	.4byte	.LASF12
	.byte	0x1
	.4byte	0xa0
	.byte	0x3
	.byte	0x11
	.4byte	0x243
	.uleb128 0x9
	.4byte	.LASF13
	.byte	0
	.uleb128 0x9
	.4byte	.LASF14
	.byte	0x1
	.uleb128 0x9
	.4byte	.LASF15
	.byte	0x2
	.uleb128 0x9
	.4byte	.LASF16
	.byte	0x3
	.uleb128 0x9
	.4byte	.LASF17
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF18
	.byte	0x5
	.uleb128 0x9
	.4byte	.LASF19
	.byte	0x6
	.uleb128 0x9
	.4byte	.LASF20
	.byte	0x7
	.uleb128 0x9
	.4byte	.LASF21
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF22
	.byte	0x9
	.uleb128 0x9
	.4byte	.LASF23
	.byte	0xa
	.uleb128 0x9
	.4byte	.LASF24
	.byte	0xb
	.uleb128 0x9
	.4byte	.LASF25
	.byte	0xc
	.uleb128 0x9
	.4byte	.LASF26
	.byte	0xd
	.uleb128 0x9
	.4byte	.LASF27
	.byte	0xe
	.uleb128 0x9
	.4byte	.LASF28
	.byte	0xf
	.uleb128 0x9
	.4byte	.LASF29
	.byte	0x10
	.uleb128 0x9
	.4byte	.LASF30
	.byte	0x11
	.uleb128 0x9
	.4byte	.LASF31
	.byte	0x12
	.uleb128 0x9
	.4byte	.LASF32
	.byte	0x13
	.uleb128 0x9
	.4byte	.LASF33
	.byte	0x14
	.uleb128 0x9
	.4byte	.LASF34
	.byte	0x15
	.uleb128 0x9
	.4byte	.LASF35
	.byte	0x16
	.uleb128 0x9
	.4byte	.LASF36
	.byte	0x17
	.uleb128 0x9
	.4byte	.LASF37
	.byte	0x18
	.uleb128 0x9
	.4byte	.LASF38
	.byte	0x19
	.uleb128 0x9
	.4byte	.LASF39
	.byte	0x1a
	.uleb128 0x9
	.4byte	.LASF40
	.byte	0x1b
	.uleb128 0x9
	.4byte	.LASF41
	.byte	0x1c
	.uleb128 0x9
	.4byte	.LASF42
	.byte	0x1d
	.uleb128 0x9
	.4byte	.LASF43
	.byte	0x1e
	.uleb128 0x9
	.4byte	.LASF44
	.byte	0x1f
	.uleb128 0x9
	.4byte	.LASF45
	.byte	0x20
	.uleb128 0x9
	.4byte	.LASF46
	.byte	0x21
	.uleb128 0x9
	.4byte	.LASF47
	.byte	0x22
	.uleb128 0x9
	.4byte	.LASF48
	.byte	0x23
	.uleb128 0x9
	.4byte	.LASF49
	.byte	0x24
	.uleb128 0x9
	.4byte	.LASF50
	.byte	0x25
	.uleb128 0x9
	.4byte	.LASF51
	.byte	0x26
	.uleb128 0x9
	.4byte	.LASF52
	.byte	0x27
	.uleb128 0x9
	.4byte	.LASF53
	.byte	0x28
	.uleb128 0x9
	.4byte	.LASF54
	.byte	0x29
	.uleb128 0x9
	.4byte	.LASF55
	.byte	0x2a
	.uleb128 0x9
	.4byte	.LASF56
	.byte	0x2b
	.uleb128 0x9
	.4byte	.LASF57
	.byte	0x2c
	.uleb128 0x9
	.4byte	.LASF58
	.byte	0x2d
	.uleb128 0x9
	.4byte	.LASF59
	.byte	0x2e
	.uleb128 0x9
	.4byte	.LASF60
	.byte	0x2f
	.uleb128 0x9
	.4byte	.LASF61
	.byte	0x30
	.uleb128 0x9
	.4byte	.LASF62
	.byte	0x31
	.uleb128 0x9
	.4byte	.LASF63
	.byte	0x32
	.uleb128 0x9
	.4byte	.LASF64
	.byte	0x33
	.uleb128 0x9
	.4byte	.LASF65
	.byte	0x34
	.uleb128 0x9
	.4byte	.LASF66
	.byte	0x35
	.uleb128 0x9
	.4byte	.LASF67
	.byte	0x36
	.uleb128 0x9
	.4byte	.LASF68
	.byte	0x37
	.uleb128 0x9
	.4byte	.LASF69
	.byte	0x38
	.uleb128 0x9
	.4byte	.LASF70
	.byte	0x39
	.uleb128 0x9
	.4byte	.LASF71
	.byte	0x3a
	.uleb128 0x9
	.4byte	.LASF72
	.byte	0x3b
	.uleb128 0x9
	.4byte	.LASF73
	.byte	0x3c
	.uleb128 0x9
	.4byte	.LASF74
	.byte	0x3d
	.uleb128 0x9
	.4byte	.LASF75
	.byte	0x3e
	.uleb128 0x9
	.4byte	.LASF76
	.byte	0x3f
	.byte	0
	.uleb128 0x7
	.4byte	.LASF12
	.byte	0x3
	.byte	0x28
	.4byte	0xb2
	.uleb128 0xa
	.4byte	.LASF77
	.byte	0x1
	.4byte	0xa0
	.byte	0x3
	.2byte	0x11a
	.4byte	0x27e
	.uleb128 0x9
	.4byte	.LASF78
	.byte	0
	.uleb128 0x9
	.4byte	.LASF79
	.byte	0x1
	.uleb128 0x9
	.4byte	.LASF80
	.byte	0x2
	.uleb128 0x9
	.4byte	.LASF81
	.byte	0x3
	.uleb128 0x9
	.4byte	.LASF82
	.byte	0x4
	.byte	0
	.uleb128 0xb
	.4byte	.LASF77
	.byte	0x3
	.2byte	0x120
	.4byte	0x24e
	.uleb128 0x8
	.4byte	.LASF83
	.byte	0x1
	.4byte	0xa0
	.byte	0x4
	.byte	0x9
	.4byte	0x301
	.uleb128 0x9
	.4byte	.LASF84
	.byte	0
	.uleb128 0x9
	.4byte	.LASF85
	.byte	0x1
	.uleb128 0x9
	.4byte	.LASF86
	.byte	0x2
	.uleb128 0x9
	.4byte	.LASF87
	.byte	0x3
	.uleb128 0x9
	.4byte	.LASF88
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF89
	.byte	0x5
	.uleb128 0x9
	.4byte	.LASF90
	.byte	0x6
	.uleb128 0x9
	.4byte	.LASF91
	.byte	0x7
	.uleb128 0x9
	.4byte	.LASF92
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF93
	.byte	0x9
	.uleb128 0x9
	.4byte	.LASF94
	.byte	0xa
	.uleb128 0x9
	.4byte	.LASF95
	.byte	0xb
	.uleb128 0x9
	.4byte	.LASF96
	.byte	0xc
	.uleb128 0x9
	.4byte	.LASF97
	.byte	0xd
	.uleb128 0x9
	.4byte	.LASF98
	.byte	0xe
	.uleb128 0x9
	.4byte	.LASF99
	.byte	0xf
	.uleb128 0x9
	.4byte	.LASF100
	.byte	0x10
	.byte	0
	.uleb128 0xc
	.4byte	.LASF101
	.byte	0x1
	.byte	0xd5
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF102
	.byte	0x1
	.byte	0xd0
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xd
	.4byte	.LASF105
	.byte	0x1
	.byte	0xc2
	.4byte	0x5f
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x37e
	.uleb128 0xe
	.ascii	"tid\000"
	.byte	0x1
	.byte	0xc2
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xf
	.4byte	.LASF103
	.byte	0x1
	.byte	0xc2
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xe
	.ascii	"str\000"
	.byte	0x1
	.byte	0xc2
	.4byte	0x37e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x10
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x11
	.ascii	"ch\000"
	.byte	0x1
	.byte	0xc5
	.4byte	0x37e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.4byte	0x384
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF104
	.uleb128 0xd
	.4byte	.LASF106
	.byte	0x1
	.byte	0xb5
	.4byte	0x5f
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3dc
	.uleb128 0xe
	.ascii	"tid\000"
	.byte	0x1
	.byte	0xb5
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xf
	.4byte	.LASF103
	.byte	0x1
	.byte	0xb5
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xe
	.ascii	"ch\000"
	.byte	0x1
	.byte	0xb5
	.4byte	0x384
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x11
	.ascii	"msg\000"
	.byte	0x1
	.byte	0xbb
	.4byte	0x3dc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x13
	.4byte	0x384
	.4byte	0x3ec
	.uleb128 0x14
	.4byte	0x3ec
	.byte	0x1
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF107
	.uleb128 0xd
	.4byte	.LASF108
	.byte	0x1
	.byte	0xae
	.4byte	0x5f
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x429
	.uleb128 0xe
	.ascii	"tid\000"
	.byte	0x1
	.byte	0xae
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xf
	.4byte	.LASF103
	.byte	0x1
	.byte	0xae
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xd
	.4byte	.LASF109
	.byte	0x1
	.byte	0xa7
	.4byte	0x45e
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x45e
	.uleb128 0xe
	.ascii	"kt\000"
	.byte	0x1
	.byte	0xa7
	.4byte	0x27e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x11
	.ascii	"ret\000"
	.byte	0x1
	.byte	0xa9
	.4byte	0x45e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.4byte	.LASF110
	.uleb128 0x15
	.4byte	.LASF112
	.byte	0x1
	.byte	0xa1
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x497
	.uleb128 0xe
	.ascii	"tid\000"
	.byte	0x1
	.byte	0xa1
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xf
	.4byte	.LASF111
	.byte	0x1
	.byte	0xa1
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x15
	.4byte	.LASF113
	.byte	0x1
	.byte	0x9b
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4c9
	.uleb128 0xe
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x9b
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xf
	.4byte	.LASF111
	.byte	0x1
	.byte	0x9b
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xd
	.4byte	.LASF114
	.byte	0x1
	.byte	0x96
	.4byte	0x5f
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4f1
	.uleb128 0xe
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x96
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xd
	.4byte	.LASF115
	.byte	0x1
	.byte	0x91
	.4byte	0x5f
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x527
	.uleb128 0xf
	.4byte	.LASF116
	.byte	0x1
	.byte	0x91
	.4byte	0x243
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0xf
	.4byte	.LASF117
	.byte	0x1
	.byte	0x91
	.4byte	0x527
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.4byte	0x5f
	.uleb128 0x15
	.4byte	.LASF118
	.byte	0x1
	.byte	0x8c
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x56d
	.uleb128 0xf
	.4byte	.LASF116
	.byte	0x1
	.byte	0x8c
	.4byte	0x243
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0xf
	.4byte	.LASF119
	.byte	0x1
	.byte	0x8c
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xf
	.4byte	.LASF117
	.byte	0x1
	.byte	0x8c
	.4byte	0x527
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x15
	.4byte	.LASF120
	.byte	0x1
	.byte	0x87
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x591
	.uleb128 0xf
	.4byte	.LASF116
	.byte	0x1
	.byte	0x87
	.4byte	0x243
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0xd
	.4byte	.LASF121
	.byte	0x1
	.byte	0x82
	.4byte	0x5f
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5b9
	.uleb128 0xf
	.4byte	.LASF122
	.byte	0x1
	.byte	0x82
	.4byte	0x37e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xd
	.4byte	.LASF123
	.byte	0x1
	.byte	0x7d
	.4byte	0x5f
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5e1
	.uleb128 0xf
	.4byte	.LASF122
	.byte	0x1
	.byte	0x7d
	.4byte	0x37e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x15
	.4byte	.LASF124
	.byte	0x1
	.byte	0x78
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x613
	.uleb128 0xe
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x78
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xe
	.ascii	"rpl\000"
	.byte	0x1
	.byte	0x78
	.4byte	0x56
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xd
	.4byte	.LASF125
	.byte	0x1
	.byte	0x6f
	.4byte	0x5f
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x663
	.uleb128 0xe
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x6f
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xf
	.4byte	.LASF126
	.byte	0x1
	.byte	0x6f
	.4byte	0x37e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xf
	.4byte	.LASF127
	.byte	0x1
	.byte	0x6f
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x11
	.ascii	"r\000"
	.byte	0x1
	.byte	0x71
	.4byte	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xd
	.4byte	.LASF128
	.byte	0x1
	.byte	0x6a
	.4byte	0x5f
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x699
	.uleb128 0xe
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x6a
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xf
	.4byte	.LASF126
	.byte	0x1
	.byte	0x6a
	.4byte	0x699
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.4byte	0x66
	.uleb128 0xd
	.4byte	.LASF129
	.byte	0x1
	.byte	0x61
	.4byte	0x56
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6d5
	.uleb128 0xe
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x61
	.4byte	0x527
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.ascii	"ret\000"
	.byte	0x1
	.byte	0x63
	.4byte	0x56
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xd
	.4byte	.LASF130
	.byte	0x1
	.byte	0x58
	.4byte	0x5f
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x725
	.uleb128 0xe
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x58
	.4byte	0x527
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xe
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x58
	.4byte	0x37e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xf
	.4byte	.LASF131
	.byte	0x1
	.byte	0x58
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x11
	.ascii	"m\000"
	.byte	0x1
	.byte	0x5a
	.4byte	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xd
	.4byte	.LASF132
	.byte	0x1
	.byte	0x4c
	.4byte	0x5f
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x75b
	.uleb128 0xe
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x4c
	.4byte	0x527
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xe
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x4c
	.4byte	0x699
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xd
	.4byte	.LASF133
	.byte	0x1
	.byte	0x45
	.4byte	0x56
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x79f
	.uleb128 0xe
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x45
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xe
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x45
	.4byte	0x56
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.ascii	"ret\000"
	.byte	0x1
	.byte	0x47
	.4byte	0x56
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xd
	.4byte	.LASF134
	.byte	0x1
	.byte	0x3a
	.4byte	0x5f
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x817
	.uleb128 0xe
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x3a
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xe
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x3a
	.4byte	0x37e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xf
	.4byte	.LASF131
	.byte	0x1
	.byte	0x3a
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0xf
	.4byte	.LASF126
	.byte	0x1
	.byte	0x3a
	.4byte	0x37e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xf
	.4byte	.LASF127
	.byte	0x1
	.byte	0x3a
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.ascii	"m\000"
	.byte	0x1
	.byte	0x3c
	.4byte	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.ascii	"r\000"
	.byte	0x1
	.byte	0x3d
	.4byte	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0xd
	.4byte	.LASF135
	.byte	0x1
	.byte	0x2d
	.4byte	0x5f
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x869
	.uleb128 0xe
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x2d
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xe
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x2d
	.4byte	0x699
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xf
	.4byte	.LASF126
	.byte	0x1
	.byte	0x2d
	.4byte	0x699
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x16
	.4byte	.LASF136
	.byte	0x1
	.byte	0x2f
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xc
	.4byte	.LASF137
	.byte	0x1
	.byte	0x28
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x17
	.4byte	.LASF138
	.byte	0x1
	.byte	0x23
	.4byte	0x5f
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x17
	.4byte	.LASF139
	.byte	0x1
	.byte	0x1e
	.4byte	0x5f
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xd
	.4byte	.LASF140
	.byte	0x1
	.byte	0x19
	.4byte	0x5f
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8da
	.uleb128 0xf
	.4byte	.LASF141
	.byte	0x1
	.byte	0x19
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xf
	.4byte	.LASF142
	.byte	0x1
	.byte	0x19
	.4byte	0x8e1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x18
	.4byte	0x8e1
	.uleb128 0x19
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.4byte	0x8da
	.uleb128 0xd
	.4byte	.LASF143
	.byte	0x1
	.byte	0x14
	.4byte	0x5f
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x92b
	.uleb128 0xf
	.4byte	.LASF141
	.byte	0x1
	.byte	0x14
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xf
	.4byte	.LASF142
	.byte	0x1
	.byte	0x14
	.4byte	0x8e1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xf
	.4byte	.LASF144
	.byte	0x1
	.byte	0x14
	.4byte	0xa7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0xc
	.4byte	.LASF145
	.byte	0x1
	.byte	0xf
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
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x18
	.byte	0
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
.LASF102:
	.ascii	"Service\000"
.LASF41:
	.ascii	"EVENT_TYPE_UART3_TX\000"
.LASF37:
	.ascii	"EVENT_TYPE_UART1_TX\000"
.LASF136:
	.ascii	"result\000"
.LASF117:
	.ascii	"addr\000"
.LASF94:
	.ascii	"CODE_RESPOND\000"
.LASF120:
	.ascii	"AwaitEvent\000"
.LASF92:
	.ascii	"CODE_SHARE\000"
.LASF81:
	.ascii	"KERNEL_TIMER_HAND\000"
.LASF141:
	.ascii	"priority\000"
.LASF115:
	.ascii	"AwaitReceive\000"
.LASF58:
	.ascii	"EVENT_TYPE_SSP_RX\000"
.LASF90:
	.ascii	"CODE_RECEIVE\000"
.LASF145:
	.ascii	"Exit\000"
.LASF116:
	.ascii	"type\000"
.LASF32:
	.ascii	"EVENT_TYPE_RESERVED_0\000"
.LASF107:
	.ascii	"sizetype\000"
.LASF72:
	.ascii	"EVENT_TYPE_I2S\000"
.LASF109:
	.ascii	"UTime\000"
.LASF97:
	.ascii	"CODE_AWAIT_RX\000"
.LASF147:
	.ascii	"src/syscall.c\000"
.LASF68:
	.ascii	"EVENT_TYPE_UART3_INT\000"
.LASF101:
	.ascii	"KQuit\000"
.LASF103:
	.ascii	"uart\000"
.LASF128:
	.ascii	"ReplyBuffer\000"
.LASF80:
	.ascii	"KERNEL_TIMER_KERN\000"
.LASF8:
	.ascii	"TASK_SIZE_TINY\000"
.LASF119:
	.ascii	"value\000"
.LASF38:
	.ascii	"EVENT_TYPE_UART2_RX\000"
.LASF99:
	.ascii	"CODE_SERVICE\000"
.LASF106:
	.ascii	"Putc\000"
.LASF127:
	.ascii	"rplen\000"
.LASF51:
	.ascii	"EVENT_TYPE_IrDA\000"
.LASF134:
	.ascii	"Send\000"
.LASF82:
	.ascii	"KERNEL_TIMER_INIT\000"
.LASF78:
	.ascii	"KERNEL_TIMER_TASK\000"
.LASF5:
	.ascii	"TASK_SIZE_BIG\000"
.LASF20:
	.ascii	"EVENT_TYPE_DMA2P_I0\000"
.LASF21:
	.ascii	"EVENT_TYPE_DMA2P_I1\000"
.LASF22:
	.ascii	"EVENT_TYPE_DMA2P_I2\000"
.LASF23:
	.ascii	"EVENT_TYPE_DMA2P_I3\000"
.LASF24:
	.ascii	"EVENT_TYPE_DMA2P_I4\000"
.LASF25:
	.ascii	"EVENT_TYPE_DMA2P_I5\000"
.LASF26:
	.ascii	"EVENT_TYPE_DMA2P_I6\000"
.LASF27:
	.ascii	"EVENT_TYPE_DMA2P_I7\000"
.LASF28:
	.ascii	"EVENT_TYPE_DMA2P_I8\000"
.LASF29:
	.ascii	"EVENT_TYPE_DMA2P_I9\000"
.LASF139:
	.ascii	"MyTid\000"
.LASF123:
	.ascii	"RegisterAs\000"
.LASF125:
	.ascii	"Reply\000"
.LASF110:
	.ascii	"long long unsigned int\000"
.LASF66:
	.ascii	"EVENT_TYPE_SSP_INT\000"
.LASF86:
	.ascii	"CODE_PARENT_ID\000"
.LASF121:
	.ascii	"WhoIs\000"
.LASF130:
	.ascii	"Receive\000"
.LASF74:
	.ascii	"EVENT_TYPE_UNUSED_3\000"
.LASF138:
	.ascii	"MyParentTid\000"
.LASF15:
	.ascii	"EVENT_TYPE_COMM_RX\000"
.LASF1:
	.ascii	"data_len\000"
.LASF17:
	.ascii	"EVENT_TYPE_TIMER_1\000"
.LASF18:
	.ascii	"EVENT_TYPE_TIMER_2\000"
.LASF64:
	.ascii	"EVENT_TYPE_TIMER_3\000"
.LASF84:
	.ascii	"CODE_EXIT\000"
.LASF12:
	.ascii	"EventType\000"
.LASF65:
	.ascii	"EVENT_TYPE_UART1_INT\000"
.LASF87:
	.ascii	"CODE_CREATE\000"
.LASF114:
	.ascii	"Time\000"
.LASF40:
	.ascii	"EVENT_TYPE_UART3_RX\000"
.LASF69:
	.ascii	"EVENT_TYPE_PME\000"
.LASF42:
	.ascii	"EVENT_TYPE_KEYBOARD\000"
.LASF9:
	.ascii	"unsigned char\000"
.LASF131:
	.ascii	"msglen\000"
.LASF30:
	.ascii	"EVENT_TYPE_DMA2M_I0\000"
.LASF31:
	.ascii	"EVENT_TYPE_DMA2M_I1\000"
.LASF70:
	.ascii	"EVENT_TYPE_DSP\000"
.LASF111:
	.ascii	"ticks\000"
.LASF89:
	.ascii	"CODE_SEND\000"
.LASF144:
	.ascii	"size\000"
.LASF96:
	.ascii	"CODE_AWAIT_TX\000"
.LASF3:
	.ascii	"unsigned int\000"
.LASF112:
	.ascii	"DelayUntil\000"
.LASF126:
	.ascii	"reply\000"
.LASF142:
	.ascii	"code\000"
.LASF7:
	.ascii	"TASK_SIZE_SMALL\000"
.LASF56:
	.ascii	"EVENT_TYPE_V_SYNC\000"
.LASF148:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF98:
	.ascii	"CODE_UTIME\000"
.LASF93:
	.ascii	"CODE_OBTAIN\000"
.LASF52:
	.ascii	"EVENT_TYPE_MAC\000"
.LASF59:
	.ascii	"EVENT_TYPE_SSP_TX\000"
.LASF16:
	.ascii	"EVENT_TYPE_COMM_TX\000"
.LASF108:
	.ascii	"Getc\000"
.LASF104:
	.ascii	"char\000"
.LASF140:
	.ascii	"Create\000"
.LASF137:
	.ascii	"Pass\000"
.LASF83:
	.ascii	"SyscallCode\000"
.LASF91:
	.ascii	"CODE_REPLY\000"
.LASF43:
	.ascii	"EVENT_TYPE_TOUCH_SCREEN\000"
.LASF100:
	.ascii	"CODE_QUIT\000"
.LASF76:
	.ascii	"EVENT_TYPE_MAX\000"
.LASF122:
	.ascii	"name\000"
.LASF0:
	.ascii	"data\000"
.LASF113:
	.ascii	"Delay\000"
.LASF79:
	.ascii	"KERNEL_TIMER_USER\000"
.LASF135:
	.ascii	"SendBuffer\000"
.LASF71:
	.ascii	"EVENT_TYPE_GPIO\000"
.LASF132:
	.ascii	"ReceiveBuffer\000"
.LASF11:
	.ascii	"TaskSize\000"
.LASF13:
	.ascii	"EVENT_TYPE_UNUSED_0\000"
.LASF14:
	.ascii	"EVENT_TYPE_UNUSED_1\000"
.LASF34:
	.ascii	"EVENT_TYPE_RESERVED_2\000"
.LASF35:
	.ascii	"EVENT_TYPE_RESERVED_3\000"
.LASF44:
	.ascii	"EVENT_TYPE_RESERVED_4\000"
.LASF53:
	.ascii	"EVENT_TYPE_RESERVED_5\000"
.LASF60:
	.ascii	"EVENT_TYPE_RESERVED_6\000"
.LASF61:
	.ascii	"EVENT_TYPE_RESERVED_7\000"
.LASF62:
	.ascii	"EVENT_TYPE_RESERVED_8\000"
.LASF63:
	.ascii	"EVENT_TYPE_RESERVED_9\000"
.LASF45:
	.ascii	"EVENT_TYPE_EXTERNAL_0\000"
.LASF46:
	.ascii	"EVENT_TYPE_EXTERNAL_1\000"
.LASF67:
	.ascii	"EVENT_TYPE_UART2_INT\000"
.LASF47:
	.ascii	"EVENT_TYPE_EXTERNAL_2\000"
.LASF133:
	.ascii	"Share\000"
.LASF73:
	.ascii	"EVENT_TYPE_UNUSED_2\000"
.LASF54:
	.ascii	"EVENT_TYPE_RASTER\000"
.LASF50:
	.ascii	"EVENT_TYPE_RTC\000"
.LASF85:
	.ascii	"CODE_MY_ID\000"
.LASF75:
	.ascii	"EVENT_TYPE_UNUSED_4\000"
.LASF6:
	.ascii	"TASK_SIZE_NORMAL\000"
.LASF118:
	.ascii	"AwaitTransmission\000"
.LASF19:
	.ascii	"EVENT_TYPE_AUDIO_CODEC\000"
.LASF95:
	.ascii	"CODE_AWAIT\000"
.LASF88:
	.ascii	"CODE_PASS\000"
.LASF39:
	.ascii	"EVENT_TYPE_UART2_TX\000"
.LASF77:
	.ascii	"KernelTimer\000"
.LASF4:
	.ascii	"TASK_SIZE_GIANT\000"
.LASF146:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF124:
	.ascii	"Respond\000"
.LASF49:
	.ascii	"EVENT_TYPE_WATCHDOG_EXPIRED\000"
.LASF10:
	.ascii	"Buffer\000"
.LASF129:
	.ascii	"Obtain\000"
.LASF36:
	.ascii	"EVENT_TYPE_UART1_RX\000"
.LASF48:
	.ascii	"EVENT_TYPE_TICK_64HZ\000"
.LASF143:
	.ascii	"CreateSize\000"
.LASF55:
	.ascii	"EVENT_TYPE_TICK_1HZ\000"
.LASF105:
	.ascii	"Putstr\000"
.LASF57:
	.ascii	"EVENT_TYPE_V_FIFO\000"
.LASF2:
	.ascii	"truncated\000"
.LASF33:
	.ascii	"EVENT_TYPE_RESERVED_1\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
