.data
	cont: .long 10
	text: .string "Fine loop\n"
	textLength = .-text

.text
	.global main

main:
	movl $0, %eax
	jmp loop

loop:
	cmpl cont, %eax
	je end
	addl $1, %eax
	jmp loop

end:
	movl $4, %eax
	movl $0, %ebx
	movl $text, %ecx
	movl $textLength, %edx
	int $0x80

	movl $1, %eax
	movl $0, %ebx
	int $0x80
	
