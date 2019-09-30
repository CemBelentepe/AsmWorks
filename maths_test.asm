; Its a math instructions learning program

%include 'mstdio.asm'

SECTION .text
    global _start

_start:
    mov     eax, 40
    mov     ebx, 80
    sub     eax, ebx
    call    iprintLF

    mov     eax, ebx
    call    iprintLF

    call    quit