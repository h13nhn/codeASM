inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm    
dseg segment
    max db 100
    len db ?
    tenfile db 100 dup(?)
    xuong db 10,13, '$'
    buff db 250 dup('$')
    thefile dw ?
dseg ends
cseg segment
    assume cs:cseg, ds:dseg
begin: 
    mov ax, dseg
    mov ds, ax
    
    call nhaptenfile
    
    mov ah, 3Dh ; mo file da co
    lea dx, tenfile
    mov al, 2
    int 21h
    
    mov thefile, ax
    
    mov ah, 3Fh
    mov bx, thefile
    lea dx, buff
    mov cx, 250
    int 21h
    
    mov ah, 3Eh
    mov bx, thefile
    int 21h
    
    inchuoi xuong
    
    inchuoi buff 

    
    mov ah, 4ch ; thoat ve Dos
    int 21h 
nhaptenfile proc
    mov ah, 0Ah
    lea dx, max
    int 21h
    
    xor cx, cx
    mov cl, len
    lea si, tenfile
    add si, cx
    mov [si], ch
    
    ret 
   
nhaptenfile endp    
cseg ends
 end begin
