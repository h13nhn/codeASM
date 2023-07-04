;doi tat ca cac ky tu thuong thanh ky tu hoa
; doi tat ca cac ky tu hoa thanh ky tu thuong
inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm    
dseg segment 
    max db 50
    len db ?
    mang db 50 dup(?)
    xuong db 10, 13, '$'
    gach db ' - $'
    kyTu db ?    
dseg ends
cseg segment
    assume: cs: cseg, ds: dseg
start:
    mov ax, dseg
    mov ds, ax
   
    xor cx, cx
    mov ah, 0Ah
    lea dx, max
    int 21h 
    
    inchuoi xuong  
    
    
;chuyen ky tu HOA thanh thuong    
    lea si, mang
    mov cl, len
    
lap1:
    cmp [si], 'A'
    jl boqua
    cmp [si], 'Z'
    ja boqua
    add [si], 32
boqua:
    inc si
    loop lap1
    
    call xuat ; in ky tu in thuong ra man hinh
    
    mov ah, 09h
    lea dx, gach
    int 21h
 
 
;chuyen ky tu thuong thanh HOA    
    lea si, mang
    mov cl, len
lap2:
    sub [si], 32
    inc si
    loop lap2
             
    call xuat ; in ky tu in hoa ra man hinh                
    
    mov ah, 4Ch
    int 21h        


xuat PROC
    mov cl, len
    lea si, mang
lap:
    mov dl, [si]
    mov ah, 02h
    int 21h
    
    inc si
    loop lap
    ret
xuat endp

cseg ends
end start
    
