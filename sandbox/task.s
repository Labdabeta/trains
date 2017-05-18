	.file	"task.c"
	.text
	.align	2
	.type	exit, %function
exit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	ldmfd	sp, {fp, sp, pc}
	.size	exit, .-exit
	.align	2
	.global	activate
	.type	activate, %function
activate:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L6
.L5:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, #3244032
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldr	r3, .L6+4
	str	r3, [r2, #16]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-28]
	str	r3, [r2, #60]
	ldr	r1, [fp, #-20]
	ldr	r3, .L6+8
	ldr	r3, [sl, r3]
	mov	r2, #2195456
	add	r3, r3, r2
	str	r3, [r1, #56]
	ldr	r2, [fp, #-20]
	sub	r3, fp, #20
	str	r3, [r2, #52]
	ldr	r2, [fp, #-20]
	sub	r3, fp, #20
	str	r3, [r2, #44]
	ldr	r2, [fp, #-24]
	mov	r3, #16
	str	r3, [r2, #12]
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L7:
	.align	2
.L6:
	.word	_GLOBAL_OFFSET_TABLE_-(.L5+8)
	.word	3244096
	.word	exit(GOT)
	.size	activate, .-activate
	.align	2
	.global	enter
	.type	enter, %function
enter:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #12]
	mov	r0, r2
	mov	r1, r3
	bl	asm_enter(PLT)
	ldmfd	sp, {r3, fp, sp, pc}
	.size	enter, .-enter
	.ident	"GCC: (GNU) 4.0.2"
