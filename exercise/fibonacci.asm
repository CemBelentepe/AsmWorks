%include '../mstdio.asm'

SECTION .data
    sIn     db          "Enter max index: ", 0
    space   db          " "

SECTION .bss
    x:      resb        4

SECTION .text
global _start

_start:
    mov     eax, sIn
    call    sprint

    mov     eax, x
    call    iinput

    mov     ecx, 0
    .fibbloop:
        ; eax = factorial(x)
        mov     eax, ecx
        call    fibb
        call    iprint
        mov     eax, space
        call    cprint

        inc     ecx
        cmp     ecx, [x]
        jl      .fibbloop 

    mov     eax, space
    call    cprintLF
    call    quit


;--------------------------------------
; int fibb(int x)
fibb:
    cmp     eax, 2
    jl      .ret1

    push    ebp
    mov     ebp, esp
    sub     esp, 4 ; int* a = ebp-4

    push    eax
    dec     eax
    call    fibb
    mov     DWORD[ebp-4], eax
    pop     eax
    sub     eax, 2
    call    fibb
    add     eax, DWORD[ebp-4]

    mov     esp, ebp
    pop     ebp
    ret

    .ret1:
        mov     eax, 1
        ret