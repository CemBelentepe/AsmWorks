%include 'mstdio.asm'
SECTION .data
    msg     db      "Sum of all numbers from 3n+1 from n=0 to n=13: ", 0
SECTION .text
global _start

_start:
    mov     eax, 0
    mov     ecx, 1
    loop:
        add     ecx, 3
        add     eax, ecx
        cmp     ecx, 40
        jl      loop
    
    push    eax
    mov     eax, msg
    call    sprint
    pop     eax

    call    iprintLF

    call    quit