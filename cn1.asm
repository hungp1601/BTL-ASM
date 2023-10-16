;-------------------------------
;   MACRO HIEN MOT XAU KY TU	|
; KET THUC BANG '$' RA MAN HINH	|
;-------------------------------
HienString MACRO xau
	push AX DX
	mov  DX,offset xau	; DX tro den dau xau
	mov  AH,9		; Chuc nang hien 1 xau ky tu 
	int  21h		; (ket thuc bang '$') len man hinh
	pop  DX AX
	ENDM
;--------------------
; MACRO XOA MAN HINH |
;--------------------
CLRSCR MACRO
	push AX
	mov  AH,0fh		; Chuc nang lay mode man hinh hien thoi
	int  10h		; va so mode nam o AL
	mov  AH,0		; Chuc nang dat mode cho man hinh
	int  10h		; so mode can dat nam o AL
	pop  AX
	ENDM
;-----------------------------



.MODEL small 
.STACK 100h
.DATA 

m1 db 13,10, '                  Chuc nang copy tep ' 
    db 13,10, '                 -----------oOo--------'
    db 13,10,13,10, '           Vao ten tep can copy di: $'

m2 db 13,10, '                  Vao ten tep can copy den: $'
Err_O   db 13,10,'              Khong mo duoc tep! $'
Err_R   db 13,10,'              Khong doc duoc tep!$'
Err_G   db 13,10, '             Khong ghi duoc tep!$'
Err_C   db 13,10, '             Khong dong duoc tep!$'
theteps  dw ?
thetepd   dw ?
buff            db 30 
                db ?
file_name       db 30 dup(?)
dem db 512 dup(?)
tieptuc     db 13,10, '         Co tiep tuc CT (c/k)?'
.CODE 
PUBLIC _COPYTEP
_COPYTEP PROC
            L0:
                clrscr
                HienString m1

                lea dx, buff 
                call GET_FILE_NAME
                lea dx, file_name
                mov al, 0
                mov ah, 3dh
                int 21h
                jnc L1 
                HienString Err_O
                jmp KT 
            L1:
                mov theteps, ax
                HienString m2 
                lea dx,buff 
                call GET_FILE_NAME
                lea dx, file_name
                xor cx,cx 
                mov ah, 3ch 
                int 21h
                jnc L2 
                HienString Err_O
                jmp DONGTEPS
            L2:
                mov thetepd, ax 
            ; Doc 512 mb truoc tiep -> dem 
            L3:
                mov bx, theteps
                mov cx, 512
                lea dx,dem
                mov ah, 3fh 
                int 21h 
                jnc L4
                HienString Err_R 
                jmp DONGTEPS
            L4: 
                and ax,ax 
                jz KT 
                mov bx, thetepd
                mov cx,ax 
                lea dx, dem
                mov ah, 40h 
                int 21h 
                jnc L5
                HienString Err_G
                jmp DONGTEPS
            L5:
                jmp L3
            DONGTEPS:
                mov bx,theteps
                mov ah,3eh 
                int 21h
                jnc DONGTEPD 
                HienString Err_C
            DONGTEPD:
                mov bx, thetepd
                mov ah,3eh 
                int 21h
                jnc KT
                HienString Err_C
            KT:
                HienString tieptuc
                mov ah,1
                int 21h 
                cmp al, 'c'
                jne Exit 
                jmp L0
            Exit:
                ret
_COPYTEP ENDP
INCLUDE lib3.asm
END