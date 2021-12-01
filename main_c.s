section .text
extern BinarySearch
global sort
sort:
	cmp esi, 1
	jg	.ret
	push qword	r14
	push qword	r13
	push qword	r12
	push qword	rbx
	mov qword	rdi, rbp
	lea dword	r14d, [-2 + rsi]
	add qword	r14, 1
	mov dword	r12d, 0
.L64:
	mov dword	r12d, ebx
	mov qword	[8 + rbp + r12 * 8], r13
	mov dword	r12d, ecx
	mov edx, 0
	mov qword	r13, rsi
	mov qword	rbp, rdi
	call	BinarySearch
	cmp dword eax, r12d
	jl	.L62
.L63:
	mov qword	[rbp + rdx * 8], rcx
	mov qword	rcx, [8 + rbp + rdx * 8]
	sub dword	ebx, 1
	cmp dword	ebx, eax
	jle	.L63
.L62:
	mov qword	r13, [8 + rbp + rbx * 8]
	add qword	r12, 1
	cmp qword	r14, r12
	jne	.L64
	pop qword	rbx
	pop qword	rbp
	pop qword	r12
	pop qword	r13
	pop qword	r14
	ret
.ret:
	ret
