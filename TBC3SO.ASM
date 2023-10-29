INCLUDE lib1.asm
.MODEL small
.stack 100h
.DATA
m1 db 13,10,'TRUNG BINH CONG 3 SO'
   db 13,10,'-----------o--------'
   db 13,10,'Hay vao so thu nhat: $'
m2 db 13,10,'Hay vao nso thu hai: $'
m3 db 13,10,'Hay vao nso thu ba: $'

xh db 13,10,'$'
m4 db 'Luy thua $'
m5 db ' la:$'
m6 db 13,10,'TBC 3 so la: $'
dautru db '-$'
daucham db '.$'
tieptuc db 13,10,'Co tiep tuc CT(c/k)? $'
 buffvs db 8
        db ?
        db 8 dup(?)
 .CODE
 PS:
        mov ax,@data
        mov ds,ax
        clrscr

        HienString m1
        call VAO_SO_N
        mov bx,ax

        HienString m2
        call VAO_SO_N
        add ax,bx

	mov bx,ax

	HienString m3
        call VAO_SO_N
        mov cx,ax
	add bx,cx

	mov ax,bx

	HienString m6

	mov si,3
	
	and ax,ax
	jns L1
	HienString dautru
	neg ax
L1:
	xor dx,dx
	div si
	call HIEN_SO_N
	and dx,dx
	jz KT
	HienString daucham
	mov cx,5
	mov di,10
L2:
	mov ax,dx
	mul di
	div si
	call HIEN_SO_N
	and dx,dx
	jz KT
	loop L2
KT:
	HienString tieptuc
	mov ah,1
	int 21h
	cmp al,'c'
	jne Thoat
	jmp PS
Thoat:
	mov ah,4ch
	int 21h	

     INCLUDE lib2.asm
     END PS


