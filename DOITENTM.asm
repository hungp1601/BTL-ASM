INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
tm db 13,10,'Hay vao ten thu muc can doi ten:$'
err db 13,10,'Khong tim thay thu muc!$'
err_1 db 13,10,'Doi ten tm that bai!$'
suc db 13,10,'Doi ten thu muc thanh cong!$'
nf  db 13,10,'Ten thu muc sau khi doi la: $'
buff db 30
     db ?
dir_name db 30 dup(?)
new_name db 30 dup(?)
tieptuc db 13,10,'Co tiep tuc ct (c/k)?$'
.CODE
PS:
        mov ax, @data
        mov ds,ax
     L0:
        clrscr
        HienString tm
        lea dx, buff
        call GET_FILE_NAME
        lea dx, dir_name
        mov ah,4Eh
        int 21h
        jnc L1
        HienString err
        jmp Exit
     L1:
        clrscr
        HienString nf
       ; lea dx, dir_name
       lea si, buff
       call GET_FILE_NAME
       lea si, new_name
       lea dx, dir_name
        mov ah, 3Bh
        int 21h
        jnc L2
        HienString suc
        jmp Exit
     L2:
        HienString suc
     Exit:
        HienString tieptuc
        mov ah,1
        int 21h
        cmp al,'c'
        jne Thoat
        jmp L0
    Thoat:
        mov ah,4ch
        int 21h
INCLUDE lib3.asm
END PS
