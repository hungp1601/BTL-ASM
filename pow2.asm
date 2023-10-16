; tinh giai thua ham asm khong doi
MODEL small
.DATA 
EXTRN _n:WORD, _a:WORD 
.CODE
PUBLIC @pow$qv
@pow$qv PROC
        mov bx, _a
        mov cx, _n
        mov ax,1
        and cx,cx
        jz L2
    L1:
        mul bx      ; ax*bx -> ax (dx=0)
        loop L1
    L2:
        ret
@pow$qv ENDP
END