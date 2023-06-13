dseg segment
    tbao0 db 'Nhap ky tu: $'
dseg ends
cseg segment
    assume cs: cseg, ds: dseg
start:   
    mov ax, dseg
    mov ds, ax
    
    mov ah, 09h
    lea dx, tbao0
    int 21h
    
    mov ah, 07h
    int 21h 

    
    nhan:
    mov dl, al   
    push dx
    
    mov dl, ' '
    mov ah, 02h
    int 21h
    
    pop dx
    mov ah, 02h
    int 21h
    
    inc al
    cmp al, 'z'
    jbe nhan
    
    mov ah, 4Ch
    int 21h
    
    

cseg ends
end start
