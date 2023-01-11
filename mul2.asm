.model small
.stack 100h
.data
data segment
    num1 db ?
    num2 db ?
    product db ?
    str1 db 13,10,"Enter the first string : $"
    str2 db 13,10,"Enter the second string : $"
    str3 db 13,10,"The product is 20 : $"
data ends

.code
code segment
assume cs:code,ds:data
start:
    mov ax,data
    mov ds,ax
    lea dx,str1

    mov ah,09h
    int 21h
    mov ah,01h
    int 21h
    sub al,30h
    mov num1,al
    lea dx, str2
    mov ah,09h
    int 21h
    mov ah,01h
    int 21h
    sub al,30h
    mov num2,al
    mul num1
    mov product ,al
    aam
    mov ah,30h
    mov al,30h
    mov bx,ax
    lea dx,str3
    mov ah,09h
    int 21h
    mov ah,02h
    mov dl,bh
    int 21h
    mov dl,bl
    int 21h
    mov ah,4ch
    int 21h
end start
code ends
