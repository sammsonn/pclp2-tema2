%include "../include/io.mac"

;; defining constants, you can use these as immediate values in your code
LETTERS_COUNT EQU 26

section .data
    extern len_plain

section .text
    global rotate_x_positions
    global enigma
    extern printf

; void rotate_x_positions(int x, int rotor, char config[10][26], int forward);
rotate_x_positions:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; x
    mov ebx, [ebp + 12] ; rotor
    mov ecx, [ebp + 16] ; config (address of first element in matrix)
    mov edx, [ebp + 20] ; forward
    ;; DO NOT MODIFY
    ;; TODO: Implement rotate_x_positions
    ;; FREESTYLE STARTS HERE

    imul ebx, 52 ; inmultim nr rotorului cu nr de elemente de pe 2 linii
    cmp edx, 1
    je rotate_right ; daca trebuie rotit la dreapta

rotate_left:
    cmp eax, 0
    je done ; daca nu sunt rotiri de realizat

    mov dl, byte [ecx + ebx]
    push edx ; salveaza primul termen din prima linie
    mov dl, byte [ecx + ebx + 26]
    push edx ; salveaza primul termen din a doua linie

    xor esi, esi ; contor
    mov edi, ebx ; copie a lui ebx

move_left:
    ;; se realizeaza permutarea pe prima linie
    mov dl, byte [ecx + edi + 1]
    mov byte [ecx + edi], dl

    ;; se realizeaza permutarea pe a doua linie
    mov dl, byte [ecx + edi + 27]
    mov byte [ecx + edi + 26], dl

    inc edi ; creste pozitia
    inc esi ; creste contorul
    cmp esi, 25
    jl move_left ; daca au fost mutate la stanga toate literele

    pop edx
    mov byte [ecx + edi + 26], dl ; se pune primul termen pe ultima pozitie in a doua linie
    pop edx
    mov byte [ecx + edi], dl ; se pune primul termen pe ultima pozitie in prima linie

    dec eax ; scade contorul
    cmp eax, 0
    jg rotate_left ; daca mai sunt de facut rotiri
    jmp done ; daca s-au realizat toate rotirile

rotate_right:
    cmp eax, 0
    je done ; daca nu sunt rotiri de realizat

    mov dl, byte [ecx + ebx + 25]
    push edx ; salveaza ultimul termen din prima linie
    mov dl, byte [ecx + ebx + 51]
    push edx ; salveaza ultimul termen din a doua linie

    xor esi, esi ; contor
    mov edi, ebx ; copie a lui ebx
    add edi, 25

move_right:
    ;; se realizeaza permutarea pe prima linie
    mov dl, byte [ecx + edi - 1]
    mov byte [ecx + edi], dl

    ;; se realizeaza permutarea pe a doua linie
    mov dl, byte [ecx + edi + 25]
    mov byte [ecx + edi + 26], dl

    dec edi ; scade pozitia
    inc esi ; creste contorul
    cmp esi, 25
    jl move_right ; daca au fost mutate la dreapta toate literele

    pop edx
    mov byte [ecx + edi + 26], dl ; se pune ultimul termen pe prima pozitie in a doua linie
    pop edx
    mov byte [ecx + edi], dl ; se pune ultimul termen pe prima pozitie in prima linie

    dec eax ; scade contorul
    cmp eax, 0
    jg rotate_right ; daca mai sunt de facut rotiri

done:

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY

; void enigma(char *plain, char key[3], char notches[3], char config[10][26], char *enc);
enigma:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; plain (address of first element in string)
    mov ebx, [ebp + 12] ; key
    mov ecx, [ebp + 16] ; notches
    mov edx, [ebp + 20] ; config (address of first element in matrix)
    mov edi, [ebp + 24] ; enc
    ;; DO NOT MODIFY
    ;; TODO: Implement enigma
    ;; FREESTYLE STARTS HERE


    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY