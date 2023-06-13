;doi tat ca cac ky tu thuong thanh ky tu hoa
; doi tat ca cac ky tu hoa thanh ky tu thuong
dseg segment
    mang db 50, 0, 50 dup('$')
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
    lea dx, mang
    int 21h 
    
    mov ah, 09h
    lea dx, xuong
    int 21h
;chuyen ky tu HOA thanh thuong    
    lea si, mang + 2
    mov cl, [mang + 1]
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
    lea si, mang + 2
    mov cl, [mang + 1]
lap2:
    sub [si], 32
    inc si
    loop lap2
             
    call xuat ; in ky tu in hoa ra man hinh                
    
    mov ah, 4Ch
    int 21h        


xuat PROC
    mov cl, [mang + 1]
    lea si, mang + 2
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
    

