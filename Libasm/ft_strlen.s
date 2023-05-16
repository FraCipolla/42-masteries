TITLE 'extern "C" unsigned long long strlen_asm_x64(const char *string);'

PUBLIC	strlen_asm_x64

_TEXT	SEGMENT
strlen_asm_x64 PROC

	push rdi        ; mette il contenuto del registro in cima allo stack (rdi = destination index)
	mov  rdi, rcx   ; *string da rdi a rcx (8 byte)
	mov  rcx, 0FFFFFFFFFFFFFFFFh
	xor  rax, rax
	cld
	repne scasb
	xor  rcx, 0FFFFFFFFFFFFFFFFh
	dec  rcx
	mov  rax, rcx
	pop  rdi

	ret
	
strlen_asm_x64 ENDP
_TEXT	ENDS
END