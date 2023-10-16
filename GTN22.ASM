; tinh giai thua ham asm khong doi
MODEL small
.CODE
PUBLIC @giaithua$qi ; tham tri qi, khong co tham so la qv 
@giaithua$qi PROC
PUSH BP 
MOV BP,SP
        mov cx,[BP+4] ; BP + 4 dia chi o nho duoc truy cap trong stack. BP la con tro dau stack 
        mov ax,1
        cmp cx,2
        jb L2
    L1:
        mul cx      ; ax*cx -> dx:ax (dx=0)
        loop L1
    L2:
        POP BP
        ret
@giaithua$qi ENDP
END