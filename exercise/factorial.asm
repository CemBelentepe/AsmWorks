%include '../mstdio.asm'

SECTION .data
    sIn     db          "Enter x: ", 0
    sOut    db          "The result is: ", 0

SECTION .bss
    x:      resb        4

SECTION .text
global _start

_start:
    mov     eax, sIn
    call    sprint

    mov     eax, x
    call    iinput

    ; eax = factorial(x)
    mov     eax, [x]
    call    factorial
    mov     DWORD[x], eax

    mov     eax, sOut
    call    sprint

    mov     eax, [x]
    call    iprintLF

    call    quit


;--------------------------------------
; int factorial(int x)
factorial:
    cmp     eax, 2
    jl      .ret1

    push    ebp
    mov     ebp, esp
    sub     esp, 4              ; int* a = ebp-4
    
    push    eax                 ; ebp-8 = eax
    dec     eax                 ; eax--
    call    factorial           ; eax = factorial(eax)
    mov     DWORD[ebp-4], eax   ; a = eax
    pop     eax                 ; eax = ebp-8
    mul     DWORD[ebp-4]        ; eax *= a
    
    mov     esp, ebp
    pop     ebp
    ret

    .ret1:
        mov     eax, 1
        ret