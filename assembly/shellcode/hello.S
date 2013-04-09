.data
	text: .string "Bella zio!\n"
	textLength = .-text


.text
	.global main

main:
	movl $4, %eax
	movl $1, %ebx
	movl $text, %ecx
	movl $textLength, %edx

	//doing the fucking syscall
	int $0x80

	//world returning
	movl $1, %eax
	movl $0, %ebx
	int $0x80
