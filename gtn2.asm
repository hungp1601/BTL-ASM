; tinh giai thua ham asm khong doi
MODEL small
.DATA 
EXTRN _n:WORD
.CODE
PUBLIC @giaithua$qv
@giaithua$qv PROC
        mov cx,_n
        mov ax,1
        cmp cx,2
        jb L2
    L1:
        mul cx      ; ax*cx -> dx:ax (dx=0)
        loop L1
    L2:
        ret
@giaithua$qv ENDP
END