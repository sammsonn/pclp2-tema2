%include "../include/io.mac"
	
section .data
	
section .text
	global bonus
	extern printf
	
bonus:
	;; DO NOT MODIFY
	push ebp
	mov ebp, esp
	pusha
	
	mov eax, [ebp + 8]           ; x
	mov ebx, [ebp + 12]          ; y
	mov ecx, [ebp + 16]          ; board
	
	;; DO NOT MODIFY
	;; FREESTYLE STARTS HERE
	
	xor edi, edi ; numara pozitiile valide

down_left:
	;; cazurile in care nu se poate accesa pozitia din stanga jos
	cmp ebx, 0
	je down_right
	cmp eax, 0
	je down_right

	;; calculeaza distanta dintre pozitia din stanga jos si inceputul matricii
	mov edx, eax
	dec edx
	imul edx, 8
	mov esi, ebx
	dec esi
	add edx, esi
	
	inc edi ; creste contorul
	push edx ; salveaza distanta
	
down_right:
	;; cazurile in care nu se poate accesa pozitia din dreapta jos
	cmp ebx, 7
	je up_left
	cmp eax, 0
	je up_left

	;; calculeaza distanta dintre pozitia din dreapta jos si inceputul matricii
	mov edx, eax
	dec edx
	imul edx, 8
	mov esi, ebx
	inc esi
	add edx, esi
	
	inc edi ; creste contorul
	push edx ; salveaza distanta
	
up_left:
	;; cazurile in care nu se poate accesa pozitia din stanga sus
	cmp ebx, 0
	je up_right
	cmp eax, 7
	je up_right

	;; calculeaza distanta dintre pozitia din stanga sus si inceputul matricii
	mov edx, eax
	inc edx
	imul edx, 8
	mov esi, ebx
	dec esi
	add edx, esi
	
	inc edi ; creste contorul
	push edx ; salveaza distanta
	
up_right:
	;; cazurile in care nu se poate accesa pozitia din dreapta sus
	cmp ebx, 7
	je done
	cmp eax, 7
	je done

	;; calculeaza distanta dintre pozitia din dreapta sus si inceputul matricii
	mov edx, eax
	inc edx
	imul edx, 8
	mov esi, ebx
	inc esi
	add edx, esi
	
	inc edi ; creste contorul
	push edx ; salveaza distanta
	
done:
	;; goleste registrii
	xor eax, eax
	xor ebx, ebx
	xor edx, edx
	
sum:
	pop edx ; se scoate distanta
	cmp edx, 32
	jge big ; daca este in jumatatea de sus
	mov esi, 1 ; se initializeaza rezultatul ridicarii la putere
	
power:
	;; se calculeaza 2 la puterea egala cu distanta
	imul esi, 2
	dec edx
	cmp edx, 0
	jg power
	
	add ebx, esi ; se adauga rezultatul la suma de jos
	jmp repeat
	
big:
	mov esi, 1 ; se initializeaza rezultatul ridicarii la putere
	sub edx, 32 ; calculeaza distanta fata de inceputul submatricii de sus
	
power_big:
	;; se calculeaza 2 la puterea egala cu distanta
	imul esi, 2
	dec edx
	cmp edx, 0
	jg power_big
	
	add eax, esi ; se adauga rezultatul la suma de sus
	
repeat:
	dec edi ; scade contorul
	cmp edi, 0
	jg sum ; daca mai sunt pozitii valide
	
	mov dword [ecx], eax ; se pune suma de sus in vector
	mov dword [ecx + 4], ebx ; se pune suma de jos in vector
	
	;; FREESTYLE ENDS HERE
	;; DO NOT MODIFY
	popa
	leave
	ret
	;; DO NOT MODIFY
