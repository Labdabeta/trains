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
	.file	"A0_controller.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata
	.align	2
.LC0:
	.ascii	"TOUT\000"
	.align	2
.LC1:
	.ascii	"TIN\000"
	.align	2
.LC2:
	.ascii	"Sensor controller created\000"
	.align	2
.LC3:
	.ascii	"Sensor %d: %x\012\015\000"
	.text
	.align	2
	.global	A0_sensor_controller
	.syntax unified
	.arm
	.fpu softvfp
	.type	A0_sensor_controller, %function
A0_sensor_controller:
.LFB0:
	.file 1 "src/tasks/A0/A0_controller.c"
	.loc 1 5 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #48
	.loc 1 6 0
	bl	Service(PLT)
	.loc 1 9 0
	ldr	r3, .L5
.LPIC0:
	add	r3, pc, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	str	r0, [fp, #-8]
	.loc 1 10 0
	ldr	r3, .L5+4
.LPIC1:
	add	r3, pc, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	str	r0, [fp, #-12]
	.loc 1 12 0
	sub	r1, fp, #24
	sub	r3, fp, #20
	mov	r2, #4
	mov	r0, r3
	bl	Receive(PLT)
	.loc 1 13 0
	ldr	r3, [fp, #-20]
	mov	r2, #0
	mov	r1, #0
	mov	r0, r3
	bl	Reply(PLT)
	.loc 1 15 0
	ldr	r3, .L5+8
.LPIC2:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	.loc 1 17 0
	mov	r3, #1
	strb	r3, [fp, #-40]
.L4:
	.loc 1 20 0
	mov	r2, #133
	mov	r1, #1
	ldr	r0, [fp, #-8]
	bl	Putc(PLT)
	.loc 1 22 0
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L2
.L3:
.LBB2:
	.loc 1 23 0 discriminator 3
	mov	r1, #1
	ldr	r0, [fp, #-12]
	bl	Getc(PLT)
	mov	r3, r0
	strb	r3, [fp, #-13]
	.loc 1 24 0 discriminator 3
	ldr	r3, [fp, #-20]
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r3, .L5+12
.LPIC3:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	.loc 1 25 0 discriminator 3
	ldr	r3, [fp, #-20]
	sub	r2, fp, #4
	add	r3, r2, r3
	ldrb	r2, [fp, #-13]
	strb	r2, [r3, #-32]
.LBE2:
	.loc 1 22 0 discriminator 3
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L2:
	.loc 1 22 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-20]
	cmp	r3, #9
	ble	.L3
	.loc 1 28 0 is_stmt 1
	ldr	r0, [fp, #-24]
	sub	r1, fp, #40
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #16
	bl	Send(PLT)
	.loc 1 20 0
	b	.L4
.L6:
	.align	2
.L5:
	.word	.LC0-(.LPIC0+8)
	.word	.LC1-(.LPIC1+8)
	.word	.LC2-(.LPIC2+8)
	.word	.LC3-(.LPIC3+8)
	.cfi_endproc
.LFE0:
	.size	A0_sensor_controller, .-A0_sensor_controller
	.section	.rodata
	.align	2
	.type	train_cmd_start, %object
	.size	train_cmd_start, 4
train_cmd_start:
	.word	1
	.align	2
	.type	train_cmd_first_final, %object
	.size	train_cmd_first_final, 4
train_cmd_first_final:
	.word	17
	.align	2
	.type	train_cmd_error, %object
	.size	train_cmd_error, 4
train_cmd_error:
	.space	4
	.align	2
	.type	train_cmd_en_main, %object
	.size	train_cmd_en_main, 4
train_cmd_en_main:
	.word	1
	.align	2
.LC4:
	.ascii	"Error on symbol: %c\012\015\000"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	parse_cmd, %function
parse_cmd:
.LFB1:
	.file 2 "src/tasks/cmd_parser.ragel"
	.loc 2 7 0
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
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	.loc 2 9 0
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-12]
	.loc 2 11 0
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-16]
	b	.L8
.L9:
	.loc 2 11 0 is_stmt 0 discriminator 3
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L8:
	.loc 2 11 0 discriminator 1
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L9
	.loc 2 12 0 is_stmt 1
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-28]
	.loc 2 14 0
	mov	r3, #0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-20]
	.loc 2 15 0
	ldr	r3, [fp, #-36]
	mov	r2, #2
	strb	r2, [r3]
	.file 3 "src/tasks/cmd_parser.h"
	.loc 3 29 0
	mov	r3, #1
	str	r3, [fp, #-8]
	.loc 3 34 0
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	beq	.L164
	.loc 3 36 0
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	cmp	r3, #20
	addls	pc, pc, r3, asl #2
	b	.L12
.L14:
	b	.L13
	b	.L15
	b	.L16
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
	b	.L165
	b	.L32
	b	.L165
	b	.L34
	.p2align 1
.L168:
	.loc 3 43 0
	nop
.L35:
	.loc 3 39 0
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	beq	.L166
.L13:
	.loc 3 42 0
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	sub	r3, r3, #32
	cmp	r3, #84
	addls	pc, pc, r3, asl #2
	b	.L167
.L38:
	b	.L168
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L169
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L170
	b	.L171
	b	.L172
	b	.L173
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L169
	b	.L167
	b	.L167
	b	.L167
	b	.L167
	b	.L170
	b	.L171
	b	.L172
	b	.L173
	.p2align 1
.L165:
	.loc 3 96 0
	nop
	b	.L54
.L167:
	.loc 3 55 0
	nop
	b	.L54
.L175:
	.loc 3 70 0
	nop
	b	.L54
.L178:
	.loc 3 79 0
	nop
	b	.L54
.L180:
	.loc 3 91 0
	nop
	b	.L54
.L185:
	.loc 3 112 0
	nop
	b	.L54
.L188:
	.loc 3 121 0
	nop
	b	.L54
.L190:
	.loc 3 133 0
	nop
	b	.L54
.L195:
	.loc 3 149 0
	nop
	b	.L54
.L198:
	.loc 3 158 0
	nop
	b	.L54
.L201:
	.loc 3 172 0
	nop
	b	.L54
.L208:
	.loc 3 194 0
	nop
	b	.L54
.L213:
	.loc 3 210 0
	nop
	b	.L54
.L216:
	.loc 3 219 0
	nop
	b	.L54
.L219:
	.loc 3 233 0
	nop
	b	.L54
.L222:
	.loc 3 242 0
	nop
	b	.L54
.L224:
	.loc 3 254 0
	nop
.L54:
	.loc 2 49 0
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r3, .L225
.LPIC4:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	mov	r3, #0
	b	.L55
.L169:
	.loc 3 44 0
	nop
.L49:
	.loc 3 65 0
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	beq	.L174
.L15:
	.loc 3 68 0
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #32
	bne	.L175
	.loc 3 69 0
	nop
	b	.L58
.L177:
	.loc 3 76 0
	nop
.L58:
	.loc 3 72 0
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	beq	.L176
.L16:
	.loc 3 75 0
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L177
	.loc 3 77 0
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L178
	.loc 3 77 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L178
	.loc 3 78 0 is_stmt 1
	nop
.L62:
	.loc 2 18 0
	ldr	r2, [fp, #-20]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	sub	r3, r3, #48
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	.loc 2 19 0
	nop
.L63:
	.loc 2 21 0
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	beq	.L179
.L30:
	.loc 3 89 0
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L180
	.loc 3 89 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L180
	.loc 3 90 0 is_stmt 1
	b	.L62
.L170:
	.loc 3 45 0
	nop
.L50:
	.loc 3 93 0
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bne	.L165
	.loc 3 94 0
	b	.L147
.L171:
	.loc 3 46 0
	nop
.L51:
	.loc 3 98 0
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	beq	.L181
.L17:
	.loc 3 101 0
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #86
	beq	.L182
	cmp	r3, #118
	beq	.L183
	.loc 3 105 0
	b	.L54
.L182:
	.loc 3 102 0
	nop
	b	.L71
.L183:
	.loc 3 103 0
	nop
.L71:
	.loc 3 107 0
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	beq	.L184
.L18:
	.loc 3 110 0
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #32
	bne	.L185
	.loc 3 111 0
	nop
	b	.L74
.L187:
	.loc 3 118 0
	nop
.L74:
	.loc 3 114 0
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	beq	.L186
.L19:
	.loc 3 117 0
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L187
	.loc 3 119 0
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L188
	.loc 3 119 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L188
	.loc 3 120 0 is_stmt 1
	nop
.L78:
	.loc 2 18 0
	ldr	r2, [fp, #-20]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	sub	r3, r3, #48
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	.loc 2 19 0
	nop
.L79:
	.loc 2 21 0
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	beq	.L189
.L32:
	.loc 3 131 0
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L190
	.loc 3 131 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L190
	.loc 3 132 0 is_stmt 1
	b	.L78
.L172:
	.loc 3 47 0
	nop
.L52:
	.loc 3 135 0
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	beq	.L191
.L20:
	.loc 3 138 0
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #87
	beq	.L192
	cmp	r3, #119
	beq	.L193
	.loc 3 142 0
	b	.L54
.L192:
	.loc 3 139 0
	nop
	b	.L86
.L193:
	.loc 3 140 0
	nop
.L86:
	.loc 3 144 0
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	beq	.L194
.L21:
	.loc 3 147 0
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #32
	bne	.L195
	.loc 3 148 0
	nop
	b	.L89
.L197:
	.loc 3 155 0
	nop
.L89:
	.loc 3 151 0
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	beq	.L196
.L22:
	.loc 3 154 0
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L197
	.loc 3 156 0
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L198
	.loc 3 156 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L198
	.loc 3 157 0 is_stmt 1
	nop
.L93:
	.loc 2 18 0
	ldr	r2, [fp, #-20]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	sub	r3, r3, #48
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	.loc 2 19 0
	nop
.L94:
	.loc 2 21 0
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	beq	.L199
.L23:
	.loc 3 168 0
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L200
	.loc 3 170 0
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L201
	.loc 3 170 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L201
	.loc 3 171 0 is_stmt 1
	b	.L93
.L200:
	.loc 3 169 0
	nop
	b	.L97
.L204:
	.loc 3 178 0
	nop
.L97:
	.loc 3 174 0
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	beq	.L202
.L24:
	.loc 3 177 0
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #83
	beq	.L203
	cmp	r3, #83
	bgt	.L102
	cmp	r3, #32
	beq	.L204
	cmp	r3, #67
	beq	.L205
	.loc 3 184 0
	b	.L54
.L102:
	.loc 3 177 0
	cmp	r3, #99
	beq	.L206
	cmp	r3, #115
	beq	.L207
	.loc 3 184 0
	b	.L54
.L203:
	.loc 3 180 0
	nop
	b	.L107
.L205:
	.loc 3 179 0
	nop
	b	.L107
.L206:
	.loc 3 181 0
	nop
	b	.L107
.L207:
	.loc 3 182 0
	nop
.L107:
	.loc 2 22 0
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-24]
	.loc 2 23 0
	nop
.L108:
	.loc 2 25 0
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bne	.L208
	.loc 2 26 0
	b	.L157
.L173:
	.loc 3 48 0
	nop
.L53:
	.loc 3 196 0
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	beq	.L209
.L25:
	.loc 3 199 0
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #82
	beq	.L210
	cmp	r3, #114
	beq	.L211
	.loc 3 203 0
	b	.L54
.L210:
	.loc 3 200 0
	nop
	b	.L114
.L211:
	.loc 3 201 0
	nop
.L114:
	.loc 3 205 0
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	beq	.L212
.L26:
	.loc 3 208 0
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #32
	bne	.L213
	.loc 3 209 0
	nop
	b	.L117
.L215:
	.loc 3 216 0
	nop
.L117:
	.loc 3 212 0
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	beq	.L214
.L27:
	.loc 3 215 0
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L215
	.loc 3 217 0
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L216
	.loc 3 217 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L216
	.loc 3 218 0 is_stmt 1
	nop
.L121:
	.loc 2 18 0
	ldr	r2, [fp, #-20]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	sub	r3, r3, #48
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	.loc 2 19 0
	nop
.L122:
	.loc 2 21 0
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	beq	.L217
.L28:
	.loc 3 229 0
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L218
	.loc 3 231 0
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L219
	.loc 3 231 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L219
	.loc 3 232 0 is_stmt 1
	b	.L121
.L218:
	.loc 3 230 0
	nop
	b	.L125
.L221:
	.loc 3 239 0
	nop
.L125:
	.loc 3 235 0
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	beq	.L220
.L29:
	.loc 3 238 0
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L221
	.loc 3 240 0
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L222
	.loc 3 240 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L222
	.loc 3 241 0 is_stmt 1
	nop
.L130:
	.loc 2 19 0
	ldr	r2, [fp, #-24]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	sub	r3, r3, #48
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	.loc 2 20 0
	nop
.L131:
	.loc 2 22 0
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	beq	.L223
.L34:
	.loc 3 252 0
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L224
	.loc 3 252 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L224
	.loc 3 253 0 is_stmt 1
	b	.L130
.L166:
	.loc 3 40 0
	nop
.L12:
	.loc 3 256 0
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L11
.L174:
	.loc 3 66 0
	nop
.L56:
	.loc 3 257 0
	mov	r3, #2
	str	r3, [fp, #-8]
	b	.L11
.L176:
	.loc 3 73 0
	nop
.L59:
	.loc 3 258 0
	mov	r3, #3
	str	r3, [fp, #-8]
	b	.L11
.L179:
	.loc 2 22 0
	nop
.L64:
	.loc 3 259 0
	mov	r3, #17
	str	r3, [fp, #-8]
	b	.L11
.L147:
.L66:
	.loc 3 260 0
	mov	r3, #18
	str	r3, [fp, #-8]
	b	.L11
.L181:
	.loc 3 99 0
	nop
.L67:
	.loc 3 261 0
	mov	r3, #4
	str	r3, [fp, #-8]
	b	.L11
.L184:
	.loc 3 108 0
	nop
.L72:
	.loc 3 262 0
	mov	r3, #5
	str	r3, [fp, #-8]
	b	.L11
.L186:
	.loc 3 115 0
	nop
.L75:
	.loc 3 263 0
	mov	r3, #6
	str	r3, [fp, #-8]
	b	.L11
.L189:
	.loc 2 22 0
	nop
.L80:
	.loc 3 264 0
	mov	r3, #19
	str	r3, [fp, #-8]
	b	.L11
.L191:
	.loc 3 136 0
	nop
.L82:
	.loc 3 265 0
	mov	r3, #7
	str	r3, [fp, #-8]
	b	.L11
.L194:
	.loc 3 145 0
	nop
.L87:
	.loc 3 266 0
	mov	r3, #8
	str	r3, [fp, #-8]
	b	.L11
.L196:
	.loc 3 152 0
	nop
.L90:
	.loc 3 267 0
	mov	r3, #9
	str	r3, [fp, #-8]
	b	.L11
.L199:
	.loc 2 22 0
	nop
.L95:
	.loc 3 268 0
	mov	r3, #10
	str	r3, [fp, #-8]
	b	.L11
.L202:
	.loc 3 175 0
	nop
.L99:
	.loc 3 269 0
	mov	r3, #11
	str	r3, [fp, #-8]
	b	.L11
.L157:
.L109:
	.loc 3 270 0
	mov	r3, #20
	str	r3, [fp, #-8]
	b	.L11
.L209:
	.loc 3 197 0
	nop
.L110:
	.loc 3 271 0
	mov	r3, #12
	str	r3, [fp, #-8]
	b	.L11
.L212:
	.loc 3 206 0
	nop
.L115:
	.loc 3 272 0
	mov	r3, #13
	str	r3, [fp, #-8]
	b	.L11
.L214:
	.loc 3 213 0
	nop
.L118:
	.loc 3 273 0
	mov	r3, #14
	str	r3, [fp, #-8]
	b	.L11
.L217:
	.loc 2 22 0
	nop
.L123:
	.loc 3 274 0
	mov	r3, #15
	str	r3, [fp, #-8]
	b	.L11
.L220:
	.loc 3 236 0
	nop
.L127:
	.loc 3 275 0
	mov	r3, #16
	str	r3, [fp, #-8]
	b	.L11
.L223:
	.loc 2 23 0
	nop
.L132:
	.loc 3 276 0
	mov	r3, #21
	str	r3, [fp, #-8]
	b	.L11
.L164:
	.loc 3 35 0
	nop
.L11:
	.loc 3 279 0
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bne	.L134
	.loc 3 281 0
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	cmp	r3, #20
	addls	pc, pc, r3, asl #2
	b	.L134
.L136:
	b	.L135
	b	.L135
	b	.L135
	b	.L135
	b	.L135
	b	.L135
	b	.L135
	b	.L135
	b	.L135
	b	.L135
	b	.L135
	b	.L135
	b	.L135
	b	.L135
	b	.L135
	b	.L135
	b	.L137
	b	.L138
	b	.L139
	b	.L140
	b	.L141
	.p2align 1
.L141:
	.loc 2 24 0
	ldr	r3, [fp, #-36]
	mov	r2, #0
	strb	r2, [r3, #4]
	.loc 2 25 0
	ldr	r3, [fp, #-36]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #8]
	.loc 2 26 0
	ldr	r3, [fp, #-36]
	ldr	r2, [fp, #-24]
	str	r2, [r3, #12]
	.loc 2 28 0
	b	.L134
.L139:
	.loc 2 29 0
	ldr	r3, [fp, #-36]
	mov	r2, #1
	strb	r2, [r3, #4]
	.loc 2 30 0
	ldr	r3, [fp, #-36]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #8]
	.loc 2 32 0
	b	.L134
.L140:
	.loc 2 33 0
	ldr	r3, [fp, #-36]
	mov	r2, #3
	strb	r2, [r3, #4]
	.loc 2 34 0
	ldr	r3, [fp, #-36]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #8]
	.loc 2 35 0
	ldr	r3, [fp, #-24]
	cmp	r3, #90
	ble	.L142
	.loc 2 35 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
	sub	r3, r3, #32
	and	r3, r3, #255
	b	.L143
.L142:
	.loc 2 35 0 discriminator 2
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
.L143:
	.loc 2 35 0 discriminator 4
	ldr	r2, [fp, #-36]
	strb	r3, [r2, #12]
	.loc 2 37 0 is_stmt 1 discriminator 4
	b	.L134
.L138:
	.loc 2 38 0
	ldr	r3, [fp, #-36]
	mov	r2, #4
	strb	r2, [r3, #4]
	.loc 2 40 0
	b	.L134
.L137:
	.loc 2 41 0
	ldr	r3, [fp, #-36]
	mov	r2, #2
	strb	r2, [r3, #4]
	.loc 2 42 0
	ldr	r3, [fp, #-36]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #8]
	.loc 2 44 0
	b	.L134
.L135:
	.loc 2 49 0
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r3, .L225+4
.LPIC5:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	mov	r3, #0
	b	.L55
.L134:
	.loc 2 54 0
	mov	r3, #1
.L55:
	.loc 2 55 0
	mov	r0, r3
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L226:
	.align	2
.L225:
	.word	.LC4-(.LPIC4+8)
	.word	.LC4-(.LPIC5+8)
	.cfi_endproc
.LFE1:
	.size	parse_cmd, .-parse_cmd
	.section	.rodata
	.align	2
.LC5:
	.ascii	"CIN\000"
	.align	2
.LC6:
	.ascii	"Model TID: %d\012\015\000"
	.text
	.align	2
	.global	A0_keyboard_controller
	.syntax unified
	.arm
	.fpu softvfp
	.type	A0_keyboard_controller, %function
A0_keyboard_controller:
.LFB2:
	.loc 1 34 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 136
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #144
	.loc 1 35 0
	bl	Service(PLT)
	.loc 1 38 0
	ldr	r3, .L233
.LPIC6:
	add	r3, pc, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	str	r0, [fp, #-12]
	.loc 1 41 0
	mov	r3, #0
	str	r3, [fp, #-8]
	.loc 1 42 0
	mov	r3, #0
	strb	r3, [fp, #-40]
	.loc 1 44 0
	sub	r1, fp, #20
	sub	r3, fp, #24
	mov	r2, #4
	mov	r0, r3
	bl	Receive(PLT)
	.loc 1 45 0
	ldr	r3, [fp, #-24]
	mov	r2, #0
	mov	r1, #0
	mov	r0, r3
	bl	Reply(PLT)
	.loc 1 47 0
	ldr	r3, [fp, #-20]
	mov	r1, r3
	ldr	r3, .L233+4
.LPIC7:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
.L232:
.LBB3:
	.loc 1 50 0
	mov	r1, #2
	ldr	r0, [fp, #-12]
	bl	Getc(PLT)
	mov	r3, r0
	strb	r3, [fp, #-13]
	.loc 1 51 0
	ldrb	r3, [fp, #-13]
	strb	r3, [fp, #-36]
	.loc 1 52 0
	ldr	r0, [fp, #-20]
	sub	r1, fp, #40
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #16
	bl	Send(PLT)
	.loc 1 53 0
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #10
	beq	.L228
	.loc 1 53 0 is_stmt 0 discriminator 1
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #13
	bne	.L229
.L228:
	.loc 1 54 0 is_stmt 1
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	str	r2, [fp, #-8]
	sub	r2, fp, #4
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3, #-136]
	mov	r3, #0
	str	r3, [fp, #-8]
	.loc 1 55 0
	sub	r2, fp, #40
	sub	r3, fp, #140
	mov	r1, r2
	mov	r0, r3
	bl	parse_cmd(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L230
	.loc 1 56 0
	ldr	r0, [fp, #-20]
	sub	r1, fp, #40
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #16
	bl	Send(PLT)
.L230:
	.loc 1 57 0
	mov	r3, #0
	strb	r3, [fp, #-40]
	b	.L231
.L229:
	.loc 1 59 0
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	str	r2, [fp, #-8]
	sub	r2, fp, #4
	add	r3, r2, r3
	ldrb	r2, [fp, #-13]
	strb	r2, [r3, #-136]
.L231:
.LBE3:
	.loc 1 49 0
	b	.L232
.L234:
	.align	2
.L233:
	.word	.LC5-(.LPIC6+8)
	.word	.LC6-(.LPIC7+8)
	.cfi_endproc
.LFE2:
	.size	A0_keyboard_controller, .-A0_keyboard_controller
	.section	.rodata
	.align	2
.LC7:
	.ascii	"Controller TID: %d\012\015\000"
	.align	2
.LC8:
	.ascii	"Model TID should be: %d\012\015\000"
	.text
	.align	2
	.global	A0_controller
	.syntax unified
	.arm
	.fpu softvfp
	.type	A0_controller, %function
A0_controller:
.LFB3:
	.loc 1 65 0
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
	sub	sp, sp, #28
	ldr	r4, .L236
.LPIC9:
	add	r4, pc, r4
	.loc 1 66 0
	bl	MyTid(PLT)
	mov	r3, r0
	mov	r1, r3
	ldr	r3, .L236+4
.LPIC8:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	.loc 1 67 0
	ldr	r3, .L236+8
	ldr	r3, [r4, r3]
	mov	r1, r3
	mov	r0, #1
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	.loc 1 68 0
	ldr	r3, [fp, #-24]
	mov	r1, r3
	ldr	r3, .L236+12
.LPIC10:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_dprintf(PLT)
	.loc 1 69 0
	ldr	r3, .L236+16
	ldr	r3, [r4, r3]
	mov	r1, r3
	mov	r0, #1
	bl	Create(PLT)
	str	r0, [fp, #-16]
	.loc 1 70 0
	ldr	r3, .L236+20
	ldr	r3, [r4, r3]
	mov	r1, r3
	mov	r0, #1
	bl	Create(PLT)
	str	r0, [fp, #-20]
	.loc 1 71 0
	sub	r1, fp, #24
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #4
	ldr	r0, [fp, #-16]
	bl	Send(PLT)
	.loc 1 72 0
	sub	r1, fp, #24
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #4
	ldr	r0, [fp, #-20]
	bl	Send(PLT)
	.loc 1 73 0
	bl	Exit(PLT)
	.loc 1 74 0
	nop
	sub	sp, fp, #8
	.cfi_def_cfa 13, 12
	@ sp needed
	pop	{r4, fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.L237:
	.align	2
.L236:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC9+8)
	.word	.LC7-(.LPIC8+8)
	.word	A0_model(GOT)
	.word	.LC8-(.LPIC10+8)
	.word	A0_sensor_controller(GOT)
	.word	A0_keyboard_controller(GOT)
	.cfi_endproc
.LFE3:
	.size	A0_controller, .-A0_controller
.Letext0:
	.file 4 "src/tasks/A0/A0_model.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x6ab
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF93
	.byte	0xc
	.4byte	.LASF94
	.4byte	.LASF95
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x4
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x5
	.4byte	.LASF5
	.byte	0x1
	.4byte	0x38
	.byte	0x4
	.byte	0x8
	.4byte	0x62
	.uleb128 0x6
	.4byte	.LASF2
	.byte	0
	.uleb128 0x6
	.4byte	.LASF3
	.byte	0x1
	.uleb128 0x6
	.4byte	.LASF4
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.4byte	.LASF5
	.byte	0x4
	.byte	0xc
	.4byte	0x3f
	.uleb128 0x5
	.4byte	.LASF6
	.byte	0x1
	.4byte	0x38
	.byte	0x4
	.byte	0xe
	.4byte	0x9c
	.uleb128 0x6
	.4byte	.LASF7
	.byte	0
	.uleb128 0x6
	.4byte	.LASF8
	.byte	0x1
	.uleb128 0x6
	.4byte	.LASF9
	.byte	0x2
	.uleb128 0x6
	.4byte	.LASF10
	.byte	0x3
	.uleb128 0x6
	.4byte	.LASF11
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.4byte	.LASF6
	.byte	0x4
	.byte	0x14
	.4byte	0x6d
	.uleb128 0x8
	.4byte	.LASF13
	.byte	0x1
	.byte	0x4
	.byte	0x19
	.4byte	0xc0
	.uleb128 0x9
	.ascii	"val\000"
	.byte	0x4
	.byte	0x1a
	.4byte	0xc0
	.byte	0
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF12
	.uleb128 0x8
	.4byte	.LASF14
	.byte	0xa
	.byte	0x4
	.byte	0x1c
	.4byte	0xe0
	.uleb128 0xa
	.4byte	.LASF15
	.byte	0x4
	.byte	0x1d
	.4byte	0xe0
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	0xc0
	.4byte	0xf0
	.uleb128 0xc
	.4byte	0xf0
	.byte	0x9
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF16
	.uleb128 0x8
	.4byte	.LASF17
	.byte	0x8
	.byte	0x4
	.byte	0x22
	.4byte	0x11c
	.uleb128 0xa
	.4byte	.LASF18
	.byte	0x4
	.byte	0x23
	.4byte	0x2c
	.byte	0
	.uleb128 0xa
	.4byte	.LASF19
	.byte	0x4
	.byte	0x24
	.4byte	0x2c
	.byte	0x4
	.byte	0
	.uleb128 0x8
	.4byte	.LASF20
	.byte	0x4
	.byte	0x4
	.byte	0x26
	.4byte	0x135
	.uleb128 0xa
	.4byte	.LASF18
	.byte	0x4
	.byte	0x27
	.4byte	0x2c
	.byte	0
	.byte	0
	.uleb128 0x8
	.4byte	.LASF21
	.byte	0x4
	.byte	0x4
	.byte	0x29
	.4byte	0x14e
	.uleb128 0xa
	.4byte	.LASF18
	.byte	0x4
	.byte	0x2a
	.4byte	0x2c
	.byte	0
	.byte	0
	.uleb128 0x8
	.4byte	.LASF22
	.byte	0x8
	.byte	0x4
	.byte	0x2c
	.4byte	0x173
	.uleb128 0xa
	.4byte	.LASF23
	.byte	0x4
	.byte	0x2d
	.4byte	0x2c
	.byte	0
	.uleb128 0xa
	.4byte	.LASF24
	.byte	0x4
	.byte	0x2e
	.4byte	0xc0
	.byte	0x4
	.byte	0
	.uleb128 0x8
	.4byte	.LASF25
	.byte	0
	.byte	0x4
	.byte	0x30
	.4byte	0x18c
	.uleb128 0xa
	.4byte	.LASF26
	.byte	0x4
	.byte	0x31
	.4byte	0x18c
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	0xc0
	.4byte	0x19b
	.uleb128 0xd
	.4byte	0xf0
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.byte	0x4
	.byte	0x21
	.4byte	0x1db
	.uleb128 0xf
	.4byte	.LASF19
	.byte	0x4
	.byte	0x25
	.4byte	0xf7
	.uleb128 0xf
	.4byte	.LASF27
	.byte	0x4
	.byte	0x28
	.4byte	0x11c
	.uleb128 0xf
	.4byte	.LASF28
	.byte	0x4
	.byte	0x2b
	.4byte	0x135
	.uleb128 0xf
	.4byte	.LASF29
	.byte	0x4
	.byte	0x2f
	.4byte	0x14e
	.uleb128 0xf
	.4byte	.LASF30
	.byte	0x4
	.byte	0x32
	.4byte	0x173
	.byte	0
	.uleb128 0x8
	.4byte	.LASF31
	.byte	0xc
	.byte	0x4
	.byte	0x1f
	.4byte	0x200
	.uleb128 0xa
	.4byte	.LASF32
	.byte	0x4
	.byte	0x20
	.4byte	0x9c
	.byte	0
	.uleb128 0xa
	.4byte	.LASF33
	.byte	0x4
	.byte	0x33
	.4byte	0x19b
	.byte	0x4
	.byte	0
	.uleb128 0xe
	.byte	0xc
	.byte	0x4
	.byte	0x18
	.4byte	0x22a
	.uleb128 0xf
	.4byte	.LASF34
	.byte	0x4
	.byte	0x1b
	.4byte	0xa7
	.uleb128 0xf
	.4byte	.LASF35
	.byte	0x4
	.byte	0x1e
	.4byte	0xc7
	.uleb128 0xf
	.4byte	.LASF36
	.byte	0x4
	.byte	0x34
	.4byte	0x1db
	.byte	0
	.uleb128 0x8
	.4byte	.LASF37
	.byte	0x10
	.byte	0x4
	.byte	0x16
	.4byte	0x249
	.uleb128 0xa
	.4byte	.LASF38
	.byte	0x4
	.byte	0x17
	.4byte	0x62
	.byte	0
	.uleb128 0x10
	.4byte	0x200
	.byte	0x4
	.byte	0
	.uleb128 0x11
	.4byte	.LASF39
	.byte	0x3
	.byte	0x5
	.4byte	0x33
	.uleb128 0x5
	.byte	0x3
	.4byte	train_cmd_start
	.uleb128 0x11
	.4byte	.LASF40
	.byte	0x3
	.byte	0x6
	.4byte	0x33
	.uleb128 0x5
	.byte	0x3
	.4byte	train_cmd_first_final
	.uleb128 0x11
	.4byte	.LASF41
	.byte	0x3
	.byte	0x7
	.4byte	0x33
	.uleb128 0x5
	.byte	0x3
	.4byte	train_cmd_error
	.uleb128 0x11
	.4byte	.LASF42
	.byte	0x3
	.byte	0x9
	.4byte	0x33
	.uleb128 0x5
	.byte	0x3
	.4byte	train_cmd_en_main
	.uleb128 0x12
	.4byte	.LASF45
	.byte	0x1
	.byte	0x40
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2cd
	.uleb128 0x13
	.ascii	"mid\000"
	.byte	0x1
	.byte	0x43
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.4byte	.LASF43
	.byte	0x1
	.byte	0x45
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.4byte	.LASF44
	.byte	0x1
	.byte	0x46
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x12
	.4byte	.LASF46
	.byte	0x1
	.byte	0x21
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x34f
	.uleb128 0x13
	.ascii	"mid\000"
	.byte	0x1
	.byte	0x24
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x25
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x13
	.ascii	"cin\000"
	.byte	0x1
	.byte	0x26
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x13
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x27
	.4byte	0x22a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x11
	.4byte	.LASF47
	.byte	0x1
	.byte	0x28
	.4byte	0x34f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x11
	.4byte	.LASF48
	.byte	0x1
	.byte	0x29
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x13
	.ascii	"ch\000"
	.byte	0x1
	.byte	0x32
	.4byte	0xc0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	0xc0
	.4byte	0x35f
	.uleb128 0xc
	.4byte	0xf0
	.byte	0x63
	.byte	0
	.uleb128 0x15
	.4byte	.LASF96
	.byte	0x2
	.byte	0x6
	.4byte	0x2c
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x634
	.uleb128 0x16
	.ascii	"cmd\000"
	.byte	0x2
	.byte	0x6
	.4byte	0x634
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x16
	.ascii	"msg\000"
	.byte	0x2
	.byte	0x6
	.4byte	0x63a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x13
	.ascii	"cs\000"
	.byte	0x2
	.byte	0x8
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x13
	.ascii	"p\000"
	.byte	0x2
	.byte	0x9
	.4byte	0x634
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x13
	.ascii	"pe\000"
	.byte	0x2
	.byte	0xa
	.4byte	0x634
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.ascii	"eof\000"
	.byte	0x2
	.byte	0xc
	.4byte	0x634
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x11
	.4byte	.LASF49
	.byte	0x2
	.byte	0xd
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.4byte	.LASF50
	.byte	0x2
	.byte	0xd
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x17
	.4byte	.LASF51
	.byte	0x3
	.2byte	0x116
	.4byte	.L11
	.uleb128 0x18
	.ascii	"st1\000"
	.byte	0x3
	.byte	0x26
	.4byte	.L35
	.uleb128 0x17
	.4byte	.LASF52
	.byte	0x3
	.2byte	0x100
	.4byte	.L12
	.uleb128 0x18
	.ascii	"st2\000"
	.byte	0x3
	.byte	0x40
	.4byte	.L49
	.uleb128 0x19
	.4byte	.LASF53
	.byte	0x3
	.byte	0x5c
	.4byte	.L50
	.uleb128 0x18
	.ascii	"st4\000"
	.byte	0x3
	.byte	0x61
	.4byte	.L51
	.uleb128 0x18
	.ascii	"st7\000"
	.byte	0x3
	.byte	0x86
	.4byte	.L52
	.uleb128 0x19
	.4byte	.LASF54
	.byte	0x3
	.byte	0xc3
	.4byte	.L53
	.uleb128 0x18
	.ascii	"tr0\000"
	.byte	0x3
	.byte	0x38
	.4byte	.L54
	.uleb128 0x1a
	.ascii	"st0\000"
	.byte	0x3
	.byte	0x3d
	.uleb128 0x17
	.4byte	.LASF55
	.byte	0x3
	.2byte	0x155
	.4byte	.L134
	.uleb128 0x17
	.4byte	.LASF56
	.byte	0x3
	.2byte	0x101
	.4byte	.L56
	.uleb128 0x18
	.ascii	"st3\000"
	.byte	0x3
	.byte	0x47
	.4byte	.L58
	.uleb128 0x17
	.4byte	.LASF57
	.byte	0x3
	.2byte	0x102
	.4byte	.L59
	.uleb128 0x18
	.ascii	"tr8\000"
	.byte	0x3
	.byte	0x50
	.4byte	.L62
	.uleb128 0x19
	.4byte	.LASF58
	.byte	0x2
	.byte	0x14
	.4byte	.L63
	.uleb128 0x17
	.4byte	.LASF59
	.byte	0x3
	.2byte	0x103
	.4byte	.L64
	.uleb128 0x17
	.4byte	.LASF60
	.byte	0x3
	.2byte	0x104
	.4byte	.L66
	.uleb128 0x17
	.4byte	.LASF61
	.byte	0x3
	.2byte	0x105
	.4byte	.L67
	.uleb128 0x18
	.ascii	"st5\000"
	.byte	0x3
	.byte	0x6a
	.4byte	.L71
	.uleb128 0x17
	.4byte	.LASF62
	.byte	0x3
	.2byte	0x106
	.4byte	.L72
	.uleb128 0x18
	.ascii	"st6\000"
	.byte	0x3
	.byte	0x71
	.4byte	.L74
	.uleb128 0x17
	.4byte	.LASF63
	.byte	0x3
	.2byte	0x107
	.4byte	.L75
	.uleb128 0x19
	.4byte	.LASF64
	.byte	0x3
	.byte	0x7a
	.4byte	.L78
	.uleb128 0x19
	.4byte	.LASF65
	.byte	0x2
	.byte	0x14
	.4byte	.L79
	.uleb128 0x17
	.4byte	.LASF66
	.byte	0x3
	.2byte	0x108
	.4byte	.L80
	.uleb128 0x17
	.4byte	.LASF67
	.byte	0x3
	.2byte	0x109
	.4byte	.L82
	.uleb128 0x18
	.ascii	"st8\000"
	.byte	0x3
	.byte	0x8f
	.4byte	.L86
	.uleb128 0x17
	.4byte	.LASF68
	.byte	0x3
	.2byte	0x10a
	.4byte	.L87
	.uleb128 0x18
	.ascii	"st9\000"
	.byte	0x3
	.byte	0x96
	.4byte	.L89
	.uleb128 0x17
	.4byte	.LASF69
	.byte	0x3
	.2byte	0x10b
	.4byte	.L90
	.uleb128 0x19
	.4byte	.LASF70
	.byte	0x3
	.byte	0x9f
	.4byte	.L93
	.uleb128 0x19
	.4byte	.LASF71
	.byte	0x2
	.byte	0x14
	.4byte	.L94
	.uleb128 0x17
	.4byte	.LASF72
	.byte	0x3
	.2byte	0x10c
	.4byte	.L95
	.uleb128 0x19
	.4byte	.LASF73
	.byte	0x3
	.byte	0xad
	.4byte	.L97
	.uleb128 0x17
	.4byte	.LASF74
	.byte	0x3
	.2byte	0x10d
	.4byte	.L99
	.uleb128 0x19
	.4byte	.LASF75
	.byte	0x3
	.byte	0xb9
	.4byte	.L107
	.uleb128 0x19
	.4byte	.LASF76
	.byte	0x2
	.byte	0x18
	.4byte	.L108
	.uleb128 0x17
	.4byte	.LASF77
	.byte	0x3
	.2byte	0x10e
	.4byte	.L109
	.uleb128 0x17
	.4byte	.LASF78
	.byte	0x3
	.2byte	0x10f
	.4byte	.L110
	.uleb128 0x19
	.4byte	.LASF79
	.byte	0x3
	.byte	0xcc
	.4byte	.L114
	.uleb128 0x17
	.4byte	.LASF80
	.byte	0x3
	.2byte	0x110
	.4byte	.L115
	.uleb128 0x19
	.4byte	.LASF81
	.byte	0x3
	.byte	0xd3
	.4byte	.L117
	.uleb128 0x17
	.4byte	.LASF82
	.byte	0x3
	.2byte	0x111
	.4byte	.L118
	.uleb128 0x19
	.4byte	.LASF83
	.byte	0x3
	.byte	0xdc
	.4byte	.L121
	.uleb128 0x19
	.4byte	.LASF84
	.byte	0x2
	.byte	0x14
	.4byte	.L122
	.uleb128 0x17
	.4byte	.LASF85
	.byte	0x3
	.2byte	0x112
	.4byte	.L123
	.uleb128 0x19
	.4byte	.LASF86
	.byte	0x3
	.byte	0xea
	.4byte	.L125
	.uleb128 0x17
	.4byte	.LASF87
	.byte	0x3
	.2byte	0x113
	.4byte	.L127
	.uleb128 0x19
	.4byte	.LASF88
	.byte	0x3
	.byte	0xf3
	.4byte	.L130
	.uleb128 0x19
	.4byte	.LASF89
	.byte	0x2
	.byte	0x15
	.4byte	.L131
	.uleb128 0x17
	.4byte	.LASF90
	.byte	0x3
	.2byte	0x114
	.4byte	.L132
	.byte	0
	.uleb128 0x1b
	.byte	0x4
	.4byte	0xc0
	.uleb128 0x1b
	.byte	0x4
	.4byte	0x22a
	.uleb128 0x1c
	.4byte	.LASF97
	.byte	0x1
	.byte	0x4
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x13
	.ascii	"i\000"
	.byte	0x1
	.byte	0x7
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.ascii	"mid\000"
	.byte	0x1
	.byte	0x8
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.4byte	.LASF91
	.byte	0x1
	.byte	0x9
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x13
	.ascii	"tin\000"
	.byte	0x1
	.byte	0xa
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x13
	.ascii	"msg\000"
	.byte	0x1
	.byte	0xb
	.4byte	0x22a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x14
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x11
	.4byte	.LASF92
	.byte	0x1
	.byte	0x17
	.4byte	0xc0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
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
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
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
	.uleb128 0x9
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
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x17
	.byte	0x1
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
	.uleb128 0xf
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
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xd
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x16
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
	.uleb128 0x17
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
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
.LASF37:
	.ascii	"A0_model_message\000"
.LASF69:
	.ascii	"_test_eof9\000"
.LASF92:
	.ascii	"senin\000"
.LASF22:
	.ascii	"A0SwitchFlip\000"
.LASF32:
	.ascii	"type\000"
.LASF88:
	.ascii	"tr21\000"
.LASF48:
	.ascii	"addr\000"
.LASF46:
	.ascii	"A0_keyboard_controller\000"
.LASF84:
	.ascii	"st15\000"
.LASF41:
	.ascii	"train_cmd_error\000"
.LASF5:
	.ascii	"A0_model_message_code\000"
.LASF17:
	.ascii	"A0SetSpeed\000"
.LASF24:
	.ascii	"state\000"
.LASF25:
	.ascii	"A0Quit\000"
.LASF39:
	.ascii	"train_cmd_start\000"
.LASF95:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF51:
	.ascii	"_test_eof\000"
.LASF4:
	.ascii	"CODE_Command\000"
.LASF30:
	.ascii	"quit\000"
.LASF96:
	.ascii	"parse_cmd\000"
.LASF14:
	.ascii	"MarklinBytes\000"
.LASF3:
	.ascii	"CODE_MarklinBytes\000"
.LASF35:
	.ascii	"marklin\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF61:
	.ascii	"_test_eof4\000"
.LASF36:
	.ascii	"command\000"
.LASF31:
	.ascii	"A0Command\000"
.LASF34:
	.ascii	"echo\000"
.LASF27:
	.ascii	"reverse\000"
.LASF20:
	.ascii	"A0Reverse\000"
.LASF2:
	.ascii	"CODE_COM2byte\000"
.LASF15:
	.ascii	"data\000"
.LASF72:
	.ascii	"_test_eof10\000"
.LASF74:
	.ascii	"_test_eof11\000"
.LASF78:
	.ascii	"_test_eof12\000"
.LASF80:
	.ascii	"_test_eof13\000"
.LASF82:
	.ascii	"_test_eof14\000"
.LASF85:
	.ascii	"_test_eof15\000"
.LASF21:
	.ascii	"A0Headlights\000"
.LASF59:
	.ascii	"_test_eof17\000"
.LASF44:
	.ascii	"keyboard\000"
.LASF66:
	.ascii	"_test_eof19\000"
.LASF45:
	.ascii	"A0_controller\000"
.LASF23:
	.ascii	"number\000"
.LASF19:
	.ascii	"speed\000"
.LASF6:
	.ascii	"A0_Command_type\000"
.LASF89:
	.ascii	"st21\000"
.LASF11:
	.ascii	"A0TYPE_Quit\000"
.LASF87:
	.ascii	"_test_eof16\000"
.LASF52:
	.ascii	"_test_eof1\000"
.LASF56:
	.ascii	"_test_eof2\000"
.LASF57:
	.ascii	"_test_eof3\000"
.LASF16:
	.ascii	"sizetype\000"
.LASF62:
	.ascii	"_test_eof5\000"
.LASF63:
	.ascii	"_test_eof6\000"
.LASF67:
	.ascii	"_test_eof7\000"
.LASF68:
	.ascii	"_test_eof8\000"
.LASF40:
	.ascii	"train_cmd_first_final\000"
.LASF77:
	.ascii	"_test_eof20\000"
.LASF90:
	.ascii	"_test_eof21\000"
.LASF91:
	.ascii	"tout\000"
.LASF55:
	.ascii	"_out\000"
.LASF60:
	.ascii	"_test_eof18\000"
.LASF10:
	.ascii	"A0TYPE_SwitchFlip\000"
.LASF18:
	.ascii	"train\000"
.LASF42:
	.ascii	"train_cmd_en_main\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF49:
	.ascii	"num1\000"
.LASF50:
	.ascii	"num2\000"
.LASF93:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF71:
	.ascii	"st10\000"
.LASF73:
	.ascii	"st11\000"
.LASF54:
	.ascii	"st12\000"
.LASF79:
	.ascii	"st13\000"
.LASF81:
	.ascii	"st14\000"
.LASF86:
	.ascii	"st16\000"
.LASF58:
	.ascii	"st17\000"
.LASF53:
	.ascii	"st18\000"
.LASF65:
	.ascii	"st19\000"
.LASF8:
	.ascii	"A0TYPE_Reverse\000"
.LASF97:
	.ascii	"A0_sensor_controller\000"
.LASF43:
	.ascii	"sensors\000"
.LASF29:
	.ascii	"flip\000"
.LASF12:
	.ascii	"char\000"
.LASF47:
	.ascii	"cmdline\000"
.LASF76:
	.ascii	"st20\000"
.LASF94:
	.ascii	"src/tasks/A0/A0_controller.c\000"
.LASF38:
	.ascii	"code\000"
.LASF28:
	.ascii	"lights\000"
.LASF75:
	.ascii	"tr16\000"
.LASF26:
	.ascii	"_unused\000"
.LASF9:
	.ascii	"A0TYPE_Headlights\000"
.LASF7:
	.ascii	"A0TYPE_SetSpeed\000"
.LASF64:
	.ascii	"tr11\000"
.LASF70:
	.ascii	"tr14\000"
.LASF13:
	.ascii	"COM2byte\000"
.LASF83:
	.ascii	"tr19\000"
.LASF33:
	.ascii	"args\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
