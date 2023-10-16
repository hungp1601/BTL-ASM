INCLUDE lib1.asm
_stack segment
 db 100h dup(?)
_stack ends


data segment
m1 db 0dh,0ah,'     Hay vao a: $' ; 0dh = 13 co so 10
m2 db 13,10,'     Hay vao n: $' ; 0ah = 10  co so 10 
xh db 13,10,'     $'
m3 db '  luy thua $'
m4 db '  la: $'
tieptuc db 13,10, '     co tiep tuc CT (c/k)? $'
data ends

code segment
assume cs:code, ds:data, ss:_stack
PS: 
            mov ax,data
            mov ds,ax 
        L0:
            clrscr
            HienString m1 
            call VAO_SO_N
            mov bx, ax          ; bx = a 
            HienString m2
            call VAO_SO_N
            mov cx,ax           ; cx = n
            HienString xh
            mov ax,bx
            call HIEN_SO_N
            HienString m3 
            mov ax, cx 
            CALL HIEN_SO_N
            HienString m4
            mov ax,1
            and cx,cx
            jz L2 
        L1: 
            mul bx              ; ax=ax*bx
            loop L1
        L2: 
            call HIEN_SO_N
            HienString tieptuc
            mov ah,1
            int 21h
            cmp al,'c'
            jne  KT
            jmp L0
        KT: 
            mov ah, 4ch 
            int 21h

INCLUDE lib2.asm
code ends 
END PS 
