	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	GetSquare_CIRCLE
	.type	GetSquare_CIRCLE, @function
GetSquare_CIRCLE:
.LFB52:
	.cfi_startproc
	mov	eax, DWORD PTR 24[rsp]
	pxor	xmm1, xmm1
	cvtsi2ssq	xmm1, rax
	movaps	xmm0, xmm1
	mulss	xmm0, DWORD PTR .LC0[rip]
	mulss	xmm0, xmm1
	cvtss2sd	xmm0, xmm0
	ret
	.cfi_endproc
.LFE52:
	.size	GetSquare_CIRCLE, .-GetSquare_CIRCLE
	.globl	GetSquare_RECTANGLE
	.type	GetSquare_RECTANGLE, @function
GetSquare_RECTANGLE:
.LFB53:
	.cfi_startproc
	mov	eax, DWORD PTR 16[rsp]
	sub	eax, DWORD PTR 24[rsp]
	cdqe
	mov	edx, DWORD PTR 20[rsp]
	sub	edx, DWORD PTR 28[rsp]
	movsx	rdx, edx
	imul	rax, rdx
	not	rax
	pxor	xmm0, xmm0
	cvtsi2sdq	xmm0, rax
	ret
	.cfi_endproc
.LFE53:
	.size	GetSquare_RECTANGLE, .-GetSquare_RECTANGLE
	.globl	GetLength
	.type	GetLength, @function
GetLength:
.LFB54:
	.cfi_startproc
	sub	rsp, 24
	.cfi_def_cfa_offset 32
	sub	edi, edx
	sub	esi, ecx
	imul	edi, edi
	imul	esi, esi
	add	edi, esi
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, edi
	sqrtsd	xmm2, xmm0
	movsd	QWORD PTR 8[rsp], xmm2
	pxor	xmm1, xmm1
	ucomisd	xmm1, xmm0
	ja	.L8
.L5:
	movsd	xmm0, QWORD PTR 8[rsp]
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L8:
	.cfi_restore_state
	call	sqrt@PLT
	jmp	.L5
	.cfi_endproc
.LFE54:
	.size	GetLength, .-GetLength
	.globl	GetSquare_TRIANGLE
	.type	GetSquare_TRIANGLE, @function
GetSquare_TRIANGLE:
.LFB55:
	.cfi_startproc
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 24
	.cfi_def_cfa_offset 80
	mov	ebx, DWORD PTR 88[rsp]
	mov	ebp, DWORD PTR 92[rsp]
	mov	r14d, DWORD PTR 96[rsp]
	mov	r15d, DWORD PTR 100[rsp]
	mov	r12d, DWORD PTR 104[rsp]
	mov	r13d, DWORD PTR 108[rsp]
	mov	ecx, r15d
	mov	edx, r14d
	mov	esi, ebp
	mov	edi, ebx
	call	GetLength
	movsd	QWORD PTR [rsp], xmm0
	mov	ecx, r13d
	mov	edx, r12d
	mov	esi, r15d
	mov	edi, r14d
	call	GetLength
	movsd	QWORD PTR 8[rsp], xmm0
	mov	ecx, r13d
	mov	edx, r12d
	mov	esi, ebp
	mov	edi, ebx
	call	GetLength
	movsd	xmm4, QWORD PTR [rsp]
	movapd	xmm1, xmm4
	movsd	xmm5, QWORD PTR 8[rsp]
	addsd	xmm1, xmm5
	addsd	xmm1, xmm0
	mulsd	xmm1, QWORD PTR .LC2[rip]
	cvttsd2si	eax, xmm1
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	movapd	xmm2, xmm1
	subsd	xmm2, xmm4
	mulsd	xmm2, xmm1
	movapd	xmm3, xmm1
	subsd	xmm3, xmm5
	mulsd	xmm2, xmm3
	subsd	xmm1, xmm0
	mulsd	xmm1, xmm2
	sqrtsd	xmm6, xmm1
	movsd	QWORD PTR [rsp], xmm6
	pxor	xmm0, xmm0
	ucomisd	xmm0, xmm1
	ja	.L12
