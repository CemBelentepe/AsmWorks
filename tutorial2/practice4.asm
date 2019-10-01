%include 'mstdio.asm'

SECTION .data
    cStar       db      "*"
    line        db      0Ah

SECTION .text
global _start

_start:
    mov ecx, 1
    .loop01:
        mov     edx, 0
        .loop02:
            mov     eax, cStar
            call    cprint
            inc     edx
            cmp     edx, ecx
            jl      .loop02
        mov     eax, line
        call    cprint
        inc     ecx
        cmp     ecx, 10
        jle      .loop01
    
    call    quit