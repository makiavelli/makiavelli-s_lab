//Programma per testare la moltiplicazione con assembly AT&T

.data

	op1: .long 3
	op2: .long 6

.text
	.global main

main:
	movl op1, %eax
	movl op2, %ebx
	mull %ebx
	jmp to_system

to_system:

	movl $1, %eax
	movl $0, %ebx
	int $0x80
