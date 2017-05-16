	.file	"progh.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Hello world!\015\012\000"
	.text
	.align	2
	.global	hello
	.type	hello, %function
hello:
	@ args = 0, pretend = 0, frame = 1056
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #1056
	ldr	sl, .L9
.L8:
	add	sl, pc, sl
	sub	r3, fp, #1056
	mov	r0, r3
	bl	cbinit(PLT)
	ldr	r3, .L9+4
	add	r2, sl, r3
	sub	r3, fp, #1056
	sub	r3, r3, #15
	mov	ip, #15
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	memcpy(PLT)
	sub	r2, fp, #1056
	sub	r3, fp, #1056
	sub	r3, r3, #15
	mov	r0, r2
	mov	r1, r3
	bl	cbputstr(PLT)
	ldr	r3, .L9+8
	str	r3, [fp, #-24]
	ldr	r3, .L9+12
	str	r3, [fp, #-20]
	b	.L7
.L3:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #5
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L2
	ldrb	r3, [fp, #-1072]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	sub	r3, fp, #1056
	mov	r0, r3
	bl	cbpop(PLT)
.L2:
.L7:
	sub	r3, fp, #1056
	sub	r2, fp, #1072
	mov	r0, r3
	mov	r1, r2
	bl	cbpeak(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L3
.L5:
	b	.L5
.L10:
	.align	2
.L9:
	.word	_GLOBAL_OFFSET_TABLE_-(.L8+8)
	.word	.LC0(GOTOFF)
	.word	-2138243048
	.word	-2138243072
	.size	hello, .-hello
	.ident	"GCC: (GNU) 4.0.2"
