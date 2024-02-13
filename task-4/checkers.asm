%include "../include/io.mac"
	
section .data
	
section .text
	global checkers
	extern printf
	
checkers:
	;; DO NOT MODIFY
	push ebp
	mov ebp, esp
	pusha
	
	mov eax, [ebp + 8]           ; x
	mov ebx, [ebp + 12]          ; y
	mov ecx, [ebp + 16]          ; table
	
	;; DO NOT MODIFY
	;; FREESTYLE STARTS HERE
	
down_left:
	;; cazurile in care nu se poate accesa pozitia din stanga jos
	cmp ebx, 0
	je down_right
	cmp eax, 0
	je down_right

	;; se marcheaza pozitia din stanga jos
	lea edx, [ecx + (eax - 1) * 8]
	mov byte [edx + ebx - 1], 1
	
down_right:
	;; cazurile in care nu se poate accesa pozitia din dreapta jos
	cmp ebx, 7
	je up_left
	cmp eax, 0
	je up_left

	;; se marcheaza pozitia din dreapta jos
	lea edx, [ecx + (eax - 1) * 8]
	mov byte [edx + ebx + 1], 1
	
up_left:
	;; cazurile in care nu se poate accesa pozitia din stanga sus
	cmp ebx, 0
	je up_right
	cmp eax, 7
	je up_right

	;; se marcheaza pozitia din stanga sus
	lea edx, [ecx + (eax + 1) * 8]
	mov byte [edx + ebx - 1], 1
	
up_right:
	;; cazurile in care nu se poate accesa pozitia din dreapta sus
	cmp ebx, 7
	je done
	cmp eax, 7
	je done

	;; se marcheaza pozitia din dreapta sus
	lea edx, [ecx + (eax + 1) * 8]
	mov byte [edx + ebx + 1], 1
	
done:
	
	;; FREESTYLE ENDS HERE
	;; DO NOT MODIFY
	popa
	leave
	ret
	;; DO NOT MODIFY
