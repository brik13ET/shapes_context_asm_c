; call conv rdi, rsi, rdx, rcx, r8, r9, [[xyz]mm0-7]
; ret in rax
; double struct: sign - 63; 52..62 - exponent; 0..51 - fraction

RED equ 0
ORANGE equ 1
YELLOW equ 2
GREEN equ 3
SKYBLUE equ 4
BLUE equ 5
PURPLE equ 6

%macro enter 0
	push	rbp
	mov	rbp,	rsp
%endmacro

%macro leave 0
	mov	rsp,	rbp
	pop	rbp
%endmacro

; a, b, cnt
%macro memcmp 3
push	rax
push	rbx
mov	rbx,	%3
%%while:
cmp	rbx,	0
je	%%endwhile
dec	rbx
mov	ah,	[%1 + rbx]
cmp	ah,	[%2 + rbx]
je	%%while
jne	%%endwhile
%%endwhile:
pop	rbx
pop	rax
%endmacro

; dst, src, cnt
%macro mem2mem 3
push	rax
push	rbx
mov	rax,	%3
%%for:
cmp	rax,	0
je	%%endfor
mov	bl,	[%2 + rax]
mov	[%1 + rax], bl

jmp	%%for
%%endfor:
pop	rbx
pop	rax
%endmacro

struc POSITION, -40
.x resb 4
.y resb 4
endstruc

struc SHAPE, -40
.t resb 1
.c resb 1
endstruc

struc Circle, -40
.t resb 1 ; char type
.c resb 1 ; enum Color
.a1 resb POSITION_size
.radius resb 4 ; uint radius
endstruc

struc Rect, -40
.t resb 1
.c resb 1
.a1 resb POSITION_size
.a2 resb POSITION_size
endstruc

struc Triangle, -40
.t resb 1
.c resb 1
.a1 resb POSITION_size
.a2 resb POSITION_size
.a3 resb POSITION_size
endstruc

section .text
global sort
extern BinarySearch

sort:
	enter
; int i = dword [rbp], loc = dword [rbp+4], j = dword [rbp+8]
; struct SHAPE* selected = qword [rbp+12]
; args:
; struct SHAPE** a = rdi
; int n = rsi
	push	rax
	sub	rsp,	12
	sub	rsp,	8
	mov	[rbp],	dword 1
.for:	cmp	[rbp],	rsi
	jnl	.endfor
	inc	dword [rbp]

	mem2mem rbp+8, rbp, 4
	sub	dword [rbp+8],	1
	lea	rax,	 [rbp]
	lea	rax,	[rdi + rax]
	mov	rax,	[rax]
	mov	[rbp+12],	rax
	
	push	rsi
	push	rdx
	push	rcx
	
	mov	rsi,	[rbp + 12]
	mov	rdx,	0
	mov	rcx,	[rbp+8]
	call	BinarySearch
	mov	[rbp+4],	rax

	pop	rcx
	pop	rdx
	pop	rsi

.while:
	memcmp	rbp+8,	rbp+4, 4
	jl	.endwhile
	mov	rax,	rdi
	add	eax,	[rbp]
	mov	rax,	[rax]
	push	rbx
	mov	rbx,	rax	
	
	mov	rax,	rdi
	add	eax,	[rbp+8]
	inc	rax
	mov	[rax],	rbx
	pop	rbx
	
	sub	[rbp+8], dword	1
	jmp	.while
.endwhile:
	mov	rax,	rdi
	add	rax,	[rbp+8]
	inc	rax
	mem2mem	rax, rbp+12, 8
	jmp	.for
.endfor:
	pop	rax
	leave
ret
