; Prints a number to the console

%include 'mstdio.asm'

SECTION .text
    global _start

_start:
    mov     ecx, 15

.printLoop:
    mov     eax, ecx
    call    iprintLF

    dec     ecx
    cmp     ecx, 0
    jge     .printLoop

    call    quit