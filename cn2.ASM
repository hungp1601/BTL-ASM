INCLUDE lib1.asm
.model small
.stack 100h
.data
outp1 db 10,13,'TINH TONG CAP SO CONG $'
outp2 db 10,13,'---------------------- $'
inpn db 10,13,'hay vao n: $'
inpd db 10,13,'hay vao d: $'
inpu1 db 10,13,'hay vao u1: $'
outp db 10,13,'tong cap so cong la: $'
tieptuc db 10,13,'An phim bat ky de ve Main Menu $'
.code
PUBLIC @CN2$qv
@CN2$qv PROC
    PS:
        clrscr     
	HienString outp1
	HienString outp2                                                                                                                                                                                                                   
        HienString inpn ; hien thong bao inpn 'hay vao n'
        call VAO_SO_N ;nhan gia tri n
        mov cx,ax ;cx=n
        HienString inpd ; hien thong bao inpd 'hay vao d'
        call VAO_SO_N ;nhan gia tri d
        mov bx,ax       ;bx = d
        HienString inpu1        ; hien thong bao inpu1 'hay vao u1'
        call VAO_SO_N   ;nhan gia tri u1
        mov dx,ax       ;dx=ax=u1 (ax = tong = u1, dx = ui va luc dau bang u1)
        dec cx          ; giam cx di 1 (n-1)                                                                                                                                                                                             
   L1:
        add dx,bx       ; dx = ui (ui=dx+bx)
        add ax,dx       ; ax = ax + dx (dx = ui) tongcap so cong
        loop L1
        HienString outp         ; hien thong bao outp 'tong cap so cong la:'
        call HIEN_SO_N          ;hien tong cap so cong =  ax
        HienString tieptuc      ; hien thong bao 'An phim bat ky de ve Main Menu?'
        mov ah,1        ; cho nhan 1 ky tu tu ban phim
        int 21h
        cmp al,'.'      ; ky tu vua nhan co phai la ky tu 'c'?
        jne Exit        ; neu khong phai thi nhay ve nhan exit(ve dos)
        jmp PS          ; con ko thi quay ve dau (bat dau lai chuong trinh)
    Exit:
        mov ah,4ch      ; ve dos
        int 21h
        ret
@CN2$qv ENDP
INCLUDE lib2.asm                                                                                                        
END
