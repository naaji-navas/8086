.model small
.stack 100h
data segment
num1 db ?
num2 db ?
sum db ?
msg1 db 10,13, "enter first number: $"
msg2 db 10,13, "enter second number: $"
msg3 db 10,13, "result is : $"
data ends

code segment
assume ds:data ,cs:code
start:
mov ax,data
mov ds,ax
lea dx,msg1
mov ah, 09h
int 21h
mov ah,1h
int 21h
sub al,30h
mov num1, al
lea dx, msg2
mov ah, 09h
int 21h
mov ah, 01h
int 21h
sub al, 30h
mov num2, al
sub num1, al
mov sum , al
mov ah,0h
aas
add ah, 30h
add al,30h
mov bx,ax
lea dx , msg3
mov ah,9h
int 21h
mov ah, 02h
mov dl, bh
int 21h
mov ah, 02h
mov dl, bl
int 21h
mov ah,40h
int 21h
code ends
end start