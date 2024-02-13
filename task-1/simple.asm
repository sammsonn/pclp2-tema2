%include "../include/io.mac"
	
section .text
	global simple
	extern printf
	
simple:
	;; DO NOT MODIFY
	push ebp
	mov ebp, esp
	pusha
	
	mov ecx, [ebp + 8]           ; len
	mov esi, [ebp + 12]          ; plain
	mov edi, [ebp + 16]          ; enc_string
	mov edx, [ebp + 20]          ; step
	
	;; DO NOT MODIFY
	
	;; Your code starts here
	
	xor eax, eax ; initializam eax cu 0
	
cipher:
	mov al, byte [esi] ; extragem litera curenta
	add al, dl ; adaugam pasul
	cmp al, 'Z'
	jle ok ; daca litera nu iese din alfabet
	
	;; daca iese, o pozitionam din nou in alfabet
    sub al, 'Z' + 1
	add al, 'A'
	
ok:
	mov byte [edi], al ; punem litera noua in sir
	
    ;; trecem la urmatoara litera in siruri
	inc esi
	inc edi
	loop cipher ; se repeta pentru toate literele
	
	;; Your code ends here
	
	;; DO NOT MODIFY
	
	popa
	leave
	ret
	
	;; DO NOT MODIFY
