.model small
.data
    sign_flag db 0     ; Biến cờ dấu, ban đầu được đặt là 0 (dương)
    input_buffer db 6, ? ; Bộ đệm để lưu trữ ký tự đầu vào, tối đa 5 ký tự + Enter
.code
    main:
        mov ax, @data
        mov ds, ax

        ; Nhận và xử lý ký tự đầu vào
        call receive_input

        ; Kiểm tra cờ dấu và đổi dấu nếu cần
        cmp sign_flag, 1
        jnz done
        neg ax  ; Nếu cờ dấu là 1 (âm), đảo dấu của AX

    done:
        ; Tại đây, giá trị đã được lưu trong thanh ghi AX và đã được đổi dấu nếu cần
        ; Bây giờ bạn có thể sử dụng giá trị này để thực hiện các tác vụ khác

        ; Đặt hàm kết thúc chương trình
        mov ah, 4Ch
        int 21h

    receive_input:
        mov cx, 0        ; Đếm số ký tự đã nhập
        mov si, offset input_buffer  ; SI trỏ đến bộ đệm đầu vào

    read_char:
        mov ah, 01h       ; Đọc một ký tự từ bàn phím
        int 21h

        ; Kiểm tra ký tự có phải Enter (kết thúc nhập) không
        cmp al, 0Dh  ; Kiểm tra Enter (ASCII 0Dh)
        je check_sign

        ; Kiểm tra ký tự có phải dấu trừ '-' không
        cmp al, '-'  ; Kiểm tra dấu trừ (ASCII 2Dh)
        je set_negative

        ; Kiểm tra ký tự có phải là số không
        cmp al, '0'  ; Kiểm tra '0' (ASCII 30h)
        jb read_char
        cmp al, '9'  ; Kiểm tra '9' (ASCII 39h)
        ja read_char

        ; Chuyển ký tự số từ ASCII sang số
        sub al, 30h   ; Chuyển từ ASCII sang số

        ; Cộng số vào giá trị hiện tại và nhân cho 10
        mov ah, 0
        mov bx, 10
        mul bx
        add ax, al

        ; Lưu ký tự vào bộ đệm và tăng đếm
        mov [si], al
        inc si
        inc cx

        jmp read_char

    check_sign:
        ; Kiểm tra cờ dấu và kết thúc hàm
        cmp byte ptr [si - 1], '-'  ; Kiểm tra ký tự cuối cùng có phải dấu trừ không
        je set_negative
        ret

    set_negative:
        ; Đặt cờ dấu và kết thúc hàm
        mov sign_flag, 1
        ret

    end main
