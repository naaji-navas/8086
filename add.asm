.model small
.stack 100h
.data
data segment
num1 db ?
num2 db ?
sum db ?
msg1 db 10,13,"Enter first number: $"
msg2 db 10,13,"Enter second number: $"
msg3 db 10,13,"sum is: $"
data ends

code segment
assume ds:data,cs:code
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
    add al,num1
    mov sum,al
    mov ah,0h
    aaa
    add ah,30h
    add al,30h
    mov bx,ax
    lea dx,msg3
    call print
    mov ah,02h ;To print a character on screen 
    mov dl,bh  ; we have to move the character to dl
    int 21h   ; and then call the interrupt 21h
    mov ah,02h ;To print a character on screen
    mov dl,bl ; we have to move the character to dl
    int 21h  ; and then call the interrupt 21h

    mov ah,40h
    int 21h
    sub al,30h
    print:
        mov ah,09h
        int 21h
        ret
    read:
        mov ah,01h
        int 21h
        sub al,30h
        ret
    
code ends
end start
