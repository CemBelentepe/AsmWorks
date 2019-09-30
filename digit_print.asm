; Prints digits from 0 to 10

%include 'mstdio.asm'

SECTION .text
    global _start

_start:
    mov     ecx, 10

printLoop:
    cmp     ecx, 0
    jz      endLoop
    dec     ecx

    mov     eax, ecx
    add     eax, 48

    push    eax
    mov     eax, esp
    call    sprintLF
    pop     eax

    jmp     printLoop
endLoop:
    call    quit