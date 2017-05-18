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
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Kernell startup\015\012\000"
	.align	2
.LC1:
	.ascii	"Entering task\015\012\000"
	.align	2
.LC2:
	.ascii	"Left task\015\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 1060
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #1056
	sub	sp, sp, #4
	ldr	sl, .L11
.L10:
	add	sl, pc, sl
	sub	r3, fp, #24
	mov	r0, r3
	bl	asm_write_ksp(PLT)
	bl	setflags(PLT)
	sub	r3, fp, #1056
	mov	r0, r3
	bl	cbinit(PLT)
	sub	r3, fp, #1056
	mov	r0, r3
	ldr	r3, .L11+4
	add	r3, sl, r3
	mov	r1, r3
	bl	cbputstr(PLT)
	sub	r3, fp, #1056
	mov	r0, r3
	bl	bwout(PLT)
	ldr	r3, .L11+8
	ldr	r3, [sl, r3]
	mov	r2, #2195456
	add	r2, r3, r2
	sub	r3, fp, #1072
	sub	r3, r3, #4
	mov	r0, r3
	mov	r1, r2
	bl	activate(PLT)
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L6
.L7:
	sub	r3, fp, #1056
	mov	r0, r3
	ldr	r3, .L11+12
	add	r3, sl, r3
	mov	r1, r3
	bl	cbputstr(PLT)
	sub	r3, fp, #1056
	mov	r0, r3
	bl	bwout(PLT)
	sub	r3, fp, #1072
	sub	r3, r3, #4
	mov	r0, r3
	bl	enter(PLT)
	sub	r3, fp, #1056
	mov	r0, r3
	ldr	r3, .L11+16
	add	r3, sl, r3
	mov	r1, r3
	bl	cbputstr(PLT)
	sub	r3, fp, #1056
	mov	r0, r3
	bl	bwout(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L6:
	ldr	r3, [fp, #-20]
	cmp	r3, #2
	ble	.L7
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L12:
	.align	2
.L11:
	.word	_GLOBAL_OFFSET_TABLE_-(.L10+8)
	.word	.LC0(GOTOFF)
	.word	hello(GOT)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