.L9:
	movsd	xmm0, QWORD PTR [rsp]
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
.L12:
	.cfi_restore_state
	movapd	xmm0, xmm1
	call	sqrt@PLT
	jmp	.L9
	.cfi_endproc
.LFE55:
	.size	GetSquare_TRIANGLE, .-GetSquare_TRIANGLE
	.globl	new_CIRCLE
	.type	new_CIRCLE, @function
new_CIRCLE:
.LFB56:
	.cfi_startproc
	push	r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	push	r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	push	rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	sub	rsp, 8
	.cfi_def_cfa_offset 48
	mov	rbx, rdi
	mov	ebp, esi
	mov	r13d, edx
	mov	r12, rdi
	sar	r12, 32
	mov	edi, 20
	call	malloc@PLT
	mov	BYTE PTR [rax], 99
	mov	DWORD PTR 4[rax], r13d
	mov	DWORD PTR 8[rax], ebx
	mov	DWORD PTR 12[rax], r12d
	mov	DWORD PTR 16[rax], ebp
	add	rsp, 8
	.cfi_def_cfa_offset 40
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE56:
	.size	new_CIRCLE, .-new_CIRCLE
	.globl	new_RECTANGLE
	.type	new_RECTANGLE, @function
new_RECTANGLE:
.LFB57:
	.cfi_startproc
	push	r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	push	r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	push	r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	push	rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	push	rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	mov	rbp, rdi
	mov	rbx, rsi
	mov	r14d, edx
	mov	r13, rdi
	sar	r13, 32
	mov	r12, rsi
	sar	r12, 32
	mov	edi, 24
	call	malloc@PLT
	mov	BYTE PTR [rax], 114
	mov	DWORD PTR 4[rax], r14d
	mov	DWORD PTR 8[rax], ebp
	mov	DWORD PTR 12[rax], r13d
	mov	DWORD PTR 16[rax], ebx
	mov	DWORD PTR 20[rax], r12d
	pop	rbx
	.cfi_def_cfa_offset 40
	pop	rbp
	.cfi_def_cfa_offset 32
	pop	r12
	.cfi_def_cfa_offset 24
	pop	r13
	.cfi_def_cfa_offset 16
	pop	r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE57:
	.size	new_RECTANGLE, .-new_RECTANGLE
	.globl	new_TRIANGLE
	.type	new_TRIANGLE, @function
new_TRIANGLE:
.LFB58:
	.cfi_startproc
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 24
	.cfi_def_cfa_offset 80
	mov	r12, rdi
	mov	rbp, rsi
	mov	rbx, rdx
	mov	DWORD PTR 12[rsp], ecx
	mov	r15, rdi
	sar	r15, 32
	mov	r14, rsi
	sar	r14, 32
	mov	r13, rdx
	sar	r13, 32
	mov	edi, 32
	call	malloc@PLT
	mov	BYTE PTR [rax], 116
	mov	edx, DWORD PTR 12[rsp]
	mov	DWORD PTR 4[rax], edx
	mov	DWORD PTR 8[rax], r12d
	mov	DWORD PTR 12[rax], r15d
	mov	DWORD PTR 16[rax], ebp
	mov	DWORD PTR 20[rax], r14d
	mov	DWORD PTR 24[rax], ebx
	mov	DWORD PTR 28[rax], r13d
	add	rsp, 24
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE58:
	.size	new_TRIANGLE, .-new_TRIANGLE
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"c %d %d %d %hhd\n"
	.text
	.globl	toString_CIRCLE
	.type	toString_CIRCLE, @function
