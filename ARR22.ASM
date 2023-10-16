MODEL small
.DATA 
EXTRN _a:DWORD;
.CODE
PUBLIC @SUM$qi
@SUM$qi PROC
PUSH BP
MOV BP, SP
        mov cx, [BP + 4]
        mov ax, SEG _a ; dia chi segment cua a
        mov es, ax
        mov bx, OFFSET _a 
        xor ax, ax
    L1:
        add  ax, es:[bx]     ; ax*cx -> dx:ax (dx=0)
        add  bx,2
        loop L1
        POP BP 
        ret 
@SUM$qi ENDP
END