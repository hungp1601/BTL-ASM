; tinh giai thua ham asm 2 doi
MODEL small
.CODE
PUBLIC @pow$qii
@pow$qii PROC
PUSH BP
MOV BP, SP
        mov bx, [BP + 4]; gia tri a 
        mov cx, [BP + 6] ; gia tri n
        mov ax,1
        and cx,cx
        jz L2
    L1:
        mul bx      ; ax*bx -> ax (dx=0)
        loop L1
    L2:
        POP BP
        ret
@pow$qii ENDP
END