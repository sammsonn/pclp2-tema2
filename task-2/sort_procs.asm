%include "../include/io.mac"

struc proc
    .pid: resw 1
    .prio: resb 1
    .time: resw 1
endstruc

section .text
    global sort_procs
    extern printf

sort_procs:
    ;; DO NOT MODIFY
    enter 0,0
    pusha

    mov edx, [ebp + 8]      ; processes
    mov eax, [ebp + 12]     ; length
    ;; DO NOT MODIFY

    ;; Your code starts here

    dec eax ; scadem lungimea cu 1

sort:
    mov edi, 1 ; marcheaza daca vectorul este sortat

    mov esi, 0 ; contor

compare:
    push esi ; salvam contorul
    imul esi, 5 ; inmultim contorul cu marimea structurii

    mov bl, byte [edx + esi + proc.prio] ; v[esi].prio
    mov cl, byte [edx + esi + 5 + proc.prio] ; v[esi + 1].prio

    cmp bl, cl ; verifica daca v[esi].prio este mai mic decat v[esi+1].prio
    jl no_swap
    jg swap

check_time:
    mov bx, word [edx + esi + proc.time] ; v[esi].time
    mov cx, word [edx + esi + 5 + proc.time] ; v[esi + 1].time

    cmp bx, cx ; verifica daca v[esi].time este mai mic decat v[esi +1].time
    jl no_swap
    jg swap

check_pid:
    mov bx, word [edx + esi + proc.pid] ; v[esi].pid
    mov cx, word [edx + esi + 5 + proc.pid] ; v[esi + 1].pid

    cmp bx, cx ; verifica daca v[esi].pid este mai mic decat v[esi +1].pid
    jle no_swap
    jg swap


swap:
    ;; se interschimba elementele din vector
    mov ebx, [edx + esi]
    mov ecx, [edx + esi + 5]
    mov [edx + esi], ecx
    mov [edx + esi + 5], ebx

    mov edi, 0 ; se marcheaza ca vectorul nu este sortat inca

no_swap:
    pop esi ; se scoate contorul original
    inc esi ; mareste contorul

    cmp esi, eax
    jl compare ; daca e mai mic decat len-1, se repeta

    cmp edi, 0
    je sort ; daca vectorul inca nu este sortat

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY