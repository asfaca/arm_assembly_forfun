@ Define my raspberry Pi
	.cpu	cortex-a53
	.fpu	neon-fp-armv8
	.syntax	unified

@ Useful source code constant
	.equ	STDOUT, 1

@ Constant Program data
	.section	.rodata
	.align	2
helloMsg:
	.asciz	"Hello, World\n"
	.equ	helloLngth,.-helloMsg

@ Program code
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	sub	sp, sp, 8
	str	fp, [sp, 0]
	str	lr, [sp, 4]
	add	fp, sp, 4

	mov	r0, STDOUT
	ldr	r1, helloMsgAddr
	mov	r2, helloLngth
	bl	write 

	mov	r0, 0
	ldr	fp, [sp, 0]
	ldr	lr, [sp, 4]
	add	sp, sp, 8
	bx	lr

	.align	2
helloMsgAddr:
	.word	helloMsg
