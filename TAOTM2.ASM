INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA

m1 db 13,10,'               CHUC NANG TAO THU MUC'
    db 13,10,'          -------------------------------'
    db 13,10,13,10,'        HAY VAO TEN THU MUC CAN TAO: $'
Err_TM db 13,10,'           Khong tao duoc thu muc! $'
Suc_TM db 13,10,'           Thu muc da duoc tao ! $' 
buff        db 30
            db ?
dir_name db 30 dup(?)
tieptuc db 13,10, '         Co tiep tuc CT  (c/k)? $'
 .CODE 
 PS:
    mov ax, @data 
    mov ds,ax
  L0:
    clrscr
    HienString m1
    lea dx, buff 
    call GET_DIR_NAME
    lea dx, dir_name
    mov ah,39h 
    int 21h
    jnc L1 
    HienString Err_TM 
    jmp KT
  L1: 
    HienString Suc_TM
  KT:
    HienString tieptuc
    mov ah,1
    int 21h
    cmp al, 'c'
    jne Thoat 
    jmp L0
  Thoat: 
    mov ah, 4ch 
    int 21h

INCLUDE lib3.asm
END PS