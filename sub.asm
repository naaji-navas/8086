.model small
.stack 100h

.data
data segment
    num1 db ?
    num2 db ?
    difference db ?
    msg1 db 10,13,'Enter first number: $'
    msg2 db 10,13,'Enter second number: $'
    msg3 db 10,13,'Difference is: $'
data ends

.code
code segment
assume cs:code,ds:data
start:
    mov ax,data
    mov ds,ax
    lea dx,msg1
    call print
    call read
    mov num1,al

    lea dx,msg2
    call print
    call read
    mov num2,al
    sub al,num1
    mov difference,al

    mov ah,0h
    aas
    add ah,30h
    add al,30h
    mov bx,ax
    lea dx,msg3
    call print
    mov ah,02h
    mov dl,bh
    int 21h
    mov ah,02h
    mov dl,bl
    int 21h

    mov ah,4ch
    int 21h
    
    print:
        mov ah,9
        int 21h
        ret
    read:
        mov ah,01h
        int 21h
        sub al,30h
        ret
code ends
end start
