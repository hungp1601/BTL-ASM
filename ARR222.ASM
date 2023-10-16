MODEL small 
.CODE
PUBLIC @SUM$qini
@SUM$qini PROC
PUSH BP
MOV BP, SP
        mov cx, [BP + 4]
        les  bx, [BP+6] ;  les lay 2 byte dau dua vao bx, 2 byte sau dua vao es 
        xor ax, ax
    L1:
        add  ax, es:[bx]     ; ax*cx -> dx:ax (dx=0)
        add  bx,2
        loop L1
        POP BP
        ret 
@SUM$qini ENDP
END