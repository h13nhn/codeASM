dseg segment
    tbao0 db 'Nhap ky tu: $'
    tbao1 db 10,13,'Ky tu HOA!$'
    tbao2 db 10,13,'Ky tu thuong!$'
    tbao3 db 10,13,'Ky tu khac!$'
dseg ends

cseg segment
    assume cs: cseg, ds: dseg
    start:                       
    mov ax, dseg 
    mov ds, ax
    
    mov ah, 09h
    lea dx, tbao0
    int 21h
    
    mov ah, 01h
    int 21h
    
    cmp al, 'A' 
    jb khac 
    cmp al, 'z' 
    ja khac  
    
    cmp al, 'Z'
    jbe hoa
    cmp al, 'a'
    jae thuong
    
    jmp khac
    
    hoa:
    mov ah, 09h
    lea dx, tbao1
    int 21h
    jmp exit
    
    thuong:
    mov ah, 09h
    lea dx, tbao2
    int 21h
    jmp exit
    
    khac:
    mov ah, 09h
    lea dx, tbao3
    int 21h
            
    exit:
    mov ah, 4Ch
    int 21h            
cseg ends
end start
