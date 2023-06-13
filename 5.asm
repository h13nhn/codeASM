dseg segment
    tbao0 db 'Nhap ky tu: $'
    tbao1 db 10,13,'Good morning!$'
    tbao2 db 10,13,'Good Afternoon!$'
    tbao3 db 10,13,'Good everning!$' 
    tbao4 db 10,13,'Vui long nhap dung (S, C, T)!$'
dseg ends
cseg segment
    assume: cs: cseg, ds: dseg
    start:                       
    mov ax, dseg 
    mov ds, ax
    
    mov ah, 09h
    lea dx, tbao0
    int 21h
    
    mov ah, 01h
    int 21h
    
    cmp al, 'S'
    jz sang
    
    cmp al, 's'
    jz sang
    
    cmp al, 'C'
    jz chieu 
    
    cmp al, 'c'
    jz chieu
    
    cmp al, 'T'
    jz toi
    
    cmp al, 't'
    jz toi 
    
    jnz exit
    
    sang:
    mov ah, 09h
    lea dx, tbao1
    int 21h
    mov ah, 4Ch
    int 21h  
    
    chieu:
    mov ah, 09h
    lea dx, tbao2
    int 21h
    mov ah, 4Ch
    int 21h 
    
    toi:
    mov ah, 09h
    lea dx, tbao3
    int 21h
    mov ah, 4Ch
    int 21h
            
    exit:
    mov ah, 09h
    lea dx, tbao4
    int 21h
    mov ah, 4Ch
    int 21h            
cseg ends
end start
