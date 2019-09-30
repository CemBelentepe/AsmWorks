; A calculator that can do + - * /

%include 'mstdio.asm'

SECTION .data
    msg1    db      "Please enter the first number: ", 0h
    msg2    db      "Please enter the second number: ", 0h
    msg3    db      "Please enter the operation: ", 0h
    msg4    db      "Answer is: ", 0h
    again   db      "Would you want to use it again? [y/n]", 0h
    errMsg  db      "Error occured, please try again.", 0h

SECTION .bss
    num1:   resd    1
    num2:   resd    1
    op:     resb    2

SECTION .text
    global _start

    _start:
        .start:
            mov     eax, msg1
            call    sprint
            mov     eax, num1
            call    iinput

            mov     eax, msg2
            call    sprint
            mov     eax, num2
            call    iinput

            mov     eax, msg3
            call    sprint
            mov     eax, op
            call    cinput
        .add:
            cmp     byte[op], '+'
            jne     .sub
            mov     eax, [num1]
            add     eax, [num2]
            mov     [num1], eax
            jmp     .print
        .sub:
            cmp     byte[op], '-'
            jne     .mul
            mov     eax, [num1]
            sub     eax, [num2]
            mov     [num1], eax
            jmp     .print
        .mul:
            cmp     byte[op], '*'
            jne     .div
            mov     eax, [num1]
            mov     ebx, [num2]
            mul     ebx
            mov     [num1], eax
            jmp     .print
        .div:
            cmp     byte[op], '/'
            jne     .err
            mov     edx, 0
            mov     eax, [num1]
            mov     ebx, [num2]
            div     ebx
            mov     [num1], eax
            jmp     .print

        .print:
            mov     eax, msg4
            call    sprint
            mov     eax, [num1]
            call    iprintLF

            mov     eax, again
            call    sprintLF
            mov     eax, op
            mov     ebx, 2
            call    sinput

            cmp     byte[op], 'y'
            je      .start
            cmp     byte[op], 'Y'
            je      .start

        .close:
            call    quit
        .err:
            mov     eax, errMsg
            call    sprintLF
            jmp     .start