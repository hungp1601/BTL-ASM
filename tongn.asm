INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
M1  db 13,10,'     BAI KIEM TRA'
    db 13,10,'   ------o0o------'
    db 13,10,'     Hay vao N : $'
M2  db 13,10,'     Tong tu 1 den $'
M3  db ' la : $ '
m5 db 13,10,'    Gia tri cua bieu thuc la: $'
dautru db '-$'
daucham db '.$'
tieptuc  db 10,13,'Co tiep tuc (c/k) ? $'
buffvs db 8
       db ?
       db 8 dup(?)
.CODE
PS:
    clrscr
	mov  ax,@data
	mov  ds,ax

	HienString M1	; Hiện thông báo M1 (‘Hay vao N : ‘)
	call   VAO_SO_N	; Nhận giá trị N
	mov  cx,ax		; cx = N (chỉ số vòng lặp)
    mov  si, ax
	HienString M2	; Hiện thông báo M2 (’Tong tu 1 den ‘)
	call   HIEN_SO_N	; Hiện giá trị N
	HienString M3	; Hiện thông báo M3 (’ la : ‘)
	dec   cx		; Giảm cx đi 1 (n-1)
L1:
	add  ax,cx		; ax = ax+cx  
	loop  L1
	call  HIEN_SO_N	; Hiện giá trị biểu thức
;Tien hanh phep chia

            HienString m5
            and ax, ax
            jns L3
            HienString dautru
            neg ax
        L3:
            xor dx, dx
            div si                  ; ax = thương dx = dư
            call HIEN_SO_N
            and dx, dx
            jz KT
            HienString daucham
            mov cx, 5
            mov di, 10
        L4:
            mov ax, dx
            mul di
            div si
            call HIEN_SO_N
            and dx, dx
            jz KT
            loop L4
        KT:
	        HienString tieptuc	
	        mov  ah,1		; Chờ nhận 1 ký tự từ bàn phím
	        int     21h
	        cmp  al,'c'		; Ký tự vừa nhận có phải là ký tự ‘c’ ?
	        jne    Exit		; Nếu không phải thì nhảy đến nhãn Exit (về DOS)
	        jmp   PS		; Còn không thì quay về đầu (bắt đầu lại chương trình)
        Exit:
	        mov  ah,4ch		; Về DOS
	        int     21h
INCLUDE lib2.asm
	END PS
