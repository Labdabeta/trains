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
	@ args = 0, pretend = 0, frame = 1048
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #1040
	sub	sp, sp, #8
	ldr	sl, .L5
.L4:
	add	sl, pc, sl
	sub	r3, fp, #1040
	sub	r3, r3, #8
	mov	r0, r3
	bl	cbinit(PLT)
	ldr	r3, .L5+4
	add	r2, sl, r3
	sub	r3, fp, #1056
	sub	r3, r3, #7
	mov	ip, #15
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	memcpy(PLT)
.L2:
	sub	r2, fp, #1040
	sub	r2, r2, #8
	sub	r3, fp, #1056
	sub	r3, r3, #7
	mov	r0, r2
	mov	r1, r3
	bl	cbputstr(PLT)
	sub	r3, fp, #1040
	sub	r3, r3, #8
	mov	r0, r3
	bl	bwout(PLT)
	b	.L2
.L6:
	.align	2
.L5:
	.word	_GLOBAL_OFFSET_TABLE_-(.L4+8)
	.word	.LC0(GOTOFF)
	.size	hello, .-hello
	.ident	"GCC: (GNU) 4.0.2"
