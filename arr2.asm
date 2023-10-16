MODEL small
.DATA 
EXTRN _n:WORD, _a:DWORD;
.CODE
PUBLIC @SUM$qv
@SUM$qv PROC
        mov cx,_n
        mov ax, SEG _a ; dia chi segment cua a
        mov es, ax
        mov bx, OFFSET _a 
        xor ax, ax

    L1:
        add  ax, es:[bx]     ; ax*cx -> dx:ax (dx=0)
        add  bx,2
        loop L1
        ret
@SUM$qv ENDP
END