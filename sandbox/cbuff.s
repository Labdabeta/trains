	.file	"cbuff.c"
	.text
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
	bls	.L2
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L2
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L5
.L2:
	mov	r3, #0
	str	r3, [fp, #-20]
.L5:
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
	beq	.L8
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #10
	beq	.L8
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #13
	beq	.L8
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #9
	bne	.L12
.L8:
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L13
.L12:
	mov	r3, #0
	str	r3, [fp, #-20]
.L13:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	isspace, .-isspace
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
	bge	.L18
	ldr	r3, [fp, #-16]
	add	r3, r3, #1024
	str	r3, [fp, #-16]
.L18:
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
	bne	.L24
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
.L24:
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
	bne	.L26
	mvn	r3, #0
	str	r3, [fp, #-24]
	b	.L28
.L26:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #1024]
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	ldr	r2, [fp, #-20]
	strb	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-24]
.L28:
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
	bne	.L33
	mvn	r3, #0
	str	r3, [fp, #-24]
	b	.L35
.L33:
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
.L35:
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
	bne	.L41
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #1028]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #1024]
	b	.L43
.L42:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	cbwrite(PLT)
.L41:
	sub	r3, fp, #13
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	cbread(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L42
.L43:
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
	b	.L45
.L46:
	ldr	r0, [fp, #-24]
	bl	cbpop(PLT)
.L45:
	sub	r3, fp, #17
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	cbpeak(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L47
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r0, r3
	bl	isspace(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L46
.L47:
	sub	r3, fp, #17
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	cbpeak(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L49
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r0, r3
	bl	isdigit(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L53
.L49:
	ldr	r2, [fp, #-28]
	mvn	r3, #0
	str	r3, [r2, #0]
	b	.L57
.L54:
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
.L53:
	sub	r3, fp, #17
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	cbpeak(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L55
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r0, r3
	bl	isdigit(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L54
.L55:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #0]
.L57:
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
	b	.L59
.L60:
	ldr	r2, [fp, #-16]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	str	r3, [fp, #-16]
	ldr	r1, [fp, #-20]
	ldr	r3, .L70
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
.L59:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	ble	.L61
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bgt	.L60
.L61:
	ldr	r1, [fp, #-16]
	ldr	r3, .L70
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-16]
	b	.L63
.L64:
	ldr	r0, [fp, #-24]
	mov	r1, #48
	bl	cbwrite(PLT)
.L63:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
	cmp	r2, #0
	bne	.L64
	b	.L66
.L67:
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
	ldr	r3, .L70
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-16]
.L66:
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	bne	.L67
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L71:
	.align	2
.L70:
	.word	1717986919
	.size	cbputdig, .-cbputdig
	.align	2
	.global	bwout
	.type	bwout, %function
bwout:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-28]
	ldr	r3, .L79
	str	r3, [fp, #-20]
	ldr	r3, .L79+4
	str	r3, [fp, #-16]
	b	.L78
.L74:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #5
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L73
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #0]
	sub	r3, fp, #28
	mov	r0, r3
	bl	cbpop(PLT)
.L73:
.L78:
	sub	r3, fp, #28
	sub	r2, fp, #21
	mov	r0, r3
	mov	r1, r2
	bl	cbpeak(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L74
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L80:
	.align	2
.L79:
	.word	-2138243048
	.word	-2138243072
	.size	bwout, .-bwout
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
	bhi	.L82
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	add	r3, r3, #48
	and	r3, r3, #255
	and	r3, r3, #255
	str	r3, [fp, #-20]
	b	.L84
.L82:
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	add	r3, r3, #87
	and	r3, r3, #255
	and	r3, r3, #255
	str	r3, [fp, #-20]
.L84:
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
	b	.L89
.L90:
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
.L89:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L90
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
	b	.L94
.L95:
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	bl	cbwrite(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L94:
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L95
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
	b	.L99
.L100:
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
.L99:
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
	bne	.L103
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bgt	.L100
	b	.L103
.L104:
	ldrb	r3, [fp, #-32]	@ zero_extendqisi2
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	cbwrite(PLT)
.L103:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
	cmp	r2, #0
	bne	.L104
	b	.L106
.L107:
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	cbwrite(PLT)
.L106:
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
	bne	.L107
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
	bls	.L111
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L111
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	sub	r3, r3, #48
	str	r3, [fp, #-20]
	b	.L114
.L111:
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #96
	bls	.L115
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #102
	bhi	.L115
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	sub	r3, r3, #87
	str	r3, [fp, #-20]
	b	.L114
.L115:
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #64
	bls	.L118
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #70
	bhi	.L118
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	sub	r3, r3, #55
	str	r3, [fp, #-20]
	b	.L114
.L118:
	mvn	r3, #0
	str	r3, [fp, #-20]
.L114:
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
	b	.L123
.L124:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	bgt	.L125
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
.L123:
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r0, r3
	bl	cba2d(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L124
.L125:
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
	b	.L129
.L130:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-32]
	mul	r3, r2, r3
	str	r3, [fp, #-16]
.L129:
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-16]
	bl	__udivsi3(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bcs	.L130
	b	.L142
.L133:
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
	bne	.L134
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bgt	.L134
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L132
.L134:
	ldr	r3, [fp, #-20]
	cmp	r3, #9
	bgt	.L137
	mov	r1, #48
	str	r1, [fp, #-40]
	b	.L139
.L137:
	mov	r3, #87
	str	r3, [fp, #-40]
.L139:
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
.L132:
.L142:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L133
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
	bge	.L144
	ldr	r3, [fp, #-16]
	rsb	r3, r3, #0
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	mov	r3, #45
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L144:
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
	b	.L166
.L149:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	cmp	r3, #37
	beq	.L150
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	cbwrite(PLT)
	b	.L148
.L150:
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
	beq	.L153
	ldr	r3, [fp, #-52]
	cmp	r3, #48
	blt	.L152
	ldr	r3, [fp, #-52]
	cmp	r3, #57
	bgt	.L152
	b	.L154
.L153:
	mov	r3, #1
	strb	r3, [fp, #-13]
	ldr	r2, [fp, #-40]
	ldrb	r3, [r2, #0]
	strb	r3, [fp, #-14]
	add	r3, r2, #1
	str	r3, [fp, #-40]
	b	.L152
.L154:
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
.L152:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	cmp	r3, #115
	beq	.L159
	ldr	r3, [fp, #-48]
	cmp	r3, #115
	bgt	.L162
	ldr	r3, [fp, #-48]
	cmp	r3, #99
	beq	.L157
	ldr	r3, [fp, #-48]
	cmp	r3, #99
	bgt	.L163
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L165
	ldr	r3, [fp, #-48]
	cmp	r3, #37
	beq	.L156
	b	.L148
.L163:
	ldr	r3, [fp, #-48]
	cmp	r3, #100
	beq	.L158
	b	.L148
.L162:
	ldr	r3, [fp, #-48]
	cmp	r3, #117
	beq	.L160
	ldr	r3, [fp, #-48]
	cmp	r3, #120
	beq	.L161
	b	.L148
.L157:
	ldr	r3, [fp, #-44]
	add	r3, r3, #4
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	sub	r3, r3, #4
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	cbwrite(PLT)
	b	.L148
.L159:
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
	b	.L148
.L160:
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
	b	.L148
.L158:
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
	b	.L148
.L161:
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
	b	.L148
.L156:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	cbwrite(PLT)
.L148:
.L166:
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
	bne	.L149
.L165:
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
