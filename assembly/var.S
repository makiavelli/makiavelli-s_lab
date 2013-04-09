.data

var:	.long 4

.text

	.global main

main:

	mov $1,%eax
	mov $var,%ecx
	mov var,%edx
	mov $0,%ebx
	int $0x80
