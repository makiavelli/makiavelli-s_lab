//hello.S
//In AT&T Assembly possiamo tranquillamente usare i commenti stile C/C++

.data
.text
        .global main
hello:  .string        "Hello world!\n"
hello_lenght = .-hello

main:
        movl           $4,%eax
	//file descriptor: 0 standard input, 1 standard output, 2 standard error
        movl           $1,%ebx
        movl           $hello,%ecx
        movl           $hello_lenght,%edx
        int            $0x80
        movl           $1,%eax
        movl           $0,%ebx
        int            $0x80
