.model small
.stack 100h

.data
    hello_message db 'Hello, World!', '$'

.code
    org 100h

    mov ah, 09h        ; DOS function to print a string
    lea dx, hello_message ; Load the address of the message into DX
    int 21h            ; Call the DOS interrupt

    mov ah, 4Ch        ; DOS function to exit
    int 21h            ; Call the DOS interrupt
end
