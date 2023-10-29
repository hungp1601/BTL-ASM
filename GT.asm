INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
      m1 db 13,10, 'Hay vao n: $'
      m2 db 13,10, 'Giai thua cua $'
      m3 db' la: $'
      m4 db 13,10,'Gia tri cua bieu thuc la: $'
      daucham db '.$'
      tieptuc db 13,10, 'Co tiep tuc chuong trinh (c/k)? $'
.CODE
PS:       mov ax, @data
          mov ds, ax
     L0:
          clrscr     ;xoa man hinh
          HienString m1   ;hien hay vao n
          call VAO_SO_N
          HienString m2
          call HIEN_SO_N
          HienString m3
          mov cx, ax
          mov si, ax
          mov ax,1
          cmp cx,2
          jb L2
      L1:
          mul cx
          loop L1
      L2:
          call HIEN_SO_N
;tien hanh phep chia
          HienString m4
          add si, 3
          xor dx,dx
          div si
          call HIEN_SO_N
          and dx,dx
          jz KT
          HienString daucham
          mov cx, 3
          mov di, 10
      L3:
          mov ax, dx
          mul di
          div si
          call HIEN_SO_N
          and dx,dx
          jz KT
          loop L3
      KT:
          HienString tieptuc
          mov ah,1
          int 21h
          cmp al,'c'
          jne Thoat
          jmp L0
      Thoat:
          mov ah, 4ch
          int 21h
INCLUDE lib2.asm
END PS
