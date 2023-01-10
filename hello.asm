.model small
.stack 100h
.data
    text db 'Hello Najiiii $'
.code
    begin:
        mov ax,@data ;@data is a predefined macro that points to the start of the data segment
        mov ds,ax ;ds is the data segment register

        mov dx,offset text ;offset is a predefined macro that points to the start of the string
        mov ah,09h ;09h is the interrupt number for printing a string
        int 21h ;21h is the interrupt number for the dos

        mov ah,4ch ;4ch is the interrupt number for exiting the program
        int 21h ;21h is the interrupt number for the dos
    end begin
