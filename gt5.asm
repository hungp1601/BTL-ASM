.MODEL small
.STACK 100h
.DATA 
.CODE
PS:
    mov cx,5
    mov ax,1
  L1:
    mul cx              ; ax*cx -> ax 
    loop L1             ; cx -= 1
    ; tap cau lenh ket thuc chuong trinh
    mov ah,4ch          ;
    int 21h             ;
    END PS              ;

