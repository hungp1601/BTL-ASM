INCLUDE lib1.asm
.MODEL small
.DATA
	M1    db 'May tinh dang dung co o mem không ? $'
	co    db 'Co $'
	khong db 'Khong $'
	M2    db 13,10,'So luong o mem ma may tinh co la : $'
.CODE
PUBLIC @OMEM$qv
@OMEM$qv PROC
	L0:
	     clrscr
	     HienString M1      	
	     int        11h     	
	     shr        al,1    	
	     jc         L1      	
	     HienString khong   	;
	     jmp        Exit    	; 
	L1:  
	     HienString co      	;
	     HienString M2      	
	     mov        cl,5    	
	     shr        al,cl
	     inc        al      
	     add        al,30h  
	     mov        ah,0eh 
	     int        10h
	Exit:
	    ret
@OMEM$qv ENDP
INCLUDE lib3.asm
END
