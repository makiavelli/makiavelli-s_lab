.data

	text: .long 1
	textLength = .-text

.text

	.global main
main:

	#print the compare values
	movl $4, %eax
	movl $1, %ebx
	movl $text, %ecx
	movl $textLength, %edx
	int $0x80

	#compare data
	movl $1, %eax
	mull text
	cmpl $2608, %eax
	je end
	jmp readData

readData:

	movl $3, %eax
	movl $1, %ebx
	movl $text, %ecx
	movl $textLength, %edx
	int $0x80
	jmp main

end:

	movl $1, %eax
	movl $1, %ebx
	int $0x80
