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
	.file	"sensors.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.bss
	.align	2
isA:
	.space	4
	.size	isA, 4
	.text
	.align	2
	.global	setSensorTrack
	.syntax unified
	.arm
	.fpu softvfp
	.type	setSensorTrack, %function
setSensorTrack:
.LFB0:
	.file 1 "src/util/trains/sensors.c"
	.loc 1 5 0
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
	.loc 1 5 0
	ldr	r3, .L2
.LPIC0:
	add	r3, pc, r3
	ldr	r2, [fp, #-8]
	str	r2, [r3]
	nop
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L3:
	.align	2
.L2:
	.word	isA-(.LPIC0+8)
	.cfi_endproc
.LFE0:
	.size	setSensorTrack, .-setSensorTrack
	.section	.rodata
	.align	2
.LC0:
	.byte	5
	.byte	15
	.text
	.align	2
	.global	getPrevSensor
	.syntax unified
	.arm
	.fpu softvfp
	.type	getPrevSensor, %function
getPrevSensor:
.LFB1:
	.loc 1 8 0
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
	strh	r0, [fp, #-16]	@ movhi
	str	r1, [fp, #-20]
	.loc 1 9 0
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #5
	bne	.L5
	.loc 1 9 0 is_stmt 0 discriminator 1
	ldrh	r3, [fp, #-16]	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	b	.L6
.L5:
	.loc 1 10 0 is_stmt 1
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #4
	addls	pc, pc, r3, asl #2
	b	.L7
.L9:
	b	.L8
	b	.L10
	b	.L11
	b	.L12
	b	.L13
	.p2align 1
.L7:
	.loc 1 11 0
	ldrh	r3, [fp, #-16]	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	b	.L6
.L8:
	.loc 1 13 0
	ldrb	r3, [fp, #-15]
	and	r3, r3, #15
	and	r3, r3, #255
	sub	r3, r3, #1
	cmp	r3, #14
	addls	pc, pc, r3, asl #2
	b	.L14
.L16:
	b	.L15
	b	.L17
	b	.L18
	b	.L19
	b	.L20
	b	.L21
	b	.L22
	b	.L23
	b	.L24
	b	.L25
	b	.L26
	b	.L27
	b	.L28
	b	.L29
	b	.L30
	.p2align 1
.L14:
	.loc 1 14 0
	ldr	r3, .L157
.LPIC1:
	add	r3, pc, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	b	.L6
.L15:
	.loc 1 15 0
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #2
	orr	r3, r3, #13
	strb	r3, [fp, #-7]
	b	.L6
.L17:
	.loc 1 16 0
	mov	r3, #66
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #1
	orr	r3, r3, #14
	strb	r3, [fp, #-7]
	b	.L6
.L18:
	.loc 1 17 0
	ldr	r3, [fp, #-20]
	and	r3, r3, #16384
	cmp	r3, #0
	beq	.L31
	.loc 1 17 0 is_stmt 0 discriminator 1
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #4
	orr	r3, r3, #11
	strb	r3, [fp, #-7]
	b	.L6
.L31:
	.loc 1 17 0 discriminator 2
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #2
	orr	r3, r3, #13
	strb	r3, [fp, #-7]
	b	.L6
.L19:
	.loc 1 18 0 is_stmt 1
	mov	r3, #66
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #7
	orr	r3, r3, #8
	strb	r3, [fp, #-7]
	b	.L6
.L20:
	.loc 1 19 0
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #8
	orr	r3, r3, #7
	strb	r3, [fp, #-7]
	b	.L6
.L21:
	.loc 1 20 0
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #8
	orr	r3, r3, #7
	strb	r3, [fp, #-7]
	b	.L6
.L22:
	.loc 1 21 0
	mov	r3, #66
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #5
	orr	r3, r3, #10
	strb	r3, [fp, #-7]
	b	.L6
.L23:
	.loc 1 22 0
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #8
	orr	r3, r3, #7
	strb	r3, [fp, #-7]
	b	.L6
.L24:
	.loc 1 23 0
	mov	r3, #66
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #9
	orr	r3, r3, #6
	strb	r3, [fp, #-7]
	b	.L6
.L25:
	.loc 1 24 0
	ldr	r3, .L157+4
.LPIC2:
	add	r3, pc, r3
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L33
	.loc 1 24 0 is_stmt 0 discriminator 1
	ldr	r3, .L157+8
.LPIC3:
	add	r3, pc, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	b	.L6
.L33:
	.loc 1 24 0 discriminator 2
	mov	r3, #65
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #1
	orr	r3, r3, #14
	strb	r3, [fp, #-7]
	b	.L6
.L26:
	.loc 1 25 0 is_stmt 1
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #8
	orr	r3, r3, #7
	strb	r3, [fp, #-7]
	b	.L6
.L27:
	.loc 1 26 0
	ldr	r3, .L157+12
.LPIC4:
	add	r3, pc, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	b	.L6
.L28:
	.loc 1 27 0
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #2
	orr	r3, r3, #13
	strb	r3, [fp, #-7]
	b	.L6
.L29:
	.loc 1 28 0
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #2
	orr	r3, r3, #13
	strb	r3, [fp, #-7]
	b	.L6
.L30:
	.loc 1 29 0
	ldr	r3, .L157+16
.LPIC5:
	add	r3, pc, r3
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L35
	.loc 1 29 0 is_stmt 0 discriminator 1
	ldr	r3, .L157+20
.LPIC6:
	add	r3, pc, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	b	.L6
.L35:
	.loc 1 29 0 discriminator 2
	mov	r3, #65
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #4
	orr	r3, r3, #11
	strb	r3, [fp, #-7]
	b	.L6
.L10:
	.loc 1 32 0 is_stmt 1
	ldrb	r3, [fp, #-15]
	and	r3, r3, #15
	and	r3, r3, #255
	sub	r3, r3, #1
	cmp	r3, #14
	addls	pc, pc, r3, asl #2
	b	.L37
.L39:
	b	.L38
	b	.L40
	b	.L41
	b	.L42
	b	.L43
	b	.L44
	b	.L45
	b	.L46
	b	.L47
	b	.L48
	b	.L49
	b	.L50
	b	.L51
	b	.L52
	b	.L53
	.p2align 1
.L37:
	.loc 1 33 0
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #6
	orr	r3, r3, #9
	strb	r3, [fp, #-7]
	b	.L6
.L38:
	.loc 1 34 0
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #3
	orr	r3, r3, #12
	strb	r3, [fp, #-7]
	b	.L6
.L40:
	.loc 1 35 0
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #6
	orr	r3, r3, #9
	strb	r3, [fp, #-7]
	b	.L6
.L41:
	.loc 1 36 0
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #15
	strb	r3, [fp, #-7]
	b	.L6
.L42:
	.loc 1 37 0
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #5
	orr	r3, r3, #10
	strb	r3, [fp, #-7]
	b	.L6
.L43:
	.loc 1 38 0
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #12
	orr	r3, r3, #3
	strb	r3, [fp, #-7]
	b	.L6
.L44:
	.loc 1 39 0
	ldr	r3, .L157+24
.LPIC7:
	add	r3, pc, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	b	.L6
.L45:
	.loc 1 40 0
	mov	r3, #65
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #7
	orr	r3, r3, #8
	strb	r3, [fp, #-7]
	b	.L6
.L46:
	.loc 1 41 0
	ldr	r3, .L157+28
.LPIC8:
	add	r3, pc, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	b	.L6
.L47:
	.loc 1 42 0
	mov	r3, #65
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #10
	orr	r3, r3, #5
	strb	r3, [fp, #-7]
	b	.L6
.L48:
	.loc 1 43 0
	ldr	r3, .L157+32
.LPIC9:
	add	r3, pc, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	b	.L6
.L49:
	.loc 1 44 0
	mov	r3, #65
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #9
	orr	r3, r3, #6
	strb	r3, [fp, #-7]
	b	.L6
.L50:
	.loc 1 45 0
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #1
	orr	r3, r3, #14
	strb	r3, [fp, #-7]
	b	.L6
.L51:
	.loc 1 46 0
	ldr	r3, [fp, #-20]
	and	r3, r3, #4194304
	cmp	r3, #0
	beq	.L54
	.loc 1 46 0 is_stmt 0 discriminator 1
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #15
	strb	r3, [fp, #-7]
	b	.L6
.L54:
	.loc 1 46 0 discriminator 2
	ldr	r3, [fp, #-20]
	and	r3, r3, #2097152
	cmp	r3, #0
	beq	.L56
	.loc 1 46 0 discriminator 3
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #15
	strb	r3, [fp, #-7]
	b	.L6
.L56:
	.loc 1 46 0 discriminator 4
	ldr	r3, .L157+36
.LPIC10:
	add	r3, pc, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	b	.L6
.L52:
	.loc 1 47 0 is_stmt 1
	ldr	r3, [fp, #-20]
	and	r3, r3, #32768
	cmp	r3, #0
	beq	.L57
	.loc 1 47 0 is_stmt 0 discriminator 1
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #7
	orr	r3, r3, #8
	strb	r3, [fp, #-7]
	b	.L6
.L57:
	.loc 1 47 0 discriminator 2
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #10
	orr	r3, r3, #5
	strb	r3, [fp, #-7]
	b	.L6
.L53:
	.loc 1 48 0 is_stmt 1
	mov	r3, #65
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #12
	orr	r3, r3, #3
	strb	r3, [fp, #-7]
	b	.L6
.L11:
	.loc 1 51 0
	ldrb	r3, [fp, #-15]
	and	r3, r3, #15
	and	r3, r3, #255
	sub	r3, r3, #1
	cmp	r3, #14
	addls	pc, pc, r3, asl #2
	b	.L59
.L61:
	b	.L60
	b	.L62
	b	.L63
	b	.L64
	b	.L65
	b	.L66
	b	.L67
	b	.L68
	b	.L69
	b	.L70
	b	.L71
	b	.L72
	b	.L73
	b	.L74
	b	.L75
	.p2align 1
.L59:
	.loc 1 52 0
	ldr	r3, [fp, #-20]
	and	r3, r3, #4194304
	cmp	r3, #0
	beq	.L76
	.loc 1 52 0 is_stmt 0 discriminator 1
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #15
	strb	r3, [fp, #-7]
	b	.L6
.L76:
	.loc 1 52 0 discriminator 2
	ldr	r3, [fp, #-20]
	and	r3, r3, #4194304
	cmp	r3, #0
	beq	.L78
	.loc 1 52 0 discriminator 3
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #15
	strb	r3, [fp, #-7]
	b	.L6
.L78:
	.loc 1 52 0 discriminator 4
	ldr	r3, .L157+40
.LPIC11:
	add	r3, pc, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	b	.L6
.L60:
	.loc 1 53 0 is_stmt 1
	mov	r3, #66
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #13
	orr	r3, r3, #2
	strb	r3, [fp, #-7]
	b	.L6
.L62:
	.loc 1 54 0
	ldr	r3, [fp, #-20]
	and	r3, r3, #262144
	cmp	r3, #0
	beq	.L79
	.loc 1 54 0 is_stmt 0 discriminator 1
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #11
	orr	r3, r3, #4
	strb	r3, [fp, #-7]
	b	.L6
.L79:
	.loc 1 54 0 discriminator 2
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #9
	orr	r3, r3, #6
	strb	r3, [fp, #-7]
	b	.L6
.L63:
	.loc 1 55 0 is_stmt 1
	ldr	r3, .L157+44
.LPIC12:
	add	r3, pc, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	b	.L6
.L64:
	.loc 1 56 0
	mov	r3, #66
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	orr	r3, r3, #15
	strb	r3, [fp, #-7]
	b	.L6
.L65:
	.loc 1 57 0
	ldr	r3, [fp, #-20]
	and	r3, r3, #64
	cmp	r3, #0
	beq	.L81
	.loc 1 57 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-20]
	and	r3, r3, #32
	cmp	r3, #0
	beq	.L82
	.loc 1 57 0 discriminator 3
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #4
	orr	r3, r3, #11
	strb	r3, [fp, #-7]
	b	.L6
.L82:
	.loc 1 57 0 discriminator 4
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #12
	orr	r3, r3, #3
	strb	r3, [fp, #-7]
	b	.L6
.L81:
	.loc 1 57 0 discriminator 2
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	orr	r3, r3, #15
	strb	r3, [fp, #-7]
	b	.L6
.L66:
	.loc 1 58 0 is_stmt 1
	ldr	r3, [fp, #-20]
	and	r3, r3, #8
	cmp	r3, #0
	beq	.L85
	.loc 1 58 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-20]
	and	r3, r3, #4
	cmp	r3, #0
	beq	.L86
	.loc 1 58 0 discriminator 3
	mov	r3, #65
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #8
	orr	r3, r3, #7
	strb	r3, [fp, #-7]
	b	.L6
.L86:
	.loc 1 58 0 discriminator 4
	ldr	r3, [fp, #-20]
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L88
	.loc 1 58 0 discriminator 5
	mov	r3, #65
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #6
	orr	r3, r3, #9
	strb	r3, [fp, #-7]
	b	.L6
.L88:
	.loc 1 58 0 discriminator 6
	mov	r3, #65
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #5
	orr	r3, r3, #10
	strb	r3, [fp, #-7]
	b	.L6
.L85:
	.loc 1 58 0 discriminator 2
	mov	r3, #65
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #11
	orr	r3, r3, #4
	strb	r3, [fp, #-7]
	b	.L6
.L67:
	.loc 1 59 0 is_stmt 1
	ldr	r3, [fp, #-20]
	and	r3, r3, #32
	cmp	r3, #0
	beq	.L90
	.loc 1 59 0 is_stmt 0 discriminator 1
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #4
	orr	r3, r3, #11
	strb	r3, [fp, #-7]
	b	.L6
.L90:
	.loc 1 59 0 discriminator 2
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #12
	orr	r3, r3, #3
	strb	r3, [fp, #-7]
	b	.L6
.L68:
	.loc 1 60 0 is_stmt 1
	ldr	r3, [fp, #-20]
	and	r3, r3, #65536
	cmp	r3, #0
	beq	.L92
	.loc 1 60 0 is_stmt 0 discriminator 1
	mov	r3, #66
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #12
	orr	r3, r3, #3
	strb	r3, [fp, #-7]
	b	.L6
.L92:
	.loc 1 60 0 discriminator 2
	mov	r3, #66
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #14
	orr	r3, r3, #1
	strb	r3, [fp, #-7]
	b	.L6
.L69:
	.loc 1 61 0 is_stmt 1
	mov	r3, #66
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	orr	r3, r3, #15
	strb	r3, [fp, #-7]
	b	.L6
.L70:
	.loc 1 62 0
	mov	r3, #65
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #13
	orr	r3, r3, #2
	strb	r3, [fp, #-7]
	b	.L6
.L71:
	.loc 1 63 0
	ldr	r3, [fp, #-20]
	and	r3, r3, #8192
	cmp	r3, #0
	beq	.L94
	.loc 1 63 0 is_stmt 0 discriminator 1
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #1
	orr	r3, r3, #14
	strb	r3, [fp, #-7]
	b	.L6
.L94:
	.loc 1 63 0 discriminator 2
	mov	r3, #66
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #10
	orr	r3, r3, #5
	strb	r3, [fp, #-7]
	b	.L6
.L72:
	.loc 1 64 0 is_stmt 1
	ldr	r3, [fp, #-20]
	and	r3, r3, #2048
	cmp	r3, #0
	beq	.L96
	.loc 1 64 0 is_stmt 0 discriminator 1
	mov	r3, #65
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #13
	orr	r3, r3, #2
	strb	r3, [fp, #-7]
	b	.L6
.L96:
	.loc 1 64 0 discriminator 2
	ldr	r3, [fp, #-20]
	and	r3, r3, #4096
	cmp	r3, #0
	beq	.L98
	.loc 1 64 0 discriminator 3
	ldr	r3, [fp, #-20]
	and	r3, r3, #16
	cmp	r3, #0
	beq	.L99
	.loc 1 64 0 discriminator 5
	mov	r3, #65
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #3
	orr	r3, r3, #12
	strb	r3, [fp, #-7]
	b	.L6
.L99:
	.loc 1 64 0 discriminator 6
	mov	r3, #65
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	orr	r3, r3, #15
	strb	r3, [fp, #-7]
	b	.L6
.L98:
	.loc 1 64 0 discriminator 4
	mov	r3, #65
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #15
	strb	r3, [fp, #-7]
	b	.L6
.L73:
	.loc 1 65 0 is_stmt 1
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #8
	orr	r3, r3, #7
	strb	r3, [fp, #-7]
	b	.L6
.L74:
	.loc 1 66 0
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #11
	orr	r3, r3, #4
	strb	r3, [fp, #-7]
	b	.L6
.L75:
	.loc 1 67 0
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #5
	orr	r3, r3, #10
	strb	r3, [fp, #-7]
	b	.L6
.L12:
	.loc 1 70 0
	ldrb	r3, [fp, #-15]
	and	r3, r3, #15
	and	r3, r3, #255
	sub	r3, r3, #1
	cmp	r3, #14
	addls	pc, pc, r3, asl #2
	b	.L101
.L103:
	b	.L102
	b	.L104
	b	.L105
	b	.L106
	b	.L107
	b	.L108
	b	.L109
	b	.L110
	b	.L111
	b	.L112
	b	.L113
	b	.L114
	b	.L115
	b	.L116
	b	.L117
	.p2align 1
.L101:
	.loc 1 71 0
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #13
	orr	r3, r3, #2
	strb	r3, [fp, #-7]
	b	.L6
.L102:
	.loc 1 72 0
	ldr	r3, [fp, #-20]
	and	r3, r3, #1048576
	cmp	r3, #0
	beq	.L118
	.loc 1 72 0 is_stmt 0 discriminator 1
	mov	r3, #66
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #3
	orr	r3, r3, #12
	strb	r3, [fp, #-7]
	b	.L6
.L118:
	.loc 1 72 0 discriminator 2
	ldr	r3, [fp, #-20]
	and	r3, r3, #524288
	cmp	r3, #0
	beq	.L120
	.loc 1 72 0 discriminator 3
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #14
	orr	r3, r3, #1
	strb	r3, [fp, #-7]
	b	.L6
.L120:
	.loc 1 72 0 discriminator 4
	ldr	r3, .L157+48
.LPIC13:
	add	r3, pc, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	b	.L6
.L104:
	.loc 1 73 0 is_stmt 1
	mov	r3, #66
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #11
	orr	r3, r3, #4
	strb	r3, [fp, #-7]
	b	.L6
.L105:
	.loc 1 74 0
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #10
	orr	r3, r3, #5
	strb	r3, [fp, #-7]
	b	.L6
.L106:
	.loc 1 75 0
	ldr	r3, [fp, #-20]
	and	r3, r3, #256
	cmp	r3, #0
	beq	.L121
	.loc 1 75 0 is_stmt 0 discriminator 1
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #7
	orr	r3, r3, #8
	strb	r3, [fp, #-7]
	b	.L6
.L121:
	.loc 1 75 0 discriminator 2
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #6
	orr	r3, r3, #9
	strb	r3, [fp, #-7]
	b	.L6
.L107:
	.loc 1 76 0 is_stmt 1
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #11
	orr	r3, r3, #4
	strb	r3, [fp, #-7]
	b	.L6
.L108:
	.loc 1 77 0
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #9
	orr	r3, r3, #6
	strb	r3, [fp, #-7]
	b	.L6
.L109:
	.loc 1 78 0
	ldr	r3, [fp, #-20]
	and	r3, r3, #256
	cmp	r3, #0
	beq	.L123
	.loc 1 78 0 is_stmt 0 discriminator 1
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #7
	orr	r3, r3, #8
	strb	r3, [fp, #-7]
	b	.L6
.L123:
	.loc 1 78 0 discriminator 2
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #6
	orr	r3, r3, #9
	strb	r3, [fp, #-7]
	b	.L6
.L110:
	.loc 1 79 0 is_stmt 1
	ldr	r3, [fp, #-20]
	and	r3, r3, #512
	cmp	r3, #0
	beq	.L125
	.loc 1 79 0 is_stmt 0 discriminator 1
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #10
	orr	r3, r3, #5
	strb	r3, [fp, #-7]
	b	.L6
.L125:
	.loc 1 79 0 discriminator 2
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #9
	orr	r3, r3, #6
	strb	r3, [fp, #-7]
	b	.L6
.L111:
	.loc 1 80 0 is_stmt 1
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #5
	orr	r3, r3, #10
	strb	r3, [fp, #-7]
	b	.L6
.L112:
	.loc 1 81 0
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #4
	orr	r3, r3, #11
	strb	r3, [fp, #-7]
	b	.L6
.L113:
	.loc 1 82 0
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #1
	orr	r3, r3, #14
	strb	r3, [fp, #-7]
	b	.L6
.L114:
	.loc 1 83 0
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #3
	orr	r3, r3, #12
	strb	r3, [fp, #-7]
	b	.L6
.L115:
	.loc 1 84 0
	mov	r3, #66
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #15
	strb	r3, [fp, #-7]
	b	.L6
.L116:
	.loc 1 85 0
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #3
	orr	r3, r3, #12
	strb	r3, [fp, #-7]
	b	.L6
.L117:
	.loc 1 86 0
	mov	r3, #66
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #2
	orr	r3, r3, #13
	strb	r3, [fp, #-7]
	b	.L6
.L13:
	.loc 1 89 0
	ldrb	r3, [fp, #-15]
	and	r3, r3, #15
	and	r3, r3, #255
	sub	r3, r3, #1
	cmp	r3, #14
	addls	pc, pc, r3, asl #2
	b	.L127
.L129:
	b	.L128
	b	.L130
	b	.L131
	b	.L132
	b	.L133
	b	.L134
	b	.L135
	b	.L136
	b	.L137
	b	.L138
	b	.L139
	b	.L140
	b	.L141
	b	.L142
	b	.L143
	.p2align 1
.L127:
	.loc 1 90 0
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	orr	r3, r3, #15
	strb	r3, [fp, #-7]
	b	.L6
.L128:
	.loc 1 91 0
	ldr	r3, [fp, #-20]
	and	r3, r3, #1048576
	cmp	r3, #0
	beq	.L144
	.loc 1 91 0 is_stmt 0 discriminator 1
	mov	r3, #66
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #3
	orr	r3, r3, #12
	strb	r3, [fp, #-7]
	b	.L6
.L144:
	.loc 1 91 0 discriminator 2
	ldr	r3, [fp, #-20]
	and	r3, r3, #524288
	cmp	r3, #0
	beq	.L146
	.loc 1 91 0 discriminator 3
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #14
	orr	r3, r3, #1
	strb	r3, [fp, #-7]
	b	.L6
.L146:
	.loc 1 91 0 discriminator 4
	ldr	r3, .L157+52
.LPIC14:
	add	r3, pc, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	b	.L6
.L130:
	.loc 1 92 0 is_stmt 1
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #10
	orr	r3, r3, #5
	strb	r3, [fp, #-7]
	b	.L6
.L131:
	.loc 1 93 0
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #14
	orr	r3, r3, #1
	strb	r3, [fp, #-7]
	b	.L6
.L132:
	.loc 1 94 0
	ldr	r3, [fp, #-20]
	and	r3, r3, #1024
	cmp	r3, #0
	beq	.L147
	.loc 1 94 0 is_stmt 0 discriminator 1
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #12
	orr	r3, r3, #3
	strb	r3, [fp, #-7]
	b	.L6
.L147:
	.loc 1 94 0 discriminator 2
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #13
	orr	r3, r3, #2
	strb	r3, [fp, #-7]
	b	.L6
.L158:
	.align	2
.L157:
	.word	.LC0-(.LPIC1+8)
	.word	isA-(.LPIC2+8)
	.word	.LC0-(.LPIC3+8)
	.word	.LC0-(.LPIC4+8)
	.word	isA-(.LPIC5+8)
	.word	.LC0-(.LPIC6+8)
	.word	.LC0-(.LPIC7+8)
	.word	.LC0-(.LPIC8+8)
	.word	.LC0-(.LPIC9+8)
	.word	.LC0-(.LPIC10+8)
	.word	.LC0-(.LPIC11+8)
	.word	.LC0-(.LPIC12+8)
	.word	.LC0-(.LPIC13+8)
	.word	.LC0-(.LPIC14+8)
.L133:
	.loc 1 95 0 is_stmt 1
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #11
	orr	r3, r3, #4
	strb	r3, [fp, #-7]
	b	.L6
.L134:
	.loc 1 96 0
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #3
	orr	r3, r3, #12
	strb	r3, [fp, #-7]
	b	.L6
.L135:
	.loc 1 97 0
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #8
	orr	r3, r3, #7
	strb	r3, [fp, #-7]
	b	.L6
.L136:
	.loc 1 98 0
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #2
	orr	r3, r3, #13
	strb	r3, [fp, #-7]
	b	.L6
.L137:
	.loc 1 99 0
	ldr	r3, [fp, #-20]
	and	r3, r3, #512
	cmp	r3, #0
	beq	.L149
	.loc 1 99 0 is_stmt 0 discriminator 1
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #10
	orr	r3, r3, #5
	strb	r3, [fp, #-7]
	b	.L6
.L149:
	.loc 1 99 0 discriminator 2
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #9
	orr	r3, r3, #6
	strb	r3, [fp, #-7]
	b	.L6
.L138:
	.loc 1 100 0 is_stmt 1
	ldr	r3, [fp, #-20]
	and	r3, r3, #128
	cmp	r3, #0
	beq	.L151
	.loc 1 100 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-20]
	and	r3, r3, #262144
	cmp	r3, #0
	beq	.L152
	.loc 1 100 0 discriminator 3
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #11
	orr	r3, r3, #4
	strb	r3, [fp, #-7]
	b	.L6
.L152:
	.loc 1 100 0 discriminator 4
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #9
	orr	r3, r3, #6
	strb	r3, [fp, #-7]
	b	.L6
.L151:
	.loc 1 100 0 discriminator 2
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #4
	orr	r3, r3, #11
	strb	r3, [fp, #-7]
	b	.L6
.L139:
	.loc 1 101 0 is_stmt 1
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #7
	orr	r3, r3, #8
	strb	r3, [fp, #-7]
	b	.L6
.L140:
	.loc 1 102 0
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #6
	orr	r3, r3, #9
	strb	r3, [fp, #-7]
	b	.L6
.L141:
	.loc 1 103 0
	ldr	r3, [fp, #-20]
	and	r3, r3, #131072
	cmp	r3, #0
	beq	.L155
	.loc 1 103 0 is_stmt 0 discriminator 1
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	orr	r3, r3, #15
	strb	r3, [fp, #-7]
	b	.L6
.L155:
	.loc 1 103 0 discriminator 2
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #2
	orr	r3, r3, #13
	strb	r3, [fp, #-7]
	b	.L6
.L142:
	.loc 1 104 0 is_stmt 1
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #14
	orr	r3, r3, #1
	strb	r3, [fp, #-7]
	b	.L6
.L143:
	.loc 1 105 0
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #5
	orr	r3, r3, #10
	strb	r3, [fp, #-7]
.L6:
	mov	r3, #0
	ldrb	r2, [fp, #-8]	@ zero_extendqisi2
	and	r2, r2, #255
	bic	r3, r3, #255
	orr	r3, r2, r3
	ldrb	r2, [fp, #-7]	@ zero_extendqisi2
	and	r2, r2, #255
	bic	r3, r3, #65280
	lsl	r2, r2, #8
	orr	r3, r2, r3
	.loc 1 110 0 discriminator 25
	mov	r0, r3	@ movhi
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE1:
	.size	getPrevSensor, .-getPrevSensor
	.align	2
	.global	getNextSensor
	.syntax unified
	.arm
	.fpu softvfp
	.type	getNextSensor, %function
getNextSensor:
.LFB2:
	.loc 1 113 0
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
	strh	r0, [fp, #-16]	@ movhi
	str	r1, [fp, #-20]
	.loc 1 114 0
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #5
	bne	.L160
	.loc 1 114 0 is_stmt 0 discriminator 1
	ldrh	r3, [fp, #-16]	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	b	.L161
.L160:
	.loc 1 115 0 is_stmt 1
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #4
	addls	pc, pc, r3, asl #2
	b	.L162
.L164:
	b	.L163
	b	.L165
	b	.L166
	b	.L167
	b	.L168
	.p2align 1
.L162:
	.loc 1 116 0
	ldrh	r3, [fp, #-16]	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	b	.L161
.L163:
	.loc 1 118 0
	ldrb	r3, [fp, #-15]
	and	r3, r3, #15
	and	r3, r3, #255
	sub	r3, r3, #1
	cmp	r3, #14
	addls	pc, pc, r3, asl #2
	b	.L169
.L171:
	b	.L170
	b	.L172
	b	.L173
	b	.L174
	b	.L175
	b	.L176
	b	.L177
	b	.L178
	b	.L179
	b	.L180
	b	.L181
	b	.L182
	b	.L183
	b	.L184
	b	.L185
	.p2align 1
.L169:
	.loc 1 119 0
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #3
	orr	r3, r3, #12
	strb	r3, [fp, #-7]
	b	.L161
.L170:
	.loc 1 120 0
	ldr	r3, .L312
.LPIC15:
	add	r3, pc, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	b	.L161
.L172:
	.loc 1 121 0
	ldr	r3, [fp, #-20]
	and	r3, r3, #16384
	cmp	r3, #0
	beq	.L186
	.loc 1 121 0 is_stmt 0 discriminator 1
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #5
	orr	r3, r3, #10
	strb	r3, [fp, #-7]
	b	.L161
.L186:
	.loc 1 121 0 discriminator 2
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #3
	orr	r3, r3, #12
	strb	r3, [fp, #-7]
	b	.L161
.L173:
	.loc 1 122 0 is_stmt 1
	mov	r3, #66
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	orr	r3, r3, #15
	strb	r3, [fp, #-7]
	b	.L161
.L174:
	.loc 1 123 0
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #9
	orr	r3, r3, #6
	strb	r3, [fp, #-7]
	b	.L161
.L175:
	.loc 1 124 0
	mov	r3, #66
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #6
	orr	r3, r3, #9
	strb	r3, [fp, #-7]
	b	.L161
.L176:
	.loc 1 125 0
	mov	r3, #66
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #4
	orr	r3, r3, #11
	strb	r3, [fp, #-7]
	b	.L161
.L177:
	.loc 1 126 0
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #9
	orr	r3, r3, #6
	strb	r3, [fp, #-7]
	b	.L161
.L178:
	.loc 1 127 0
	mov	r3, #66
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #8
	orr	r3, r3, #7
	strb	r3, [fp, #-7]
	b	.L161
.L179:
	.loc 1 128 0
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #9
	orr	r3, r3, #6
	strb	r3, [fp, #-7]
	b	.L161
.L180:
	.loc 1 129 0
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #9
	orr	r3, r3, #6
	strb	r3, [fp, #-7]
	b	.L161
.L181:
	.loc 1 130 0
	ldr	r3, .L312+4
.LPIC16:
	add	r3, pc, r3
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L188
	.loc 1 130 0 is_stmt 0 discriminator 1
	ldr	r3, .L312+8
.LPIC17:
	add	r3, pc, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	b	.L161
.L188:
	.loc 1 130 0 discriminator 2
	mov	r3, #65
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	orr	r3, r3, #15
	strb	r3, [fp, #-7]
	b	.L161
.L182:
	.loc 1 131 0 is_stmt 1
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #3
	orr	r3, r3, #12
	strb	r3, [fp, #-7]
	b	.L161
.L183:
	.loc 1 132 0
	ldr	r3, .L312+12
.LPIC18:
	add	r3, pc, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	b	.L161
.L184:
	.loc 1 133 0
	ldr	r3, .L312+16
.LPIC19:
	add	r3, pc, r3
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L190
	.loc 1 133 0 is_stmt 0 discriminator 1
	ldr	r3, .L312+20
.LPIC20:
	add	r3, pc, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	b	.L161
.L190:
	.loc 1 133 0 discriminator 2
	mov	r3, #65
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #5
	orr	r3, r3, #10
	strb	r3, [fp, #-7]
	b	.L161
.L185:
	.loc 1 134 0 is_stmt 1
	ldr	r3, .L312+24
.LPIC21:
	add	r3, pc, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	b	.L161
.L165:
	.loc 1 137 0
	ldrb	r3, [fp, #-15]
	and	r3, r3, #15
	and	r3, r3, #255
	sub	r3, r3, #1
	cmp	r3, #14
	addls	pc, pc, r3, asl #2
	b	.L192
.L194:
	b	.L193
	b	.L195
	b	.L196
	b	.L197
	b	.L198
	b	.L199
	b	.L200
	b	.L201
	b	.L202
	b	.L203
	b	.L204
	b	.L205
	b	.L206
	b	.L207
	b	.L208
	.p2align 1
.L192:
	.loc 1 138 0
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #2
	orr	r3, r3, #13
	strb	r3, [fp, #-7]
	b	.L161
.L193:
	.loc 1 139 0
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #7
	orr	r3, r3, #8
	strb	r3, [fp, #-7]
	b	.L161
.L195:
	.loc 1 140 0
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #14
	orr	r3, r3, #1
	strb	r3, [fp, #-7]
	b	.L161
.L196:
	.loc 1 141 0
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #7
	orr	r3, r3, #8
	strb	r3, [fp, #-7]
	b	.L161
.L197:
	.loc 1 142 0
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #13
	orr	r3, r3, #2
	strb	r3, [fp, #-7]
	b	.L161
.L198:
	.loc 1 143 0
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #4
	orr	r3, r3, #11
	strb	r3, [fp, #-7]
	b	.L161
.L199:
	.loc 1 144 0
	mov	r3, #65
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #6
	orr	r3, r3, #9
	strb	r3, [fp, #-7]
	b	.L161
.L200:
	.loc 1 145 0
	ldr	r3, .L312+28
.LPIC22:
	add	r3, pc, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	b	.L161
.L201:
	.loc 1 146 0
	mov	r3, #65
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #11
	orr	r3, r3, #4
	strb	r3, [fp, #-7]
	b	.L161
.L202:
	.loc 1 147 0
	ldr	r3, .L312+32
.LPIC23:
	add	r3, pc, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	b	.L161
.L203:
	.loc 1 148 0
	mov	r3, #65
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #8
	orr	r3, r3, #7
	strb	r3, [fp, #-7]
	b	.L161
.L204:
	.loc 1 149 0
	ldr	r3, .L312+36
.LPIC24:
	add	r3, pc, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	b	.L161
.L205:
	.loc 1 150 0
	ldr	r3, [fp, #-20]
	and	r3, r3, #4194304
	cmp	r3, #0
	beq	.L209
	.loc 1 150 0 is_stmt 0 discriminator 1
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #14
	orr	r3, r3, #1
	strb	r3, [fp, #-7]
	b	.L161
.L209:
	.loc 1 150 0 discriminator 2
	ldr	r3, [fp, #-20]
	and	r3, r3, #2097152
	cmp	r3, #0
	beq	.L211
	.loc 1 150 0 discriminator 3
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #14
	orr	r3, r3, #1
	strb	r3, [fp, #-7]
	b	.L161
.L211:
	.loc 1 150 0 discriminator 4
	ldr	r3, .L312+40
.LPIC25:
	add	r3, pc, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	b	.L161
.L206:
	.loc 1 151 0 is_stmt 1
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	orr	r3, r3, #15
	strb	r3, [fp, #-7]
	b	.L161
.L207:
	.loc 1 152 0
	mov	r3, #65
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #13
	orr	r3, r3, #2
	strb	r3, [fp, #-7]
	b	.L161
.L208:
	.loc 1 153 0
	ldr	r3, [fp, #-20]
	and	r3, r3, #32768
	cmp	r3, #0
	beq	.L212
	.loc 1 153 0 is_stmt 0 discriminator 1
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #6
	orr	r3, r3, #9
	strb	r3, [fp, #-7]
	b	.L161
.L212:
	.loc 1 153 0 discriminator 2
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #11
	orr	r3, r3, #4
	strb	r3, [fp, #-7]
	b	.L161
.L166:
	.loc 1 156 0 is_stmt 1
	ldrb	r3, [fp, #-15]
	and	r3, r3, #15
	and	r3, r3, #255
	sub	r3, r3, #1
	cmp	r3, #14
	addls	pc, pc, r3, asl #2
	b	.L214
.L216:
	b	.L215
	b	.L217
	b	.L218
	b	.L219
	b	.L220
	b	.L221
	b	.L222
	b	.L223
	b	.L224
	b	.L225
	b	.L226
	b	.L227
	b	.L228
	b	.L229
	b	.L230
	.p2align 1
.L214:
	.loc 1 157 0
	mov	r3, #66
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #12
	orr	r3, r3, #3
	strb	r3, [fp, #-7]
	b	.L161
.L215:
	.loc 1 158 0
	ldr	r3, [fp, #-20]
	and	r3, r3, #4194304
	cmp	r3, #0
	beq	.L231
	.loc 1 158 0 is_stmt 0 discriminator 1
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #14
	orr	r3, r3, #1
	strb	r3, [fp, #-7]
	b	.L161
.L231:
	.loc 1 158 0 discriminator 2
	ldr	r3, [fp, #-20]
	and	r3, r3, #2097152
	cmp	r3, #0
	beq	.L233
	.loc 1 158 0 discriminator 3
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #14
	orr	r3, r3, #1
	strb	r3, [fp, #-7]
	b	.L161
.L233:
	.loc 1 158 0 discriminator 4
	ldr	r3, .L312+44
.LPIC26:
	add	r3, pc, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	b	.L161
.L217:
	.loc 1 159 0 is_stmt 1
	ldr	r3, .L312+48
.LPIC27:
	add	r3, pc, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	b	.L161
.L218:
	.loc 1 160 0
	ldr	r3, [fp, #-20]
	and	r3, r3, #262144
	cmp	r3, #0
	beq	.L234
	.loc 1 160 0 is_stmt 0 discriminator 1
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #10
	orr	r3, r3, #5
	strb	r3, [fp, #-7]
	b	.L161
.L234:
	.loc 1 160 0 discriminator 2
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #8
	orr	r3, r3, #7
	strb	r3, [fp, #-7]
	b	.L161
.L219:
	.loc 1 161 0 is_stmt 1
	ldr	r3, [fp, #-20]
	and	r3, r3, #64
	cmp	r3, #0
	beq	.L236
	.loc 1 161 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-20]
	and	r3, r3, #32
	cmp	r3, #0
	beq	.L237
	.loc 1 161 0 discriminator 3
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #5
	orr	r3, r3, #10
	strb	r3, [fp, #-7]
	b	.L161
.L237:
	.loc 1 161 0 discriminator 4
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #13
	orr	r3, r3, #2
	strb	r3, [fp, #-7]
	b	.L161
.L236:
	.loc 1 161 0 discriminator 2
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #1
	orr	r3, r3, #14
	strb	r3, [fp, #-7]
	b	.L161
.L220:
	.loc 1 162 0 is_stmt 1
	mov	r3, #66
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #1
	orr	r3, r3, #14
	strb	r3, [fp, #-7]
	b	.L161
.L221:
	.loc 1 163 0
	ldr	r3, [fp, #-20]
	and	r3, r3, #32
	cmp	r3, #0
	beq	.L240
	.loc 1 163 0 is_stmt 0 discriminator 1
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #5
	orr	r3, r3, #10
	strb	r3, [fp, #-7]
	b	.L161
.L240:
	.loc 1 163 0 discriminator 2
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #13
	orr	r3, r3, #2
	strb	r3, [fp, #-7]
	b	.L161
.L222:
	.loc 1 164 0 is_stmt 1
	ldr	r3, [fp, #-20]
	and	r3, r3, #8
	cmp	r3, #0
	beq	.L242
	.loc 1 164 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-20]
	and	r3, r3, #4
	cmp	r3, #0
	beq	.L243
	.loc 1 164 0 discriminator 3
	mov	r3, #65
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #9
	orr	r3, r3, #6
	strb	r3, [fp, #-7]
	b	.L161
.L243:
	.loc 1 164 0 discriminator 4
	ldr	r3, [fp, #-20]
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L245
	.loc 1 164 0 discriminator 5
	mov	r3, #65
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #7
	orr	r3, r3, #8
	strb	r3, [fp, #-7]
	b	.L161
.L245:
	.loc 1 164 0 discriminator 6
	mov	r3, #65
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #4
	orr	r3, r3, #11
	strb	r3, [fp, #-7]
	b	.L161
.L242:
	.loc 1 164 0 discriminator 2
	mov	r3, #65
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #10
	orr	r3, r3, #5
	strb	r3, [fp, #-7]
	b	.L161
.L223:
	.loc 1 165 0 is_stmt 1
	mov	r3, #66
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #1
	orr	r3, r3, #14
	strb	r3, [fp, #-7]
	b	.L161
.L224:
	.loc 1 166 0
	ldr	r3, [fp, #-20]
	and	r3, r3, #65536
	cmp	r3, #0
	beq	.L247
	.loc 1 166 0 is_stmt 0 discriminator 1
	mov	r3, #66
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #13
	orr	r3, r3, #2
	strb	r3, [fp, #-7]
	b	.L161
.L247:
	.loc 1 166 0 discriminator 2
	mov	r3, #66
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #15
	strb	r3, [fp, #-7]
	b	.L161
.L225:
	.loc 1 167 0 is_stmt 1
	ldr	r3, [fp, #-20]
	and	r3, r3, #8192
	cmp	r3, #0
	beq	.L249
	.loc 1 167 0 is_stmt 0 discriminator 1
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	orr	r3, r3, #15
	strb	r3, [fp, #-7]
	b	.L161
.L249:
	.loc 1 167 0 discriminator 2
	mov	r3, #66
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #11
	orr	r3, r3, #4
	strb	r3, [fp, #-7]
	b	.L161
.L226:
	.loc 1 168 0 is_stmt 1
	mov	r3, #65
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #12
	orr	r3, r3, #3
	strb	r3, [fp, #-7]
	b	.L161
.L227:
	.loc 1 169 0
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #9
	orr	r3, r3, #6
	strb	r3, [fp, #-7]
	b	.L161
.L228:
	.loc 1 170 0
	ldr	r3, [fp, #-20]
	and	r3, r3, #2048
	cmp	r3, #0
	beq	.L251
	.loc 1 170 0 is_stmt 0 discriminator 1
	mov	r3, #65
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #12
	orr	r3, r3, #3
	strb	r3, [fp, #-7]
	b	.L161
.L251:
	.loc 1 170 0 discriminator 2
	ldr	r3, [fp, #-20]
	and	r3, r3, #4096
	cmp	r3, #0
	beq	.L253
	.loc 1 170 0 discriminator 3
	ldr	r3, [fp, #-20]
	and	r3, r3, #16
	cmp	r3, #0
	beq	.L254
	.loc 1 170 0 discriminator 5
	mov	r3, #65
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #2
	orr	r3, r3, #13
	strb	r3, [fp, #-7]
	b	.L161
.L254:
	.loc 1 170 0 discriminator 6
	mov	r3, #65
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #1
	orr	r3, r3, #14
	strb	r3, [fp, #-7]
	b	.L161
.L253:
	.loc 1 170 0 discriminator 4
	mov	r3, #65
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #14
	orr	r3, r3, #1
	strb	r3, [fp, #-7]
	b	.L161
.L229:
	.loc 1 171 0 is_stmt 1
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #4
	orr	r3, r3, #11
	strb	r3, [fp, #-7]
	b	.L161
.L230:
	.loc 1 172 0
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #10
	orr	r3, r3, #5
	strb	r3, [fp, #-7]
	b	.L161
.L167:
	.loc 1 175 0
	ldrb	r3, [fp, #-15]
	and	r3, r3, #15
	and	r3, r3, #255
	sub	r3, r3, #1
	cmp	r3, #14
	addls	pc, pc, r3, asl #2
	b	.L256
.L258:
	b	.L257
	b	.L259
	b	.L260
	b	.L261
	b	.L262
	b	.L263
	b	.L264
	b	.L265
	b	.L266
	b	.L267
	b	.L268
	b	.L269
	b	.L270
	b	.L271
	b	.L272
	.p2align 1
.L256:
	.loc 1 176 0
	ldr	r3, [fp, #-20]
	and	r3, r3, #1048576
	cmp	r3, #0
	beq	.L273
	.loc 1 176 0 is_stmt 0 discriminator 1
	mov	r3, #66
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #2
	orr	r3, r3, #13
	strb	r3, [fp, #-7]
	b	.L161
.L273:
	.loc 1 176 0 discriminator 2
	ldr	r3, [fp, #-20]
	and	r3, r3, #524288
	cmp	r3, #0
	beq	.L275
	.loc 1 176 0 discriminator 3
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #15
	strb	r3, [fp, #-7]
	b	.L161
.L275:
	.loc 1 176 0 discriminator 4
	ldr	r3, .L312+52
.LPIC28:
	add	r3, pc, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	b	.L161
.L257:
	.loc 1 177 0 is_stmt 1
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #12
	orr	r3, r3, #3
	strb	r3, [fp, #-7]
	b	.L161
.L259:
	.loc 1 178 0
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #11
	orr	r3, r3, #4
	strb	r3, [fp, #-7]
	b	.L161
.L260:
	.loc 1 179 0
	mov	r3, #66
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #10
	orr	r3, r3, #5
	strb	r3, [fp, #-7]
	b	.L161
.L261:
	.loc 1 180 0
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #10
	orr	r3, r3, #5
	strb	r3, [fp, #-7]
	b	.L161
.L262:
	.loc 1 181 0
	ldr	r3, [fp, #-20]
	and	r3, r3, #256
	cmp	r3, #0
	beq	.L276
	.loc 1 181 0 is_stmt 0 discriminator 1
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #6
	orr	r3, r3, #9
	strb	r3, [fp, #-7]
	b	.L161
.L276:
	.loc 1 181 0 discriminator 2
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #7
	orr	r3, r3, #8
	strb	r3, [fp, #-7]
	b	.L161
.L263:
	.loc 1 182 0 is_stmt 1
	ldr	r3, [fp, #-20]
	and	r3, r3, #256
	cmp	r3, #0
	beq	.L278
	.loc 1 182 0 is_stmt 0 discriminator 1
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #6
	orr	r3, r3, #9
	strb	r3, [fp, #-7]
	b	.L161
.L278:
	.loc 1 182 0 discriminator 2
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #7
	orr	r3, r3, #8
	strb	r3, [fp, #-7]
	b	.L161
.L264:
	.loc 1 183 0 is_stmt 1
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #8
	orr	r3, r3, #7
	strb	r3, [fp, #-7]
	b	.L161
.L265:
	.loc 1 184 0
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #4
	orr	r3, r3, #11
	strb	r3, [fp, #-7]
	b	.L161
.L266:
	.loc 1 185 0
	ldr	r3, [fp, #-20]
	and	r3, r3, #512
	cmp	r3, #0
	beq	.L280
	.loc 1 185 0 is_stmt 0 discriminator 1
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #11
	orr	r3, r3, #4
	strb	r3, [fp, #-7]
	b	.L161
.L280:
	.loc 1 185 0 discriminator 2
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #8
	orr	r3, r3, #7
	strb	r3, [fp, #-7]
	b	.L161
.L267:
	.loc 1 186 0 is_stmt 1
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	orr	r3, r3, #15
	strb	r3, [fp, #-7]
	b	.L161
.L268:
	.loc 1 187 0
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #5
	orr	r3, r3, #10
	strb	r3, [fp, #-7]
	b	.L161
.L269:
	.loc 1 188 0
	mov	r3, #66
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #14
	orr	r3, r3, #1
	strb	r3, [fp, #-7]
	b	.L161
.L270:
	.loc 1 189 0
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #2
	orr	r3, r3, #13
	strb	r3, [fp, #-7]
	b	.L161
.L271:
	.loc 1 190 0
	mov	r3, #66
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #3
	orr	r3, r3, #12
	strb	r3, [fp, #-7]
	b	.L161
.L272:
	.loc 1 191 0
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #2
	orr	r3, r3, #13
	strb	r3, [fp, #-7]
	b	.L161
.L168:
	.loc 1 194 0
	ldrb	r3, [fp, #-15]
	and	r3, r3, #15
	and	r3, r3, #255
	sub	r3, r3, #1
	cmp	r3, #14
	addls	pc, pc, r3, asl #2
	b	.L282
.L284:
	b	.L283
	b	.L285
	b	.L286
	b	.L287
	b	.L288
	b	.L289
	b	.L290
	b	.L291
	b	.L292
	b	.L293
	b	.L294
	b	.L295
	b	.L296
	b	.L297
	b	.L298
	.p2align 1
.L282:
	.loc 1 195 0
	ldr	r3, [fp, #-20]
	and	r3, r3, #1048576
	cmp	r3, #0
	beq	.L299
	.loc 1 195 0 is_stmt 0 discriminator 1
	mov	r3, #66
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #2
	orr	r3, r3, #13
	strb	r3, [fp, #-7]
	b	.L161
.L299:
	.loc 1 195 0 discriminator 2
	ldr	r3, [fp, #-20]
	and	r3, r3, #524288
	cmp	r3, #0
	beq	.L301
	.loc 1 195 0 discriminator 3
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #15
	strb	r3, [fp, #-7]
	b	.L161
.L301:
	.loc 1 195 0 discriminator 4
	ldr	r3, .L312+56
.LPIC29:
	add	r3, pc, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	b	.L161
.L283:
	.loc 1 196 0 is_stmt 1
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #1
	orr	r3, r3, #14
	strb	r3, [fp, #-7]
	b	.L161
.L285:
	.loc 1 197 0
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #15
	strb	r3, [fp, #-7]
	b	.L161
.L286:
	.loc 1 198 0
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #11
	orr	r3, r3, #4
	strb	r3, [fp, #-7]
	b	.L161
.L287:
	.loc 1 199 0
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #10
	orr	r3, r3, #5
	strb	r3, [fp, #-7]
	b	.L161
.L288:
	.loc 1 200 0
	ldr	r3, [fp, #-20]
	and	r3, r3, #1024
	cmp	r3, #0
	beq	.L302
	.loc 1 200 0 is_stmt 0 discriminator 1
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #13
	orr	r3, r3, #2
	strb	r3, [fp, #-7]
	b	.L161
.L302:
	.loc 1 200 0 discriminator 2
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #12
	orr	r3, r3, #3
	strb	r3, [fp, #-7]
	b	.L161
.L289:
	.loc 1 201 0 is_stmt 1
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #9
	orr	r3, r3, #6
	strb	r3, [fp, #-7]
	b	.L161
.L313:
	.align	2
.L312:
	.word	.LC0-(.LPIC15+8)
	.word	isA-(.LPIC16+8)
	.word	.LC0-(.LPIC17+8)
	.word	.LC0-(.LPIC18+8)
	.word	isA-(.LPIC19+8)
	.word	.LC0-(.LPIC20+8)
	.word	.LC0-(.LPIC21+8)
	.word	.LC0-(.LPIC22+8)
	.word	.LC0-(.LPIC23+8)
	.word	.LC0-(.LPIC24+8)
	.word	.LC0-(.LPIC25+8)
	.word	.LC0-(.LPIC26+8)
	.word	.LC0-(.LPIC27+8)
	.word	.LC0-(.LPIC28+8)
	.word	.LC0-(.LPIC29+8)
.L290:
	.loc 1 202 0
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #2
	orr	r3, r3, #13
	strb	r3, [fp, #-7]
	b	.L161
.L291:
	.loc 1 203 0
	ldr	r3, [fp, #-20]
	and	r3, r3, #512
	cmp	r3, #0
	beq	.L304
	.loc 1 203 0 is_stmt 0 discriminator 1
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #11
	orr	r3, r3, #4
	strb	r3, [fp, #-7]
	b	.L161
.L304:
	.loc 1 203 0 discriminator 2
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #8
	orr	r3, r3, #7
	strb	r3, [fp, #-7]
	b	.L161
.L292:
	.loc 1 204 0 is_stmt 1
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #3
	orr	r3, r3, #12
	strb	r3, [fp, #-7]
	b	.L161
.L293:
	.loc 1 205 0
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #6
	orr	r3, r3, #9
	strb	r3, [fp, #-7]
	b	.L161
.L294:
	.loc 1 206 0
	ldr	r3, [fp, #-20]
	and	r3, r3, #128
	cmp	r3, #0
	beq	.L306
	.loc 1 206 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-20]
	and	r3, r3, #262144
	cmp	r3, #0
	beq	.L307
	.loc 1 206 0 discriminator 3
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #10
	orr	r3, r3, #5
	strb	r3, [fp, #-7]
	b	.L161
.L307:
	.loc 1 206 0 discriminator 4
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #8
	orr	r3, r3, #7
	strb	r3, [fp, #-7]
	b	.L161
.L306:
	.loc 1 206 0 discriminator 2
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #5
	orr	r3, r3, #10
	strb	r3, [fp, #-7]
	b	.L161
.L295:
	.loc 1 207 0 is_stmt 1
	ldr	r3, [fp, #-20]
	and	r3, r3, #131072
	cmp	r3, #0
	beq	.L310
	.loc 1 207 0 is_stmt 0 discriminator 1
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #1
	orr	r3, r3, #14
	strb	r3, [fp, #-7]
	b	.L161
.L310:
	.loc 1 207 0 discriminator 2
	mov	r3, #68
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #3
	orr	r3, r3, #12
	strb	r3, [fp, #-7]
	b	.L161
.L296:
	.loc 1 208 0 is_stmt 1
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #7
	orr	r3, r3, #8
	strb	r3, [fp, #-7]
	b	.L161
.L297:
	.loc 1 209 0
	mov	r3, #67
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #4
	orr	r3, r3, #11
	strb	r3, [fp, #-7]
	b	.L161
.L298:
	.loc 1 210 0
	mov	r3, #69
	sub	r3, r3, #65
	and	r3, r3, #255
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-7]
	bic	r3, r3, #15
	strb	r3, [fp, #-7]
.L161:
	mov	r3, #0
	ldrb	r2, [fp, #-8]	@ zero_extendqisi2
	and	r2, r2, #255
	bic	r3, r3, #255
	orr	r3, r2, r3
	ldrb	r2, [fp, #-7]	@ zero_extendqisi2
	and	r2, r2, #255
	bic	r3, r3, #65280
	lsl	r2, r2, #8
	orr	r3, r2, r3
	.loc 1 215 0 discriminator 25
	mov	r0, r3	@ movhi
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE2:
	.size	getNextSensor, .-getNextSensor
	.align	2
	.global	getReverseSensor
	.syntax unified
	.arm
	.fpu softvfp
	.type	getReverseSensor, %function
getReverseSensor:
.LFB3:
	.loc 1 218 0
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
	strh	r0, [fp, #-16]	@ movhi
	.loc 1 219 0
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #5
	bne	.L315
	.loc 1 219 0 is_stmt 0 discriminator 1
	ldrh	r3, [fp, #-16]	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	b	.L319
.L315:
	.loc 1 221 0 is_stmt 1
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	strb	r3, [fp, #-12]
	.loc 1 222 0
	ldrb	r3, [fp, #-15]
	and	r3, r3, #15
	and	r3, r3, #255
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L317
	.loc 1 223 0
	ldrb	r3, [fp, #-15]
	and	r3, r3, #15
	and	r3, r3, #255
	add	r3, r3, #1
	and	r3, r3, #255
	and	r3, r3, #15
	and	r2, r3, #255
	ldrb	r3, [fp, #-11]
	and	r2, r2, #15
	bic	r3, r3, #15
	orr	r3, r2, r3
	strb	r3, [fp, #-11]
	b	.L318
.L317:
	.loc 1 225 0
	ldrb	r3, [fp, #-15]
	and	r3, r3, #15
	and	r3, r3, #255
	sub	r3, r3, #1
	and	r3, r3, #255
	and	r3, r3, #15
	and	r2, r3, #255
	ldrb	r3, [fp, #-11]
	and	r2, r2, #15
	bic	r3, r3, #15
	orr	r3, r2, r3
	strb	r3, [fp, #-11]
.L318:
	.loc 1 226 0
	ldrh	r3, [fp, #-12]	@ movhi
	strh	r3, [fp, #-8]	@ movhi
.L319:
	mov	r3, #0
	ldrb	r2, [fp, #-8]	@ zero_extendqisi2
	and	r2, r2, #255
	bic	r3, r3, #255
	orr	r3, r2, r3
	ldrb	r2, [fp, #-7]	@ zero_extendqisi2
	and	r2, r2, #255
	bic	r3, r3, #65280
	lsl	r2, r2, #8
	orr	r3, r2, r3
	.loc 1 227 0 discriminator 1
	mov	r0, r3	@ movhi
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE3:
	.size	getReverseSensor, .-getReverseSensor
	.align	2
	.global	getDistanceFromPrev
	.syntax unified
	.arm
	.fpu softvfp
	.type	getDistanceFromPrev, %function
getDistanceFromPrev:
.LFB4:
	.loc 1 230 0
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
	strh	r0, [fp, #-8]	@ movhi
	str	r1, [fp, #-12]
	.loc 1 231 0
	ldrb	r3, [fp, #-8]	@ zero_extendqisi2
	cmp	r3, #5
	bne	.L321
	.loc 1 231 0 is_stmt 0 discriminator 1
	mvn	r3, #0
	b	.L322
.L321:
	.loc 1 232 0 is_stmt 1
	ldrb	r3, [fp, #-8]	@ zero_extendqisi2
	cmp	r3, #4
	addls	pc, pc, r3, asl #2
	b	.L323
.L325:
	b	.L324
	b	.L326
	b	.L327
	b	.L328
	b	.L329
	.p2align 1
.L323:
	.loc 1 233 0
	mvn	r3, #0
	b	.L322
.L324:
	.loc 1 235 0
	ldrb	r3, [fp, #-7]
	and	r3, r3, #15
	and	r3, r3, #255
	sub	r3, r3, #1
	cmp	r3, #14
	addls	pc, pc, r3, asl #2
	b	.L330
.L332:
	b	.L331
	b	.L333
	b	.L334
	b	.L335
	b	.L336
	b	.L337
	b	.L338
	b	.L339
	b	.L340
	b	.L341
	b	.L342
	b	.L343
	b	.L344
	b	.L345
	b	.L346
	.p2align 1
.L330:
	.loc 1 236 0
	mvn	r3, #0
	b	.L322
.L331:
	.loc 1 237 0
	mov	r3, #468
	b	.L322
.L333:
	.loc 1 238 0
	mov	r3, #440
	b	.L322
.L334:
	.loc 1 239 0
	ldr	r3, [fp, #-12]
	and	r3, r3, #16384
	cmp	r3, #0
	beq	.L347
	.loc 1 239 0 is_stmt 0 discriminator 1
	mov	r3, #376
	b	.L322
.L347:
	.loc 1 239 0 discriminator 2
	ldr	r3, .L499
	b	.L322
.L335:
	.loc 1 240 0 is_stmt 1
	ldr	r3, .L499+4
	b	.L322
.L336:
	.loc 1 241 0
	ldr	r3, .L499+8
	b	.L322
.L337:
	.loc 1 242 0
	ldr	r3, .L499+12
	b	.L322
.L338:
	.loc 1 243 0
	ldr	r3, .L499+16
	b	.L322
.L339:
	.loc 1 244 0
	ldr	r3, .L499+16
	b	.L322
.L340:
	.loc 1 245 0
	ldr	r3, .L499+20
	b	.L322
.L341:
	.loc 1 246 0
	ldr	r3, .L499+24
.LPIC30:
	add	r3, pc, r3
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L349
	.loc 1 246 0 is_stmt 0 discriminator 1
	mvn	r3, #0
	b	.L322
.L349:
	.loc 1 246 0 discriminator 2
	ldr	r3, .L499+28
	b	.L322
.L342:
	.loc 1 247 0 is_stmt 1
	ldr	r3, .L499+32
.LPIC31:
	add	r3, pc, r3
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L351
	.loc 1 247 0 is_stmt 0 discriminator 1
	mov	r3, #928
	b	.L322
.L351:
	.loc 1 247 0 discriminator 2
	ldr	r3, .L499+36
	b	.L322
.L343:
	.loc 1 248 0 is_stmt 1
	mvn	r3, #0
	b	.L322
.L344:
	.loc 1 249 0
	ldr	r3, .L499+40
	b	.L322
.L345:
	.loc 1 250 0
	ldr	r3, .L499+44
	b	.L322
.L346:
	.loc 1 251 0
	ldr	r3, .L499+48
.LPIC32:
	add	r3, pc, r3
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L353
	.loc 1 251 0 is_stmt 0 discriminator 1
	mvn	r3, #0
	b	.L322
.L353:
	.loc 1 251 0 discriminator 2
	ldr	r3, .L499+28
	b	.L322
.L326:
	.loc 1 254 0 is_stmt 1
	ldrb	r3, [fp, #-7]
	and	r3, r3, #15
	and	r3, r3, #255
	sub	r3, r3, #1
	cmp	r3, #14
	addls	pc, pc, r3, asl #2
	b	.L355
.L357:
	b	.L356
	b	.L358
	b	.L359
	b	.L360
	b	.L361
	b	.L362
	b	.L363
	b	.L364
	b	.L365
	b	.L366
	b	.L367
	b	.L368
	b	.L369
	b	.L370
	b	.L371
	.p2align 1
.L355:
	.loc 1 255 0
	ldr	r3, .L499+52
	b	.L322
.L356:
	.loc 1 256 0
	ldr	r3, .L499+56
	b	.L322
.L358:
	.loc 1 257 0
	ldr	r3, .L499+60
	b	.L322
.L359:
	.loc 1 258 0
	mov	r3, #230
	b	.L322
.L360:
	.loc 1 259 0
	ldr	r3, .L499+64
	b	.L322
.L361:
	.loc 1 260 0
	ldr	r3, .L499+68
	b	.L322
.L362:
	.loc 1 261 0
	mvn	r3, #0
	b	.L322
.L363:
	.loc 1 262 0
	ldr	r3, .L499+20
	b	.L322
.L364:
	.loc 1 263 0
	mvn	r3, #0
	b	.L322
.L365:
	.loc 1 264 0
	ldr	r3, .L499+4
	b	.L322
.L366:
	.loc 1 265 0
	mvn	r3, #0
	b	.L322
.L367:
	.loc 1 266 0
	ldr	r3, .L499+16
	b	.L322
.L368:
	.loc 1 267 0
	mov	r3, #202
	b	.L322
.L369:
	.loc 1 268 0
	ldr	r3, [fp, #-12]
	and	r3, r3, #4194304
	cmp	r3, #0
	bne	.L372
	.loc 1 268 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-12]
	and	r3, r3, #2097152
	cmp	r3, #0
	beq	.L373
	.loc 1 268 0 discriminator 3
	ldr	r3, .L499+72
	b	.L322
.L373:
	.loc 1 268 0 discriminator 4
	mvn	r3, #0
	b	.L322
.L372:
	.loc 1 268 0 discriminator 2
	ldr	r3, .L499+76
	b	.L322
.L370:
	.loc 1 269 0 is_stmt 1
	ldr	r3, [fp, #-12]
	and	r3, r3, #32768
	cmp	r3, #0
	beq	.L376
	.loc 1 269 0 is_stmt 0 discriminator 1
	ldr	r3, .L499+80
	b	.L322
.L376:
	.loc 1 269 0 discriminator 2
	ldr	r3, .L499+84
	b	.L322
.L371:
	.loc 1 270 0 is_stmt 1
	mov	r3, #440
	b	.L322
.L327:
	.loc 1 273 0
	ldrb	r3, [fp, #-7]
	and	r3, r3, #15
	and	r3, r3, #255
	sub	r3, r3, #1
	cmp	r3, #14
	addls	pc, pc, r3, asl #2
	b	.L378
.L380:
	b	.L379
	b	.L381
	b	.L382
	b	.L383
	b	.L384
	b	.L385
	b	.L386
	b	.L387
	b	.L388
	b	.L389
	b	.L390
	b	.L391
	b	.L392
	b	.L393
	b	.L394
	.p2align 1
.L378:
	.loc 1 274 0
	ldr	r3, [fp, #-12]
	and	r3, r3, #4194304
	cmp	r3, #0
	beq	.L395
	.loc 1 274 0 is_stmt 0 discriminator 1
	ldr	r3, .L499+88
	b	.L322
.L395:
	.loc 1 274 0 discriminator 2
	mvn	r3, #0
	b	.L322
.L379:
	.loc 1 275 0 is_stmt 1
	mov	r3, #230
	b	.L322
.L381:
	.loc 1 276 0
	ldr	r3, [fp, #-12]
	and	r3, r3, #262144
	cmp	r3, #0
	beq	.L397
	.loc 1 276 0 is_stmt 0 discriminator 1
	ldr	r3, .L499+92
	b	.L322
.L397:
	.loc 1 276 0 discriminator 2
	mov	r3, #628
	b	.L322
.L382:
	.loc 1 277 0 is_stmt 1
	mvn	r3, #0
	b	.L322
.L383:
	.loc 1 278 0
	ldr	r3, .L499+84
	b	.L322
.L384:
	.loc 1 279 0
	ldr	r3, [fp, #-12]
	and	r3, r3, #64
	cmp	r3, #0
	beq	.L399
	.loc 1 279 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-12]
	and	r3, r3, #32
	cmp	r3, #0
	beq	.L400
	.loc 1 279 0 discriminator 3
	ldr	r3, .L499+96
	b	.L322
.L400:
	.loc 1 279 0 discriminator 4
	ldr	r3, .L499+92
	b	.L322
.L399:
	.loc 1 279 0 discriminator 2
	ldr	r3, .L499+100
	b	.L322
.L385:
	.loc 1 280 0 is_stmt 1
	ldr	r3, [fp, #-12]
	and	r3, r3, #8
	cmp	r3, #0
	beq	.L403
	.loc 1 280 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-12]
	and	r3, r3, #4
	cmp	r3, #0
	bne	.L404
	.loc 1 280 0 discriminator 3
	ldr	r3, [fp, #-12]
	and	r3, r3, #2
	cmp	r3, #0
	bne	.L405
	.loc 1 280 0 discriminator 5
	ldr	r3, .L499+104
.LPIC33:
	add	r3, pc, r3
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L406
	.loc 1 280 0 discriminator 7
	mov	r3, #928
	b	.L322
.L406:
	.loc 1 280 0 discriminator 8
	ldr	r3, .L499+36
	b	.L322
.L405:
	.loc 1 280 0 discriminator 6
	mov	r3, #728
	b	.L322
.L404:
	.loc 1 280 0 discriminator 4
	ldr	r3, .L499+12
	b	.L322
.L403:
	.loc 1 280 0 discriminator 2
	ldr	r3, .L499+8
	b	.L322
.L386:
	.loc 1 281 0 is_stmt 1
	ldr	r3, [fp, #-12]
	and	r3, r3, #32
	cmp	r3, #0
	beq	.L411
	.loc 1 281 0 is_stmt 0 discriminator 1
	ldr	r3, .L499+108
	b	.L322
.L411:
	.loc 1 281 0 discriminator 2
	mov	r3, #628
	b	.L322
.L387:
	.loc 1 282 0 is_stmt 1
	ldr	r3, [fp, #-12]
	and	r3, r3, #65536
	cmp	r3, #0
	beq	.L413
	.loc 1 282 0 is_stmt 0 discriminator 1
	ldr	r3, .L499+60
	b	.L322
.L413:
	.loc 1 282 0 discriminator 2
	ldr	r3, .L499+52
	b	.L322
.L388:
	.loc 1 283 0 is_stmt 1
	ldr	r3, .L499+80
	b	.L322
.L389:
	.loc 1 284 0
	mov	r3, #376
	b	.L322
.L390:
	.loc 1 285 0
	ldr	r3, [fp, #-12]
	and	r3, r3, #8192
	cmp	r3, #0
	beq	.L415
	.loc 1 285 0 is_stmt 0 discriminator 1
	ldr	r3, .L499+112
	b	.L322
.L415:
	.loc 1 285 0 discriminator 2
	ldr	r3, .L499+64
	b	.L322
.L391:
	.loc 1 286 0 is_stmt 1
	ldr	r3, [fp, #-12]
	and	r3, r3, #2048
	cmp	r3, #0
	bne	.L417
	.loc 1 286 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-12]
	and	r3, r3, #4096
	cmp	r3, #0
	beq	.L418
	.loc 1 286 0 discriminator 3
	ldr	r3, [fp, #-12]
	and	r3, r3, #16
	cmp	r3, #0
	bne	.L419
	.loc 1 286 0 discriminator 5
	ldr	r3, .L499+116
.LPIC34:
	add	r3, pc, r3
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L420
	.loc 1 286 0 discriminator 7
	ldr	r3, .L499+120
	b	.L322
.L420:
	.loc 1 286 0 discriminator 8
	ldr	r3, .L499+44
	b	.L322
.L419:
	.loc 1 286 0 discriminator 6
	ldr	r3, .L499+40
	b	.L322
.L418:
	.loc 1 286 0 discriminator 4
	mov	r3, #468
	b	.L322
.L417:
	.loc 1 286 0 discriminator 2
	ldr	r3, .L499
	b	.L322
.L392:
	.loc 1 287 0 is_stmt 1
	ldr	r3, .L499+124
.LPIC35:
	add	r3, pc, r3
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L425
	.loc 1 287 0 is_stmt 0 discriminator 1
	ldr	r3, .L499+128
	b	.L322
.L425:
	.loc 1 287 0 discriminator 2
	ldr	r3, .L499+132
	b	.L322
.L393:
	.loc 1 288 0 is_stmt 1
	ldr	r3, .L499+100
	b	.L322
.L394:
	.loc 1 289 0
	ldr	r3, .L499+68
	b	.L322
.L328:
	.loc 1 292 0
	ldrb	r3, [fp, #-7]
	and	r3, r3, #15
	and	r3, r3, #255
	sub	r3, r3, #1
	cmp	r3, #14
	addls	pc, pc, r3, asl #2
	b	.L427
.L429:
	b	.L428
	b	.L430
	b	.L431
	b	.L432
	b	.L433
	b	.L434
	b	.L435
	b	.L436
	b	.L437
	b	.L438
	b	.L439
	b	.L440
	b	.L441
	b	.L442
	b	.L443
	.p2align 1
.L427:
	.loc 1 293 0
	mov	r3, #200
	b	.L322
.L428:
	.loc 1 294 0
	ldr	r3, [fp, #-12]
	and	r3, r3, #1048576
	cmp	r3, #0
	bne	.L444
	.loc 1 294 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-12]
	and	r3, r3, #524288
	cmp	r3, #0
	beq	.L445
	.loc 1 294 0 discriminator 3
	ldr	r3, .L499+136
	b	.L322
.L445:
	.loc 1 294 0 discriminator 4
	mvn	r3, #0
	b	.L322
.L444:
	.loc 1 294 0 discriminator 2
	ldr	r3, .L499+72
	b	.L322
.L430:
	.loc 1 295 0 is_stmt 1
	ldr	r3, .L499+68
	b	.L322
.L431:
	.loc 1 296 0
	ldr	r3, .L499+140
	b	.L322
.L432:
	.loc 1 297 0
	ldr	r3, [fp, #-12]
	and	r3, r3, #256
	cmp	r3, #0
	beq	.L448
	.loc 1 297 0 is_stmt 0 discriminator 1
	ldr	r3, .L499+144
	b	.L322
.L448:
	.loc 1 297 0 discriminator 2
	ldr	r3, .L499+148
	b	.L322
.L433:
	.loc 1 298 0 is_stmt 1
	ldr	r3, .L499+152
.LPIC36:
	add	r3, pc, r3
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L450
	.loc 1 298 0 is_stmt 0 discriminator 1
	ldr	r3, .L499+80
	b	.L322
.L450:
	.loc 1 298 0 discriminator 2
	ldr	r3, .L499+156
	b	.L322
.L434:
	.loc 1 299 0 is_stmt 1
	ldr	r3, .L499+80
	b	.L322
.L435:
	.loc 1 300 0
	ldr	r3, [fp, #-12]
	and	r3, r3, #256
	cmp	r3, #0
	beq	.L452
	.loc 1 300 0 is_stmt 0 discriminator 1
	ldr	r3, .L499+160
	b	.L322
.L452:
	.loc 1 300 0 discriminator 2
	ldr	r3, .L499+28
	b	.L322
.L436:
	.loc 1 301 0 is_stmt 1
	ldr	r3, [fp, #-12]
	and	r3, r3, #512
	cmp	r3, #0
	beq	.L454
	.loc 1 301 0 is_stmt 0 discriminator 1
	ldr	r3, .L499+148
	b	.L322
.L454:
	.loc 1 301 0 discriminator 2
	ldr	r3, .L499+28
	b	.L322
.L437:
	.loc 1 302 0 is_stmt 1
	ldr	r3, .L499+164
.LPIC37:
	add	r3, pc, r3
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L456
	.loc 1 302 0 is_stmt 0 discriminator 1
	ldr	r3, .L499+8
	b	.L322
.L456:
	.loc 1 302 0 discriminator 2
	mov	r3, #284
	b	.L322
.L438:
	.loc 1 303 0 is_stmt 1
	ldr	r3, .L499+168
	b	.L322
.L439:
	.loc 1 304 0
	ldr	r3, .L499+68
	b	.L322
.L440:
	.loc 1 305 0
	ldr	r3, .L499+172
	b	.L322
.L441:
	.loc 1 306 0
	ldr	r3, .L499+56
	b	.L322
.L442:
	.loc 1 307 0
	mov	r3, #292
	b	.L322
.L443:
	.loc 1 308 0
	mov	r3, #202
	b	.L322
.L329:
	.loc 1 311 0
	ldrb	r3, [fp, #-7]
	and	r3, r3, #15
	and	r3, r3, #255
	sub	r3, r3, #1
	cmp	r3, #14
	addls	pc, pc, r3, asl #2
	b	.L458
.L460:
	b	.L459
	b	.L461
	b	.L462
	b	.L463
	b	.L464
	b	.L465
	b	.L466
	b	.L467
	b	.L468
	b	.L469
	b	.L470
	b	.L471
	b	.L472
	b	.L473
	b	.L474
	.p2align 1
.L458:
	.loc 1 312 0
	mov	r3, #203
	b	.L322
.L459:
	.loc 1 313 0
	ldr	r3, [fp, #-12]
	and	r3, r3, #1048576
	cmp	r3, #0
	bne	.L475
	.loc 1 313 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-12]
	and	r3, r3, #524288
	cmp	r3, #0
	beq	.L476
	.loc 1 313 0 discriminator 3
	ldr	r3, .L499+88
	b	.L322
.L476:
	.loc 1 313 0 discriminator 4
	mvn	r3, #0
	b	.L322
.L475:
	.loc 1 313 0 discriminator 2
	ldr	r3, .L499+76
	b	.L322
.L461:
	.loc 1 314 0 is_stmt 1
	ldr	r3, .L499+176
	b	.L322
.L462:
	.loc 1 315 0
	mov	r3, #200
	b	.L322
.L463:
	.loc 1 316 0
	ldr	r3, [fp, #-12]
	and	r3, r3, #1024
	cmp	r3, #0
	beq	.L479
	.loc 1 316 0 is_stmt 0 discriminator 1
	ldr	r3, .L499+176
	b	.L322
.L479:
	.loc 1 316 0 discriminator 2
	ldr	r3, .L499+140
	b	.L322
.L464:
	.loc 1 317 0 is_stmt 1
	ldr	r3, .L499+180
.LPIC38:
	add	r3, pc, r3
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L481
	.loc 1 317 0 is_stmt 0 discriminator 1
	ldr	r3, .L499+80
	b	.L322
.L481:
	.loc 1 317 0 discriminator 2
	ldr	r3, .L499+156
	b	.L322
.L465:
	.loc 1 318 0 is_stmt 1
	ldr	r3, .L499+184
.LPIC39:
	add	r3, pc, r3
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L483
	.loc 1 318 0 is_stmt 0 discriminator 1
	ldr	r3, .L499+128
	b	.L322
.L483:
	.loc 1 318 0 discriminator 2
	ldr	r3, .L499+132
	b	.L322
.L466:
	.loc 1 319 0 is_stmt 1
	ldr	r3, .L499+80
	b	.L322
.L467:
	.loc 1 320 0
	ldr	r3, .L499+188
.LPIC40:
	add	r3, pc, r3
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L485
	.loc 1 320 0 is_stmt 0 discriminator 1
	ldr	r3, .L499+80
	b	.L322
.L485:
	.loc 1 320 0 discriminator 2
	ldr	r3, .L499+156
	b	.L322
.L468:
	.loc 1 321 0 is_stmt 1
	ldr	r3, [fp, #-12]
	and	r3, r3, #512
	cmp	r3, #0
	beq	.L487
	.loc 1 321 0 is_stmt 0 discriminator 1
	ldr	r3, .L499+144
	b	.L322
.L487:
	.loc 1 321 0 discriminator 2
	ldr	r3, .L499+160
	b	.L322
.L469:
	.loc 1 322 0 is_stmt 1
	ldr	r3, [fp, #-12]
	and	r3, r3, #128
	cmp	r3, #0
	beq	.L489
	.loc 1 322 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-12]
	and	r3, r3, #262144
	cmp	r3, #0
	beq	.L490
	.loc 1 322 0 discriminator 3
	ldr	r3, .L499+96
	b	.L322
.L490:
	.loc 1 322 0 discriminator 4
	ldr	r3, .L499+108
	b	.L322
.L489:
	.loc 1 322 0 discriminator 2
	ldr	r3, .L499+168
	b	.L322
.L470:
	.loc 1 323 0 is_stmt 1
	ldr	r3, .L499+192
.LPIC41:
	add	r3, pc, r3
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L493
	.loc 1 323 0 is_stmt 0 discriminator 1
	ldr	r3, .L499+8
	b	.L322
.L493:
	.loc 1 323 0 discriminator 2
	mov	r3, #284
	b	.L322
.L471:
	.loc 1 324 0 is_stmt 1
	ldr	r3, .L499+196
.LPIC42:
	add	r3, pc, r3
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L495
	.loc 1 324 0 is_stmt 0 discriminator 1
	ldr	r3, .L499+80
	b	.L322
.L495:
	.loc 1 324 0 discriminator 2
	ldr	r3, .L499+156
	b	.L322
.L472:
	.loc 1 325 0 is_stmt 1
	ldr	r3, [fp, #-12]
	and	r3, r3, #131072
	cmp	r3, #0
	beq	.L497
	.loc 1 325 0 is_stmt 0 discriminator 1
	mov	r3, #292
	b	.L322
.L497:
	.loc 1 325 0 discriminator 2
	ldr	r3, .L499+172
	b	.L322
.L473:
	.loc 1 326 0 is_stmt 1
	mov	r3, #203
	b	.L322
.L474:
	.loc 1 327 0
	ldr	r3, .L499+112
.L322:
	.loc 1 331 0
	mov	r0, r3
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L500:
	.align	2
.L499:
	.word	567
	.word	649
	.word	361
	.word	538
	.word	473
	.word	289
	.word	isA-(.LPIC30+8)
	.word	774
	.word	isA-(.LPIC31+8)
	.word	783
	.word	650
	.word	695
	.word	isA-(.LPIC32+8)
	.word	371
	.word	398
	.word	366
	.word	354
	.word	405
	.word	507
	.word	478
	.word	375
	.word	481
	.word	506
	.word	830
	.word	1003
	.word	302
	.word	isA-(.LPIC33+8)
	.word	801
	.word	370
	.word	isA-(.LPIC34+8)
	.word	829
	.word	isA-(.LPIC35+8)
	.word	877
	.word	785
	.word	535
	.word	297
	.word	621
	.word	697
	.word	isA-(.LPIC36+8)
	.word	275
	.word	698
	.word	isA-(.LPIC37+8)
	.word	285
	.word	287
	.word	294
	.word	isA-(.LPIC38+8)
	.word	isA-(.LPIC39+8)
	.word	isA-(.LPIC40+8)
	.word	isA-(.LPIC41+8)
	.word	isA-(.LPIC42+8)
	.cfi_endproc
.LFE4:
	.size	getDistanceFromPrev, .-getDistanceFromPrev
	.align	2
	.global	getDistanceToNext
	.syntax unified
	.arm
	.fpu softvfp
	.type	getDistanceToNext, %function
getDistanceToNext:
.LFB5:
	.loc 1 334 0
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
	strh	r0, [fp, #-16]	@ movhi
	str	r1, [fp, #-20]
	.loc 1 335 0
	ldr	r1, [fp, #-20]
	ldr	r0, [fp, #-16]
	bl	getNextSensor(PLT)
	mov	r3, r0	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	ldr	r1, [fp, #-20]
	ldr	r0, [fp, #-8]
	bl	getDistanceFromPrev(PLT)
	mov	r3, r0
	.loc 1 336 0
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
.LFE5:
	.size	getDistanceToNext, .-getDistanceToNext
.Letext0:
	.file 2 "src/util/trains/switches.h"
	.file 3 "src/util/trains/sensors.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x1e9
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF16
	.byte	0xc
	.4byte	.LASF17
	.4byte	.LASF18
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF8
	.byte	0x2
	.byte	0x5
	.4byte	0x30
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x4
	.4byte	.LASF9
	.byte	0x1
	.4byte	0x6c
	.byte	0x3
	.byte	0x8
	.4byte	0x6c
	.uleb128 0x5
	.4byte	.LASF0
	.byte	0
	.uleb128 0x5
	.4byte	.LASF1
	.byte	0x1
	.uleb128 0x5
	.4byte	.LASF2
	.byte	0x2
	.uleb128 0x5
	.4byte	.LASF3
	.byte	0x3
	.uleb128 0x5
	.4byte	.LASF4
	.byte	0x4
	.uleb128 0x5
	.4byte	.LASF5
	.byte	0x5
	.byte	0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF7
	.uleb128 0x2
	.4byte	.LASF9
	.byte	0x3
	.byte	0x8
	.4byte	0x37
	.uleb128 0x6
	.4byte	.LASF19
	.byte	0x2
	.byte	0x3
	.byte	0xa
	.4byte	0xa5
	.uleb128 0x7
	.4byte	.LASF20
	.byte	0x3
	.byte	0xb
	.4byte	0x73
	.byte	0
	.uleb128 0x8
	.ascii	"id\000"
	.byte	0x3
	.byte	0xc
	.4byte	0x30
	.byte	0x4
	.byte	0x4
	.byte	0x14
	.byte	0
	.byte	0
	.uleb128 0x9
	.ascii	"isA\000"
	.byte	0x1
	.byte	0x3
	.4byte	0xb6
	.uleb128 0x5
	.byte	0x3
	.4byte	isA
	.uleb128 0xa
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0xb
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x14d
	.4byte	0xb6
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf6
	.uleb128 0xc
	.ascii	"src\000"
	.byte	0x1
	.2byte	0x14d
	.4byte	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xd
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x14d
	.4byte	0x25
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xe
	.4byte	.LASF12
	.byte	0x1
	.byte	0xe5
	.4byte	0xb6
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x12c
	.uleb128 0xf
	.ascii	"src\000"
	.byte	0x1
	.byte	0xe5
	.4byte	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x10
	.4byte	.LASF10
	.byte	0x1
	.byte	0xe5
	.4byte	0x25
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xe
	.4byte	.LASF13
	.byte	0x1
	.byte	0xd9
	.4byte	0x7e
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x162
	.uleb128 0xf
	.ascii	"src\000"
	.byte	0x1
	.byte	0xd9
	.4byte	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x9
	.ascii	"ret\000"
	.byte	0x1
	.byte	0xdc
	.4byte	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xe
	.4byte	.LASF14
	.byte	0x1
	.byte	0x70
	.4byte	0x7e
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x198
	.uleb128 0xf
	.ascii	"src\000"
	.byte	0x1
	.byte	0x70
	.4byte	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.4byte	.LASF10
	.byte	0x1
	.byte	0x70
	.4byte	0x25
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xe
	.4byte	.LASF15
	.byte	0x1
	.byte	0x7
	.4byte	0x7e
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1ce
	.uleb128 0xf
	.ascii	"src\000"
	.byte	0x1
	.byte	0x7
	.4byte	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.4byte	.LASF10
	.byte	0x1
	.byte	0x7
	.4byte	0x25
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x11
	.4byte	.LASF21
	.byte	0x1
	.byte	0x5
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xf
	.ascii	"a\000"
	.byte	0x1
	.byte	0x5
	.4byte	0xb6
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
	.uleb128 0xb
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
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0xc
	.uleb128 0xb
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0x5
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
	.uleb128 0xc
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
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
	.uleb128 0x49
	.uleb128 0x13
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
.LASF21:
	.ascii	"setSensorTrack\000"
.LASF6:
	.ascii	"unsigned int\000"
.LASF0:
	.ascii	"SG_A\000"
.LASF13:
	.ascii	"getReverseSensor\000"
.LASF11:
	.ascii	"getDistanceToNext\000"
.LASF20:
	.ascii	"group\000"
.LASF15:
	.ascii	"getPrevSensor\000"
.LASF12:
	.ascii	"getDistanceFromPrev\000"
.LASF9:
	.ascii	"SensorGroup\000"
.LASF1:
	.ascii	"SG_B\000"
.LASF2:
	.ascii	"SG_C\000"
.LASF3:
	.ascii	"SG_D\000"
.LASF4:
	.ascii	"SG_E\000"
.LASF7:
	.ascii	"unsigned char\000"
.LASF19:
	.ascii	"Sensor\000"
.LASF5:
	.ascii	"SG_N\000"
.LASF18:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF17:
	.ascii	"src/util/trains/sensors.c\000"
.LASF14:
	.ascii	"getNextSensor\000"
.LASF10:
	.ascii	"switches\000"
.LASF16:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF8:
	.ascii	"switch_state\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
