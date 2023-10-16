; tinh giai thua ham asm khong doi
MODEL small
.DATA 
EXTRN _a:WORD 
.CODE
PUBLIC @pow$qi
@pow$qi PROC
PUSH BP
MOV BP, SP
        mov bx, _a
        mov cx, [BP + 4]
        mov ax,1
        and cx,cx
        jz L2
    L1:
        mul bx      ; ax*bx -> ax (dx=0)
        loop L1
    L2:
        POP BP
        ret
@pow$qi ENDP
END