.model small
.stack 100h

.data
data segment
    num1 db ?
    num2 db ?
    sum db ?
    msg1 db 10,13, 'Enter the first number: $'
    msg2 db 10,13, 'Enter the second number: $'
    msg3 db 10,13, 'The sum is: $'
data ends

code segment
assume cs:code,ds:data
start:
    mov ax,data
    mov ds,ax

    mov dx,offset msg1
    call print

    call read
    mov num1,al

    mov dx,offset msg2
    call print

    call read

    mov num2,al

    mov al,num1
    add al,num2
    mov sum,al
    mov ah,0h
    aaa
    add ah,30h
    add al,30h
    mov bx,ax

    mov dx,offset msg3
    call print
    
    mov ah,02h
    mov dl,bh
    int 21h
    mov ah,02h
    mov dl,bl
    int 21h

    mov ah,4ch
    int 21h

    read:
        mov ah,01h 
        int 21h
        sub al,30h
        ret
        
    print:
        mov ah,09h
        int 21h
        ret
code ends
end

    