toString_CIRCLE:
.LFB59:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sub	rsp, 8
	.cfi_def_cfa_offset 32
	mov	rbx, rdi
	mov	edi, 34
	call	malloc@PLT
	mov	rbp, rax
	sub	rsp, 8
	.cfi_def_cfa_offset 40
	mov	eax, DWORD PTR 4[rbx]
	push	rax
	.cfi_def_cfa_offset 48
	mov	eax, DWORD PTR 16[rbx]
	push	rax
	.cfi_def_cfa_offset 56
	mov	eax, DWORD PTR 12[rbx]
	push	rax
	.cfi_def_cfa_offset 64
	mov	r9d, DWORD PTR 8[rbx]
	lea	r8, .LC3[rip]
	mov	ecx, 34
	mov	edx, 1
	mov	esi, 34
	mov	rdi, rbp
	mov	eax, 0
	call	__snprintf_chk@PLT
	mov	rax, rbp
	add	rsp, 40
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE59:
	.size	toString_CIRCLE, .-toString_CIRCLE
	.section	.rodata.str1.1
.LC4:
	.string	"r %d %d %d %d %hhd\n"
	.text
	.globl	toString_RECTANGLE
	.type	toString_RECTANGLE, @function
toString_RECTANGLE:
.LFB60:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sub	rsp, 8
	.cfi_def_cfa_offset 32
	mov	rbx, rdi
	mov	edi, 34
	call	malloc@PLT
	mov	rbp, rax
	mov	eax, DWORD PTR 4[rbx]
	push	rax
	.cfi_def_cfa_offset 40
	mov	eax, DWORD PTR 20[rbx]
	push	rax
	.cfi_def_cfa_offset 48
	mov	eax, DWORD PTR 16[rbx]
	push	rax
	.cfi_def_cfa_offset 56
	mov	eax, DWORD PTR 12[rbx]
	push	rax
	.cfi_def_cfa_offset 64
	mov	r9d, DWORD PTR 8[rbx]
	lea	r8, .LC4[rip]
	mov	ecx, 34
	mov	edx, 1
	mov	esi, 34
	mov	rdi, rbp
	mov	eax, 0
	call	__snprintf_chk@PLT
	mov	rax, rbp
	add	rsp, 40
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE60:
	.size	toString_RECTANGLE, .-toString_RECTANGLE
	.section	.rodata.str1.1
.LC5:
	.string	"t %d %d %d %d %d %d %hhd\n"
	.text
	.globl	toString_TRIANGLE
	.type	toString_TRIANGLE, @function
toString_TRIANGLE:
.LFB61:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sub	rsp, 8
	.cfi_def_cfa_offset 32
	mov	rbx, rdi
	mov	edi, 34
	call	malloc@PLT
	mov	rbp, rax
	mov	eax, DWORD PTR 4[rbx]
	push	rax
	.cfi_def_cfa_offset 40
	mov	eax, DWORD PTR 28[rbx]
	push	rax
	.cfi_def_cfa_offset 48
	mov	eax, DWORD PTR 24[rbx]
	push	rax
	.cfi_def_cfa_offset 56
	mov	eax, DWORD PTR 20[rbx]
	push	rax
	.cfi_def_cfa_offset 64
	mov	eax, DWORD PTR 16[rbx]
	push	rax
	.cfi_def_cfa_offset 72
	mov	eax, DWORD PTR 12[rbx]
	push	rax
	.cfi_def_cfa_offset 80
	mov	r9d, DWORD PTR 8[rbx]
	lea	r8, .LC5[rip]
	mov	ecx, 34
	mov	edx, 1
	mov	esi, 34
	mov	rdi, rbp
	mov	eax, 0
	call	__snprintf_chk@PLT
	mov	rax, rbp
	add	rsp, 56
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE61:
	.size	toString_TRIANGLE, .-toString_TRIANGLE
	.globl	toString
	.type	toString, @function
toString:
.LFB62:
	.cfi_startproc
	sub	rsp, 8
	.cfi_def_cfa_offset 16
	movzx	eax, BYTE PTR [rdi]
	cmp	al, 114
	je	.L27
	cmp	al, 116
	je	.L28
	cmp	al, 99
	je	.L33
	mov	eax, 0
	jmp	.L25
.L33:
	call	toString_CIRCLE
