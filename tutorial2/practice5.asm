%include '../mstdio.asm'

SECTION .data
    cStar        db      "*"
    cEmpty       db      " "
    cLine        db      0Ah

SECTION .text
global _start

_start:
    mov ecx, 1
    .loop01:
        mov     edx, 10
        .loop02:
            cmp     edx, ecx
            jg      .space
            .star:
                mov     eax, cStar
                call    cprint
                jmp     .loop02_
            .space:
                mov     eax, cEmpty
                call    cprint
            .loop02_:
                dec     edx
                cmp     edx, 0
                jg      .loop02
        mov     eax, cLine
        call    cprint
        inc     ecx
        cmp     ecx, 10
        jle     .loop01
    
    call    quit