//lettura/stampa a video di una stringa [dimensione max = 128 byte]

.data

	str: .space 128
	str_lenght = .-str

.text

	.global main

main:

	jmp readStr
	
readStr:

	movl $3, %eax
	movl $1, %ebx
	movl $str, %ecx
	movl $str_lenght, %edx

	int $0x80
	jmp writeStr

writeStr:

	movl $4, %eax
	movl $1, %ebx
	movl $str, %ecx
	movl $str_lenght, %edx

	int $0x80
	jmp programExit

programExit:

	movl $1, %eax
	movl $0, %ebx

	int $0x80
