@read write program

@define
	.cpu	cortex-a53
	.fpu	neon-fp-armv8
	.syntax	unified

@constant
	.equ	STDOUT, 1
	.equ	STDIN, 0

@data
	.section	.rodata
	.align	2
.LC0:
	.asciz	"Enter one charcacter: "
	.align	2
.LC1:
	.asciz	"you entered: "

	.text
	.align	2
	.global	main
	.type	main, %function

main:
	sub	sp, sp, 8
	str	fp, [sp, 0]
	str	lr, [sp, 4]
	add	fp, sp, 4
	sub	sp, sp, 8
	mov	r2, 21
	ldr	r1, .L3
	mov	r0, STDOUT
	bl	write

	sub	r3, fp, 7
	mov	r2, 3
	mov	r1, r3
	mov	r0, STDIN
	bl	read

	mov	r2, 13
	ldr	r1, .L3+4
	mov	r0, STDOUT
	bl	write

	mov	r2, 3
	mov	r1, r3
	mov	r0, STDOUT
	bl	write

	mov	r3, 0
	mov	r0, 0
	add	sp, sp, 8
	ldr	fp, [sp, 0]
	ldr	lr, [sp, 4]
	bx	lr
	

	.align	2
.L3:
	.word	.LC0
	.word	.LC1
