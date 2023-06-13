;nhap hai chuoi so
;doi hai chuoi thanh so va tinh tong
;hien thi chuoi tong vua tinh
dseg segment
    mang db 10, 0, 10 dup('$')
     muoi db 10
     tb1 db 'Nhap A: $' 
     tb2 db 10, 13, 'Nhap B: $'
     tb3 db 10, 13, 'A/B: $'
     tb4 db 10, 13, 'A*B: $'
     b1 dw 0
     b2 dw 0
dseg ends
cseg segment
    assume: cs: cseg, ds: dseg
start:                                  
    mov ax, dseg
    mov ds, ax      
    
;Nhap A    
    mov ah, 09h
    lea dx, tb1
    int 21h
    
    mov ah, 0Ah
    lea dx, mang
    int 21h
    
    call xulychuoi
    mov b1, dx
    
;Nhap B
    mov ah, 09h
    lea dx, tb2
    int 21h
    
    mov ah, 0Ah
    lea dx, mang
    int 21h
    
    call xulychuoi
    mov b2, dx     

;thuc hien chia    
    mov ah, 09h
    lea dx, tb3
    int 21h 
    
    mov dx, b1
    mov ax, b2
    
    xor cx, cx
    
    chia:
        sub dx,ax
        inc cx
        cmp dx, ax
        jae chia    
    mov ax, cx
    call inchuoi

;thuc hien nhan    
    mov ah, 09h    
    lea dx, tb4
    int 21h
    
    xor cx, cx
    xor dx, dx
    mov cx, b2
    
    nhan:
        add dx, b1
        loop nhan
    mov ax, dx
    call inchuoi

;Ket thuc chuong trinh    
    mov ah, 4Ch
    int 21h        

xulychuoi proc 
    xor dx, dx
    xor cx, cx
    lea si, mang + 2
    mov cl, [mang + 1]
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
xulychuoi endp


inchuoi proc
    xor cx, cx
    lapchia:
    xor dx, dx
    div muoi
    
    add ah, 30h
    mov dl, ah
    push dx
    inc cx
    xor ah, ah
    cmp ax, 0
    jne lapchia
    
    hienthi:
    pop dx
    mov ah, 02h
    int 21h
    loop hienthi
    
    ret
    
inchuoi endp   

cseg ends
end start

