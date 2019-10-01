%include 'mstdio.asm'

SECTION .data
    star1       db      "****", 0
    star2       db      "*  *", 0

SECTION .text
global _start

_start:
    mov     eax, star1
    call    sprintLF

    mov     ecx, 0
    loop:
        mov     eax, star2
        call    sprintLF
        inc     ecx
        cmp     ecx, 7
        jl      loop

    mov     eax, star1
    call    sprintLF
    
    call    quit