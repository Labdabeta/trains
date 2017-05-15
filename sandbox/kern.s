	.file	"kern.c"
	.text
	.align	2
	.global	setflags
	.type	setflags, %function
setflags:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	r3, .L3
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	orr	r2, r3, #128
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	ldr	r3, .L3+4
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	bic	r2, r3, #255
	ldr	r3, [fp, #-24]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	orr	r2, r3, #191
	ldr	r3, [fp, #-24]
	str	r2, [r3, #0]
	ldr	r3, .L3+8
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	bic	r2, r3, #16
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	ldr	r3, .L3+12
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	bic	r2, r3, #255
	ldr	r3, [fp, #-16]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	orr	r2, r3, #104
	ldr	r3, [fp, #-16]
	str	r2, [r3, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L4:
	.align	2
.L3:
	.word	-2139029368
	.word	-2138308592
	.word	-2138243064
	.word	-2138308600
	.size	setflags, .-setflags
	.align	2
	.global	isdigit
	.type	isdigit, %function
isdigit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	mov	r3, r0
	strb	r3, [fp, #-16]
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L6
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L6
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L9
.L6:
	mov	r3, #0
	str	r3, [fp, #-20]
.L9:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	isdigit, .-isdigit
	.align	2
	.global	isspace
	.type	isspace, %function
isspace:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	mov	r3, r0
	strb	r3, [fp, #-16]
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L12
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #10
	beq	.L12
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #13
	beq	.L12
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #9
	bne	.L16
.L12:
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L17
.L16:
	mov	r3, #0
	str	r3, [fp, #-20]
.L17:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	isspace, .-isspace
	.align	2
	.global	run
	.type	run, %function
run:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	bl	task_start(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	run, .-run
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L26
.L25:
	add	sl, pc, sl
	bl	setflags(PLT)
	ldr	r3, .L26+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, #3244032
	bl	run(PLT)
	ldr	r3, .L26+8
	str	r3, [fp, #-24]
	ldr	r3, .L26+12
	str	r3, [fp, #-20]
.L22:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #5
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L22
	ldr	r2, [fp, #-20]
	mov	r3, #89
	str	r3, [r2, #0]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L27:
	.align	2
.L26:
	.word	_GLOBAL_OFFSET_TABLE_-(.L25+8)
	.word	hello(GOT)
	.word	-2138243048
	.word	-2138243072
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
