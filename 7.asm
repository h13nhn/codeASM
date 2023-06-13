;khong su dung 0Ah/21h nhap vao chuoi ky tu va dem so ky tu
; hien thi lai chuoi ky tu do
dseg segment
    mang db 50 dup(?)
    soKyTu db ?
    tb1 db 'Nhap chuoi: $'
    tb2 db 10, 13, 'So ky tu: $'
    tb3 db 10, 13, 'Chuoi da nhap vao: $'
    chia db 10
dseg ends
cseg segment
    assume: cs: cseg, ds: dseg
start:
    mov ax, dseg
    mov ds, ax
    
    mov ah, 09
    lea dx, tb1
    int 21h; hien tb1
    
;nhap mang
    lea si, mang
    xor cx, cx
lanNhap:
    mov ah, 01h
    int 21h
    cmp al, 0Dh
    je xuong
    mov [si], al
    inc si
    inc cx
    jmp lanNhap
    
;hien thi so ky tu     
xuong:
    mov ah, 09h
    lea dx, tb2
    int 21h; hien tb2
   
    mov soKyTu, cl
    mov al, cl
    mov ah, 0h
    xor cx, cx
lap:
    xor dx, dx
    div chia
    
    add ah, 30h
    mov dl, ah
    push dx
    
    inc cx
    xor ah, ah
    cmp ax, 0
    jne lap
hienThiSoKyTu:
    pop dx
    mov ah, 02h
    int 21h
    loop hienThiSoKyTu
    
    mov ah, 09h
    lea dx, tb3
    int 21h; hien tb3
    
    
;hien thi ky tu da nhap vao
    mov cl, soKyTu
    lea si, mang
xuat:
    mov dl, [si]
    mov ah, 02h
    int 21h; hien thi ky tu
    
    inc si
    loop xuat
    
;ket thuc chuong trinh
    mov ah, 4Ch
    int 21h        
                        
cseg ends
end start
