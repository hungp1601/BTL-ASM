.MODEL small
.STACK 100h
.DATA
m db 'Hello, asm !!!$'
.CODE
PS:
      mov ax,@data
      mov ds,ax
      lea dx,m
      mov ah,9
      int 21h
      mov ah,4ch
      int 21h
      END PS
