;nhap hai chuoi so
;doi hai chuoi thanh so va tinh tong
;hien thi chuoi tong vua tinh
dseg segment
    so db 10, 0, 10 dup($)
    muoi dw  10
    xuong db 10, 13, 'Ket qua: $'
    b1 dw 0
    b2 dw 0
    tb1 db 'Nhap vao so dau: $'
    tb2 db 10, 13, 'Nhap vao so thu hai: $'
dseg ends
cseg segment
    assume: cs: cseg, ds: dseg
start:                                  
    mov ax, dseg
    mov ds, ax      
    
;nhap chuoi thu nhat    
    lea dx, tb1
    mov ah, 09h
    int 21h
    
    xor cx, cx
    lea dx, so
    mov ah, 0Ah
    int 21h 
    
    call xuLyChuoi   
    mov b1, dx   
    
;nhap chuoi thu 2    
    mov ah, 09h
    lea dx, tb2
    int 21h
    
    mov ah, 0Ah
    lea dx, so
    int 21h
    
    mov ah, 09h
    lea dx, xuong
    int 21h
    
    call xuLyChuoi
    mov b2, dx
    
; b1 + b2
    mov dx, b2
    add dx, b1
    
    mov ax, dx
    xor cx, cx
    
    lapChia:
    xor dx, dx
    div muoi
    add dx, 30h
    push dx
    inc cx
    cmp ax, 0
    jne lapchia
    
    hienThi:
    pop dx
    mov ah, 02h
    int 21h
    loop hienThi
    
    mov ah, 4Ch
    int 21h    

xuLyChuoi proc
    xor dx, dx
    xor cx, cx
    lea si, so + 2
    mov cl, [so + 1]
    lap:
        mov ax, dx
        xor bx, bx
        mov bl, [si]
        sub bl, 30h
        mul muoi
        add ax, bx
        mov dx, ax
        inc si
        loop lap
        ret
xuLyChuoi endp  

cseg ends
end start

