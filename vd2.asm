.MODEL small
.STACK 100h
.DATA
m db 'huy khanh0 huy khanh',0
.CODE
PS:
      mov ax,@data
      mov ds,ax
      lea si,m
    L1:    ; loop dua tren chi so si
      mov al,[si]
      and al,al
      jz KT ; neu al =0 thi dung co z = 0 ket thuc loop
      mov ah,0eh ; hien thi 1 ki tu nen man hinh
      int 10h    ; hien thi 1 ki tu nen man hinh
      inc si     ; si += 1
      jmp L1     ;
     KT:
      mov ah,4ch
      int 21h
      END PS
