include LIB1.ASM
.model small
.stack 100h 
.data
m1 db 13,10,' thong tin ve dma va com'
   db 13,10,'-----------------------'
   db 13,10,13,10,'MT dang dung co BMA khong ? $'
,2 db,13,10,'mt dang dung co BMA khong? $',
co db 'Co$'
ko db 'khong$'
m3 db 13,10, ' so luong cong COM la : $'
m4 db 13,10, 'dia chi cong com la: $'
space db '  $'

.com 
ps.
    mov ax,  @data
    mov dc,ax
    clrscr
    HienString m1
    int 11h
    mov a1,ah
    shr al,1 
    jc L1
    HienString ko
    jmp L2
  L1:
    HienString co
  L2:
    HienString m2
    and a1,00000111b
    jnz L3
    HienString m3
    jmp KT
  L3:
    HienString co
    mov cl,al 
    xor ch,ch
    HienString m3
    add a1,30h
    mov ah, 0ch
    int 10h
    HienString m4
    xor ax,ax
    mov es,ax
    mov bx,400h
  L4:
    mov ax,es:[bx]
    call HIEN_HEXA
    HienString space
    add bx,2
    loop L4
  KT: 
    mov ah,1
    int 21h
    mov ah,4ch
    int 21h
include LIB2.ASM

