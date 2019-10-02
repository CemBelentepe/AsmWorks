%include '../mstdio.asm'

SECTION .data
    num1        dd      "x"
SECTION .text
global _start

_start:
    mov     eax, num1
    call    cprintLF



    call    quit