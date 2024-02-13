%include "../include/io.mac"

    ;;
    ;;   TODO: Declare 'avg' struct to match its C counterpart
    ;;

struc avg
    .quo: resw 1
    .remain: resw 1
endstruc

struc proc
    .pid: resw 1
    .prio: resb 1
    .time: resw 1
endstruc

    ;; Hint: you can use these global arrays
section .data
    prio_result dd 0, 0, 0, 0, 0
    time_result dd 0, 0, 0, 0, 0

section .text
    global run_procs
    extern printf

run_procs:
    ;; DO NOT MODIFY

    push ebp
    mov ebp, esp
    pusha

    xor ecx, ecx

clean_results:
    mov dword [time_result + 4 * ecx], dword 0
    mov dword [prio_result + 4 * ecx],  0

    inc ecx
    cmp ecx, 5
    jne clean_results

    mov ecx, [ebp + 8]      ; processes
    mov ebx, [ebp + 12]     ; length
    mov eax, [ebp + 16]     ; proc_avg
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    mov edi, 1 ; prioritatea curenta
    imul ebx, 5 ; inmultim lungimea cu marimea structurii

priority:
    xor esi, esi ; contorul

next_elem:
    push edi ; salvam prioritatea curenta
    mov dl, byte [ecx + esi + proc.prio] ; v[esi].prio
    movzx edx, dl

    cmp edx, edi
    jne no_add ; daca v[esi].prio nu este egala cu prioritatea curenta

    dec edi ; scadem prioritatea cu 1
    imul edi, 4 ; inmultim prioritatea cu marimea unui int

    inc dword [prio_result + edi] ; mareste numarul de prioritati
    mov dx, word [ecx + esi + proc.time]
    add dword [time_result + edi], edx ; adauga timpul prioritatii la suma totala

no_add:
    pop edi ; se scoate prioritatea originala
    add esi, 5 ; adaugam marimea structurii la contor

    cmp esi, ebx
    jl next_elem ; trece la urmatorul element din vector

    inc edi ; trece la urmatoarea prioritate
    cmp edi, 5
    jle priority ; daca nu au fost verificate toate prioritatile

done:
    xor edx, edx ; golim pe edx pentru a fi contor

divide:
    push edx ; salvam contorul
    mov edi, dword [prio_result + edx] ; impartitorul
    mov esi, dword [time_result + edx] ; deimpartitul
    
    cmp edi, 0
    je no_divide ; daca impartitorul este 0, nu se poate imparti

    push eax ; salvam adresa vectorului
    xor edx, edx ; golim pe edx
    xor eax, eax ; golim pe eax

    mov eax, esi ; mutam deimpartitul in eax
    div edi ; impartim la edi
    mov esi, edx ; mutam restul in esi
    mov edx, eax ; mutam catul in edx

    pop eax ; scoatem adresa vectorului
    pop edi ; scoatem contorul original
    mov word [eax + edi + avg.quo], dx ; catul
    mov word [eax + edi + avg.remain], si ; restul
    jmp end

no_divide:
    pop edi ; scoatem contorul original
    mov word [eax + edi + avg.quo], 0 ; catul
    mov word [eax + edi + avg.remain], 0 ; restul

end:
    mov edx, edi ; pun contorul original inapoi in edx

    add edx, 4 ; creste contorul
    cmp edx, 16
    jle divide ; se trece la urmatorul prio si time

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY