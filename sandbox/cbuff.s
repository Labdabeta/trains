	.file	"cbuff.c"
	.text
	.align	2
	.global	cbinit
	.type	cbinit, %function
cbinit:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #1028]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #1028]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #1024]
	ldmfd	sp, {r3, fp, sp, pc}
	.size	cbinit, .-cbinit
	.align	2
	.global	cbsize
	.type	cbsize, %function
cbsize:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #1028]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #1024]
	rsb	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bge	.L4
	ldr	r3, [fp, #-16]
	add	r3, r3, #1024
	str	r3, [fp, #-16]
.L4:
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	cbsize, .-cbsize
	.align	2
	.global	cbwrite
	.type	cbwrite, %function
cbwrite:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	mov	r3, r1
	strb	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r1, [r3, #1028]
	ldr	r2, [fp, #-16]
	ldrb	r3, [fp, #-20]
	strb	r3, [r2, r1]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #1028]
	add	r2, r3, #1
	mov	r3, r2, asr #31
	mov	r1, r3, lsr #22
	add	r3, r2, r1
	mov	r3, r3, asl #22
	mov	r3, r3, lsr #22
	rsb	r3, r1, r3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #1028]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #1028]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #1024]
	cmp	r2, r3
	bne	.L10
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #1024]
	add	r2, r3, #1
	mov	r3, r2, asr #31
	mov	r1, r3, lsr #22
	add	r3, r2, r1
	mov	r3, r3, asl #22
	mov	r3, r3, lsr #22
	rsb	r3, r1, r3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #1024]
.L10:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	cbwrite, .-cbwrite
	.align	2
	.global	cbpeak
	.type	cbpeak, %function
cbpeak:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #1024]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #1028]
	cmp	r2, r3
	bne	.L12
	mvn	r3, #0
	str	r3, [fp, #-24]
	b	.L14
.L12:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #1024]
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	ldr	r2, [fp, #-20]
	strb	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-24]
.L14:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	cbpeak, .-cbpeak
	.align	2
	.global	cbpop
	.type	cbpop, %function
cbpop:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #1024]
	add	r2, r3, #1
	mov	r3, r2, asr #31
	mov	r1, r3, lsr #22
	add	r3, r2, r1
	mov	r3, r3, asl #22
	mov	r3, r3, lsr #22
	rsb	r3, r1, r3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #1024]
	ldmfd	sp, {r3, fp, sp, pc}
	.size	cbpop, .-cbpop
	.align	2
	.global	cbread
	.type	cbread, %function
cbread:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #1024]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #1028]
	cmp	r2, r3
	bne	.L19
	mvn	r3, #0
	str	r3, [fp, #-24]
	b	.L21
.L19:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #1024]
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	ldr	r2, [fp, #-20]
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #1024]
	add	r2, r3, #1
	mov	r3, r2, asr #31
	mov	r1, r3, lsr #22
	add	r3, r2, r1
	mov	r3, r3, asl #22
	mov	r3, r3, lsr #22
	rsb	r3, r1, r3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #1024]
	mov	r3, #0
	str	r3, [fp, #-24]
.L21:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	cbread, .-cbread
	.align	2
	.global	flushcb
	.type	flushcb, %function
flushcb:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L27
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #1028]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #1024]
	b	.L29
.L28:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	cbwrite(PLT)
.L27:
	sub	r3, fp, #13
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	cbread(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L28
.L29:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	flushcb, .-flushcb
	.align	2
	.global	cbaoti
	.type	cbaoti, %function
cbaoti:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L31
.L32:
	ldr	r0, [fp, #-24]
	bl	cbpop(PLT)
.L31:
	sub	r3, fp, #17
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	cbpeak(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L33
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r0, r3
	bl	isspace(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L32
.L33:
	sub	r3, fp, #17
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	cbpeak(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L35
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r0, r3
	bl	isdigit(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L39
.L35:
	ldr	r2, [fp, #-28]
	mvn	r3, #0
	str	r3, [r2, #0]
	b	.L43
.L40:
	ldr	r2, [fp, #-16]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	str	r3, [fp, #-16]
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	sub	r3, r3, #48
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-24]
	bl	cbpop(PLT)
.L39:
	sub	r3, fp, #17
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	cbpeak(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L41
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r0, r3
	bl	isdigit(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L40
.L41:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #0]
.L43:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	cbaoti, .-cbaoti
	.global	__udivsi3
	.global	__umodsi3
	.align	2
	.global	cbputdig
	.type	cbputdig, %function
cbputdig:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-20]
	mov	r3, #1
	str	r3, [fp, #-16]
	b	.L45
.L46:
	ldr	r2, [fp, #-16]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	str	r3, [fp, #-16]
	ldr	r1, [fp, #-20]
	ldr	r3, .L56
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
.L45:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	ble	.L47
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bgt	.L46
.L47:
	ldr	r1, [fp, #-16]
	ldr	r3, .L56
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-16]
	b	.L49
.L50:
	ldr	r0, [fp, #-24]
	mov	r1, #48
	bl	cbwrite(PLT)
.L49:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
	cmp	r2, #0
	bne	.L50
	b	.L52
.L53:
	ldr	r3, [fp, #-16]
	ldr	r0, [fp, #-32]
	mov	r1, r3
	bl	__udivsi3(PLT)
	mov	r3, r0
	and	r3, r3, #255
	add	r3, r3, #48
	and	r3, r3, #255
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	cbwrite(PLT)
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-32]
	mov	r0, r3
	mov	r1, r2
	bl	__umodsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	ldr	r1, [fp, #-16]
	ldr	r3, .L56
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-16]
.L52:
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	bne	.L53
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L57:
	.align	2
.L56:
	.word	1717986919
	.size	cbputdig, .-cbputdig
	.align	2
	.global	c2hex
	.type	c2hex, %function
c2hex:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	mov	r3, r0
	strb	r3, [fp, #-16]
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #9
	bhi	.L59
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	add	r3, r3, #48
	and	r3, r3, #255
	and	r3, r3, #255
	str	r3, [fp, #-20]
	b	.L61
.L59:
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	add	r3, r3, #87
	and	r3, r3, #255
	and	r3, r3, #255
	str	r3, [fp, #-20]
.L61:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	c2hex, .-c2hex
	.align	2
	.global	cbputx
	.type	cbputx, %function
cbputx:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	mov	r3, r1
	strb	r3, [fp, #-20]
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	mov	r3, r3, lsr #4
	and	r3, r3, #255
	mov	r0, r3
	bl	c2hex(PLT)
	mov	r3, r0
	ldr	r0, [fp, #-16]
	mov	r1, r3
	bl	cbwrite(PLT)
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	and	r3, r3, #15
	mov	r0, r3
	bl	c2hex(PLT)
	mov	r3, r0
	ldr	r0, [fp, #-16]
	mov	r1, r3
	bl	cbwrite(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	cbputx, .-cbputx
	.align	2
	.global	cbputr
	.type	cbputr, %function
cbputr:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	sub	r3, fp, #28
	str	r3, [fp, #-16]
	mov	r3, #3
	str	r3, [fp, #-20]
	b	.L66
.L67:
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	cbputx(PLT)
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	str	r3, [fp, #-20]
.L66:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L67
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	cbputr, .-cbputr
	.align	2
	.global	cbputstr
	.type	cbputstr, %function
cbputstr:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	b	.L71
.L72:
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	bl	cbwrite(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L71:
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L72
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	cbputstr, .-cbputstr
	.align	2
	.global	cbputw
	.type	cbputw, %function
cbputw:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r3, [fp, #-36]
	mov	r3, r2
	strb	r3, [fp, #-32]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-16]
	b	.L76
.L77:
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
.L76:
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	eor	r3, r2, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L80
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bgt	.L77
	b	.L80
.L81:
	ldrb	r3, [fp, #-32]	@ zero_extendqisi2
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	cbwrite(PLT)
.L80:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
	cmp	r2, #0
	bne	.L81
	b	.L83
.L84:
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	cbwrite(PLT)
.L83:
	ldr	r3, [fp, #-36]
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-17]
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	cmp	r2, #0
	bne	.L84
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	cbputw, .-cbputw
	.align	2
	.global	cba2d
	.type	cba2d, %function
cba2d:
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
	bls	.L88
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L88
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	sub	r3, r3, #48
	str	r3, [fp, #-20]
	b	.L91
.L88:
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #96
	bls	.L92
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #102
	bhi	.L92
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	sub	r3, r3, #87
	str	r3, [fp, #-20]
	b	.L91
.L92:
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #64
	bls	.L95
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #70
	bhi	.L95
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	sub	r3, r3, #55
	str	r3, [fp, #-20]
	b	.L91
.L95:
	mvn	r3, #0
	str	r3, [fp, #-20]
.L91:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	cba2d, .-cba2d
	.align	2
	.global	cba2i
	.type	cba2i, %function
cba2i:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r1, [fp, #-32]
	str	r2, [fp, #-36]
	str	r3, [fp, #-40]
	mov	r3, r0
	strb	r3, [fp, #-28]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L100
.L101:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	bgt	.L102
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-36]
	mul	r2, r3, r2
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-28]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L100:
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r0, r3
	bl	cba2d(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L101
.L102:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #0]
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	cba2i, .-cba2i
	.align	2
	.global	cbui2a
	.type	cbui2a, %function
cbui2a:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	str	r2, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #1
	str	r3, [fp, #-16]
	b	.L106
.L107:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-32]
	mul	r3, r2, r3
	str	r3, [fp, #-16]
.L106:
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-16]
	bl	__udivsi3(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bcs	.L107
	b	.L119
.L110:
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-16]
	bl	__udivsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-28]
	mov	r0, r3
	ldr	r1, [fp, #-16]
	bl	__umodsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-32]
	bl	__udivsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L111
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bgt	.L111
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L109
.L111:
	ldr	r3, [fp, #-20]
	cmp	r3, #9
	bgt	.L114
	mov	r1, #48
	str	r1, [fp, #-40]
	b	.L116
.L114:
	mov	r3, #87
	str	r3, [fp, #-40]
.L116:
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	ldr	r1, [fp, #-40]
	mov	r2, r1
	add	r3, r2, r3
	and	r3, r3, #255
	and	r3, r3, #255
	ldr	r2, [fp, #-36]
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L109:
.L119:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L110
	ldr	r3, [fp, #-36]
	mov	r2, #0
	strb	r2, [r3, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	cbui2a, .-cbui2a
	.align	2
	.global	cbi2a
	.type	cbi2a, %function
cbi2a:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bge	.L121
	ldr	r3, [fp, #-16]
	rsb	r3, r3, #0
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	mov	r3, #45
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L121:
	ldr	r3, [fp, #-16]
	mov	r0, r3
	mov	r1, #10
	ldr	r2, [fp, #-20]
	bl	cbui2a(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	cbi2a, .-cbi2a
	.align	2
	.global	cbformat
	.type	cbformat, %function
cbformat:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #40
	str	r0, [fp, #-36]
	str	r1, [fp, #-40]
	str	r2, [fp, #-44]
	b	.L143
.L126:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	cmp	r3, #37
	beq	.L127
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	cbwrite(PLT)
	b	.L125
.L127:
	mov	r3, #0
	strb	r3, [fp, #-13]
	mov	r3, #0
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-40]
	ldrb	r3, [r2, #0]
	strb	r3, [fp, #-14]
	add	r3, r2, #1
	str	r3, [fp, #-40]
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-52]
	cmp	r3, #48
	beq	.L130
	ldr	r3, [fp, #-52]
	cmp	r3, #48
	blt	.L129
	ldr	r3, [fp, #-52]
	cmp	r3, #57
	bgt	.L129
	b	.L131
.L130:
	mov	r3, #1
	strb	r3, [fp, #-13]
	ldr	r2, [fp, #-40]
	ldrb	r3, [r2, #0]
	strb	r3, [fp, #-14]
	add	r3, r2, #1
	str	r3, [fp, #-40]
	b	.L129
.L131:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	sub	r2, fp, #40
	sub	ip, fp, #32
	mov	r0, r3
	mov	r1, r2
	mov	r2, #10
	mov	r3, ip
	bl	cba2i(PLT)
	mov	r3, r0
	strb	r3, [fp, #-14]
.L129:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	cmp	r3, #115
	beq	.L136
	ldr	r3, [fp, #-48]
	cmp	r3, #115
	bgt	.L139
	ldr	r3, [fp, #-48]
	cmp	r3, #99
	beq	.L134
	ldr	r3, [fp, #-48]
	cmp	r3, #99
	bgt	.L140
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L142
	ldr	r3, [fp, #-48]
	cmp	r3, #37
	beq	.L133
	b	.L125
.L140:
	ldr	r3, [fp, #-48]
	cmp	r3, #100
	beq	.L135
	b	.L125
.L139:
	ldr	r3, [fp, #-48]
	cmp	r3, #117
	beq	.L137
	ldr	r3, [fp, #-48]
	cmp	r3, #120
	beq	.L138
	b	.L125
.L134:
	ldr	r3, [fp, #-44]
	add	r3, r3, #4
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	sub	r3, r3, #4
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	cbwrite(PLT)
	b	.L125
.L136:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-44]
	add	r3, r3, #4
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-36]
	mov	r1, r2
	mov	r2, #0
	bl	cbputw(PLT)
	b	.L125
.L137:
	ldr	r3, [fp, #-44]
	add	r3, r3, #4
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	sub	r2, fp, #26
	mov	r0, r3
	mov	r1, #10
	bl	cbui2a(PLT)
	ldr	r3, [fp, #-32]
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	sub	ip, fp, #26
	ldr	r0, [fp, #-36]
	mov	r1, r3
	mov	r3, ip
	bl	cbputw(PLT)
	b	.L125
.L135:
	ldr	r3, [fp, #-44]
	add	r3, r3, #4
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	sub	r2, fp, #26
	mov	r0, r3
	mov	r1, r2
	bl	cbi2a(PLT)
	ldr	r3, [fp, #-32]
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	sub	ip, fp, #26
	ldr	r0, [fp, #-36]
	mov	r1, r3
	mov	r3, ip
	bl	cbputw(PLT)
	b	.L125
.L138:
	ldr	r3, [fp, #-44]
	add	r3, r3, #4
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	sub	r2, fp, #26
	mov	r0, r3
	mov	r1, #16
	bl	cbui2a(PLT)
	ldr	r3, [fp, #-32]
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	sub	ip, fp, #26
	ldr	r0, [fp, #-36]
	mov	r1, r3
	mov	r3, ip
	bl	cbputw(PLT)
	b	.L125
.L133:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	cbwrite(PLT)
.L125:
.L143:
	ldr	r1, [fp, #-40]
	ldrb	r3, [r1, #0]
	strb	r3, [fp, #-14]
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	add	r3, r1, #1
	str	r3, [fp, #-40]
	cmp	r2, #0
	bne	.L126
.L142:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	cbformat, .-cbformat
	.align	2
	.global	cbprintf
	.type	cbprintf, %function
cbprintf:
	@ args = 4, pretend = 12, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 1
	mov	ip, sp
	stmfd	sp!, {r1, r2, r3}
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #16
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	add	r3, fp, #8
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #4]
	ldr	r2, [fp, #-16]
	bl	cbformat(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	cbprintf, .-cbprintf
	.ident	"GCC: (GNU) 4.0.2"
