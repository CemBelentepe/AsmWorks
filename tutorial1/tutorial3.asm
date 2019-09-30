%include 'mstdio.asm'

SECTION .data
    msg1        db      "Enter the first number: "  , 0
    msg2        db      "Enter the second number: " , 0
    msg3        db      " is a multiple of " , 0
    msg4        db      " is not a multiple of " , 0
    dot         db      "."
SECTION .bss
    input1:     resd    1
    input2:     resd    1

SECTION .text
global _start

_start:
        ;input 1
        mov     eax, msg1
        call    sprint
        mov     eax, input1
        call    iinput

        ;input 2
        mov     eax, msg2
        call    sprint
        mov     eax, input2
        call    iinput

        mov     edx, 0
        mov     eax, [input1]
        div     DWORD[input2]

        mov     eax, [input1]
        call    iprint

        cmp     edx, 0
        je      .if01
        mov     eax, msg4
        jmp     .if01_
    .if01:
        mov     eax, msg3
    .if01_:
        call    sprint
        mov     eax, [input2]
        call    iprint
        mov     eax, dot
        call    cprintLF

        call    quit