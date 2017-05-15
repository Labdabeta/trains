	.file	"stdlib.c"
	.text
	.align	2
	.global	memcpy
	.type	memcpy, %function
memcpy:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #32
	str	r0, [fp, #-36]
	str	r1, [fp, #-40]
	str	r2, [fp, #-44]
	ldr	r3, [fp, #-36]
	and	r3, r3, #3
	cmp	r3, #0
	bne	.L2
	ldr	r3, [fp, #-40]
	and	r3, r3, #3
	cmp	r3, #0
	bne	.L2
	ldr	r3, [fp, #-44]
	and	r3, r3, #3
	cmp	r3, #0
	bne	.L2
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L6
.L7:
	ldr	r3, [fp, #-32]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-28]
	add	r1, r2, r3
	ldr	r3, [fp, #-32]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	str	r3, [r1, #0]
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L6:
	ldr	r3, [fp, #-44]
	mov	r2, r3, lsr #2
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bhi	.L7
	b	.L9
.L2:
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L10
.L11:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-20]
	add	r1, r2, r3
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	strb	r3, [r1, #0]
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L10:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-44]
	cmp	r2, r3
	bcc	.L11
.L9:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	memcpy, .-memcpy
	.ident	"GCC: (GNU) 4.0.2"
