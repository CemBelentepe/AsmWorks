%include '../mstdio.asm'
SECTION .data
    msg     db      "Sum of all numbers from 1 to 50: ", 0
SECTION .text
global _start

_start:
    mov     eax, 0
    mov     ecx, 0
    loop:
        inc     ecx
        add     eax, ecx
        cmp     ecx, 50
        jl      loop
    
    push    eax
    mov     eax, msg
    call    sprint
    pop     eax

    call    iprintLF

    call    quit