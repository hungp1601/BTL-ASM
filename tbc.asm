INCLUDE lib1.asm
MODEL small
.DATA 
EXTRN _x: WORD, _y: WORD, _z: WORD
.CODE 
PUBLIC @sum3so$qv
@sum3so$qv PROC 
    mov ax,_x
    mov bx,_y 
    mov cx,_z
    add ax,bx
    add ax,cx
    ret
@sum3so$qv ENDP 
END 