.L25:
	add	rsp, 8
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L27:
	.cfi_restore_state
	call	toString_RECTANGLE
	jmp	.L25
.L28:
	call	toString_TRIANGLE
	jmp	.L25
	.cfi_endproc
.LFE62:
	.size	toString, .-toString
	.globl	GetSquare
	.type	GetSquare, @function
GetSquare:
.LFB63:
	.cfi_startproc
	sub	rsp, 8
	.cfi_def_cfa_offset 16
	movzx	eax, BYTE PTR [rdi]
	cmp	al, 114
	je	.L36
	cmp	al, 116
	je	.L37
	pxor	xmm0, xmm0
	cmp	al, 99
	je	.L44
.L34:
	add	rsp, 8
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L44:
	.cfi_restore_state
	mov	eax, DWORD PTR 16[rdi]
	pxor	xmm1, xmm1
	cvtsi2ssq	xmm1, rax
	movaps	xmm0, xmm1
	mulss	xmm0, DWORD PTR .LC0[rip]
	mulss	xmm0, xmm1
	cvtss2sd	xmm0, xmm0
	jmp	.L34
.L36:
	sub	rsp, 24
	.cfi_def_cfa_offset 40
	mov	rax, QWORD PTR [rdi]
	mov	rdx, QWORD PTR 8[rdi]
	mov	QWORD PTR [rsp], rax
	mov	QWORD PTR 8[rsp], rdx
	mov	rax, QWORD PTR 16[rdi]
	mov	QWORD PTR 16[rsp], rax
	call	GetSquare_RECTANGLE
	add	rsp, 24
	.cfi_def_cfa_offset 16
	jmp	.L34
.L37:
	sub	rsp, 32
	.cfi_def_cfa_offset 48
	mov	rax, QWORD PTR [rdi]
	mov	rdx, QWORD PTR 8[rdi]
	mov	QWORD PTR [rsp], rax
	mov	QWORD PTR 8[rsp], rdx
	mov	rax, QWORD PTR 16[rdi]
	mov	rdx, QWORD PTR 24[rdi]
	mov	QWORD PTR 16[rsp], rax
	mov	QWORD PTR 24[rsp], rdx
	call	GetSquare_TRIANGLE
	add	rsp, 32
	.cfi_def_cfa_offset 16
	jmp	.L34
	.cfi_endproc
.LFE63:
	.size	GetSquare, .-GetSquare
	.globl	BinarySearch
	.type	BinarySearch, @function
BinarySearch:
.LFB64:
	.cfi_startproc
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 24
	.cfi_def_cfa_offset 80
	mov	r14, rdi
	mov	r13, rsi
	mov	ebx, edx
	cmp	ecx, edx
	jg	.L46
	mov	rdi, rsi
	call	GetSquare
	movsd	QWORD PTR 8[rsp], xmm0
	movsx	rax, ebx
	mov	rdi, QWORD PTR [r14+rax*8]
	call	GetSquare
	lea	eax, 1[rbx]
	movsd	xmm2, QWORD PTR 8[rsp]
	ucomisd	xmm2, xmm0
	cmovbe	eax, ebx
.L45:
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
.L46:
	.cfi_restore_state
	mov	r12d, ecx
	lea	edx, [rcx+rdx]
	mov	ebp, edx
	shr	ebp, 31
	add	ebp, edx
	sar	ebp
	mov	rdi, rsi
	call	GetSquare
	movsd	QWORD PTR 8[rsp], xmm0
	movsx	rax, ebp
	lea	r15, [r14+rax*8]
	mov	rdi, QWORD PTR [r15]
	call	GetSquare
	movsd	xmm1, QWORD PTR 8[rsp]
	ucomisd	xmm1, xmm0
	jp	.L49
	lea	eax, 1[rbp]
	ucomisd	xmm1, xmm0
	je	.L45
