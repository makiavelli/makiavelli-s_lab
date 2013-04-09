#
# Program that jmp to the end only if the number from stdin is zero
#
# Lettura del dato
# Confronto il dato con zero
# Se sono uguali chiamo la funzione end
# Termino il programma
#

.data

	number: .long 1
	numberLength= .- number

.text
	.global main
main:
	movl $0, %eax
	cmpl number, %eax
	jz end
	jmp readNumber

readNumber:
	movl $3, %eax
	movl $1, %ebx
	movl $number, %ecx
	movl $numberLength, %edx
	int $0x80
	jmp main

end:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