.L49:
	mov	rdi, r13
	call	GetSquare
	movsd	QWORD PTR 8[rsp], xmm0
	mov	rdi, QWORD PTR [r15]
	call	GetSquare
	movsd	xmm3, QWORD PTR 8[rsp]
	ucomisd	xmm3, xmm0
	ja	.L59
	lea	ecx, -1[rbp]
	mov	edx, ebx
	mov	rsi, r13
	mov	rdi, r14
	call	BinarySearch
	jmp	.L45
.L59:
	lea	edx, 1[rbp]
	mov	ecx, r12d
	mov	rsi, r13
	mov	rdi, r14
	call	BinarySearch
	jmp	.L45
	.cfi_endproc
.LFE64:
	.size	BinarySearch, .-BinarySearch
	.globl	sort
	.type	sort, @function
sort:
.LFB65:
	.cfi_startproc
	cmp	esi, 1
	jle	.L68
	push	r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	push	r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	push	r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	push	rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	push	rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	mov	rbp, rdi
	lea	r14d, -2[rsi]
	add	r14, 1
	mov	r12d, 0
.L64:
	mov	ebx, r12d
	mov	r13, QWORD PTR 8[rbp+r12*8]
	mov	ecx, r12d
	mov	edx, 0
	mov	rsi, r13
	mov	rdi, rbp
	call	BinarySearch
	cmp	r12d, eax
	jl	.L62
.L63:
	movsx	rdx, ebx
	mov	rcx, QWORD PTR 0[rbp+rdx*8]
	mov	QWORD PTR 8[rbp+rdx*8], rcx
	sub	ebx, 1
	cmp	eax, ebx
	jle	.L63
.L62:
	movsx	rbx, ebx
	mov	QWORD PTR 8[rbp+rbx*8], r13
	add	r12, 1
	cmp	r12, r14
	jne	.L64
	pop	rbx
	.cfi_def_cfa_offset 40
	pop	rbp
	.cfi_def_cfa_offset 32
	pop	r12
	.cfi_def_cfa_offset 24
	pop	r13
	.cfi_def_cfa_offset 16
	pop	r14
	.cfi_def_cfa_offset 8
	ret
.L68:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	rep ret
	.cfi_endproc
.LFE65:
	.size	sort, .-sort
	.section	.rodata.str1.1
.LC6:
	.string	"r"
.LC7:
	.string	"w"
.LC8:
	.string	"%c"
.LC9:
	.string	" %c "
.LC10:
	.string	" %d %d %d %hhd"
.LC11:
	.string	" %d %d %d %d %hhd"
.LC12:
	.string	" %d %d %d %d %d %d %hhd"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC13:
	.string	"undefined symbol '%c'\t at %ld\n"
	.section	.rodata.str1.1
.LC14:
	.string	"READ finished: %d objects\n"
.LC15:
	.string	"SORT finished"
.LC16:
	.string	"%c %d %lf\n"
.LC17:
	.string	"free(elems)"
.LC18:
	.string	"SAVING.."
.LC19:
	.string	"OK"
	.text
	.globl	main
	.type	main, @function
main:
.LFB66:
	.cfi_startproc
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 40
	.cfi_def_cfa_offset 96
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 24[rsp], rax
	xor	eax, eax
	cmp	edi, 1
	jle	.L96
	mov	rbp, rsi
	mov	rdi, QWORD PTR 8[rsi]
	lea	rsi, .LC6[rip]
	call	fopen@PLT
	mov	rbx, rax
	mov	rdi, QWORD PTR 16[rbp]
	lea	rsi, .LC7[rip]
	call	fopen@PLT
	mov	QWORD PTR 8[rsp], rax
	mov	ebp, 0
	lea	r12, 23[rsp]
	jmp	.L73
.L97:
	add	ebp, 1
.L73:
	mov	rdi, rbx
	call	feof@PLT
	test	eax, eax
	jne	.L104
	mov	BYTE PTR 23[rsp], 0
	mov	rdx, r12
	lea	rsi, .LC8[rip]
	mov	rdi, rbx
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	movzx	eax, BYTE PTR 23[rsp]
	lea	edx, -114[rax]
	test	dl, -3
	je	.L97
	cmp	al, 99
	je	.L97
	jmp	.L73
.L104:
	mov	rdi, rbx
	call	rewind@PLT
	movsx	rdi, ebp
	sal	rdi, 3
	call	malloc@PLT
	mov	r13, rax
	mov	r12d, 0
	lea	r14, 23[rsp]
	jmp	.L77
.L106:
	mov	eax, r12d
	lea	r15, 0[r13+rax*8]
	mov	edx, 0
	mov	esi, 0
	mov	edi, 0
	call	new_CIRCLE
	mov	QWORD PTR [r15], rax
	lea	rcx, 12[rax]
	lea	rdx, 8[rax]
	lea	r9, 4[rax]
	lea	r8, 16[rax]
	lea	rsi, .LC10[rip]
	mov	rdi, rbx
	mov	eax, 0
	call	__isoc99_fscanf@PLT
.L82:
	movzx	eax, BYTE PTR 23[rsp]
	lea	edx, -114[rax]
	test	dl, -3
	je	.L98
	cmp	al, 99
	jne	.L77
.L98:
	add	r12d, 1
.L77:
	mov	rdi, rbx
	call	feof@PLT
	test	eax, eax
	jne	.L105
	mov	BYTE PTR 23[rsp], 0
	mov	rdx, r14
	lea	rsi, .LC9[rip]
	mov	rdi, rbx
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	movzx	eax, BYTE PTR 23[rsp]
	cmp	al, 114
	je	.L79
	cmp	al, 116
	je	.L80
	cmp	al, 99
	je	.L106
	mov	rdi, rbx
	call	ftell@PLT
	movsx	edx, BYTE PTR 23[rsp]
	mov	rcx, rax
	lea	rsi, .LC13[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	jmp	.L82
.L79:
	mov	eax, r12d
	lea	r15, 0[r13+rax*8]
	mov	edx, 0
	mov	esi, 0
	mov	edi, 0
	call	new_RECTANGLE
	mov	QWORD PTR [r15], rax
	lea	rcx, 12[rax]
	lea	rdx, 8[rax]
	sub	rsp, 8
	.cfi_def_cfa_offset 104
	lea	rsi, 4[rax]
	push	rsi
	.cfi_def_cfa_offset 112
	lea	r9, 20[rax]
	lea	r8, 16[rax]
	lea	rsi, .LC11[rip]
	mov	rdi, rbx
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	add	rsp, 16
	.cfi_def_cfa_offset 96
	jmp	.L82
.L80:
	mov	eax, r12d
	lea	r15, 0[r13+rax*8]
	mov	ecx, 0
	mov	edx, 0
	mov	esi, 0
	mov	edi, 0
	call	new_TRIANGLE
	mov	QWORD PTR [r15], rax
	lea	rcx, 12[rax]
	lea	rdx, 8[rax]
	sub	rsp, 8
	.cfi_def_cfa_offset 104
	lea	rsi, 4[rax]
	push	rsi
	.cfi_def_cfa_offset 112
	lea	rsi, 28[rax]
	push	rsi
	.cfi_def_cfa_offset 120
	lea	rsi, 24[rax]
	push	rsi
	.cfi_def_cfa_offset 128
	lea	r9, 20[rax]
	lea	r8, 16[rax]
	lea	rsi, .LC12[rip]
	mov	rdi, rbx
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	add	rsp, 32
	.cfi_def_cfa_offset 96
	jmp	.L82
.L105:
	mov	edx, ebp
	lea	rsi, .LC14[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	esi, ebp
	mov	rdi, r13
	call	sort
	lea	rdi, .LC15[rip]
	call	puts@PLT
	test	ebp, ebp
	je	.L86
	mov	r12, r13
	lea	eax, -1[rbp]
	lea	r15, 8[r13+rax*8]
	mov	rbp, r13
	lea	r14, .LC16[rip]
	jmp	.L91
.L108:
	mov	ecx, DWORD PTR 8[rax]
	sub	rsp, 8
	.cfi_def_cfa_offset 104
	mov	edx, DWORD PTR 4[rax]
	push	rdx
	.cfi_def_cfa_offset 112
	mov	r9d, DWORD PTR 16[rax]
	mov	r8d, DWORD PTR 12[rax]
	lea	rdx, .LC3[rip]
	mov	esi, 1
	mov	rdi, QWORD PTR 24[rsp]
	mov	eax, 0
	call	__fprintf_chk@PLT
	add	rsp, 16
	.cfi_def_cfa_offset 96
.L87:
	add	rbp, 8
	cmp	rbp, r15
	je	.L107
.L91:
	mov	rdi, QWORD PTR 0[rbp]
	call	GetSquare
	mov	rax, QWORD PTR 0[rbp]
	mov	ecx, DWORD PTR 4[rax]
	movsx	edx, BYTE PTR [rax]
	mov	rsi, r14
	mov	edi, 1
	mov	eax, 1
	call	__printf_chk@PLT
	mov	rax, QWORD PTR 0[rbp]
	movzx	edx, BYTE PTR [rax]
	cmp	dl, 114
	je	.L88
	cmp	dl, 116
	je	.L89
	cmp	dl, 99
	jne	.L87
	jmp	.L108
.L89:
	mov	ecx, DWORD PTR 8[rax]
	mov	edx, DWORD PTR 4[rax]
	push	rdx
	.cfi_def_cfa_offset 104
	mov	edx, DWORD PTR 28[rax]
	push	rdx
	.cfi_def_cfa_offset 112
	mov	edx, DWORD PTR 24[rax]
	push	rdx
	.cfi_def_cfa_offset 120
	mov	edx, DWORD PTR 20[rax]
	push	rdx
	.cfi_def_cfa_offset 128
	mov	r9d, DWORD PTR 16[rax]
	mov	r8d, DWORD PTR 12[rax]
	lea	rdx, .LC5[rip]
	mov	esi, 1
	mov	rdi, QWORD PTR 40[rsp]
	mov	eax, 0
	call	__fprintf_chk@PLT
	add	rsp, 32
	.cfi_def_cfa_offset 96
	jmp	.L87
.L88:
	mov	ecx, DWORD PTR 8[rax]
	mov	edx, DWORD PTR 4[rax]
	push	rdx
	.cfi_def_cfa_offset 104
	mov	edx, DWORD PTR 20[rax]
	push	rdx
	.cfi_def_cfa_offset 112
	mov	r9d, DWORD PTR 16[rax]
	mov	r8d, DWORD PTR 12[rax]
	lea	rdx, .LC4[rip]
	mov	esi, 1
	mov	rdi, QWORD PTR 24[rsp]
	mov	eax, 0
	call	__fprintf_chk@PLT
	add	rsp, 16
	.cfi_def_cfa_offset 96
	jmp	.L87
.L96:
	mov	eax, -1
	jmp	.L71
.L107:
	lea	rsi, .LC18[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	rdi, rbx
	call	fclose@PLT
	mov	rdi, QWORD PTR 8[rsp]
	call	fclose@PLT
	lea	rdi, .LC19[rip]
	call	puts@PLT
.L93:
	mov	rdi, QWORD PTR [r12]
	call	free@PLT
	add	r12, 8
	cmp	r12, rbp
	jne	.L93
.L94:
	lea	rdi, .LC17[rip]
	call	puts@PLT
	mov	rdi, r13
	call	free@PLT
	mov	eax, 0
.L71:
	mov	rbx, QWORD PTR 24[rsp]
	xor	rbx, QWORD PTR fs:40
	jne	.L109
	add	rsp, 40
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
.L86:
	.cfi_restore_state
	lea	rsi, .LC18[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	rdi, rbx
	call	fclose@PLT
	mov	rdi, QWORD PTR 8[rsp]
	call	fclose@PLT
	lea	rdi, .LC19[rip]
	call	puts@PLT
	jmp	.L94
.L109:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE66:
	.size	main, .-main
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1078530011
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	0
	.long	1071644672
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
