inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm

dseg segment 
    b1 dw ?
    b2 dw ?
    tb1 db         'So A 16 bit: $'
    tb2 db 10, 13, 'So B 16 bit: $'
    tb3 db 10, 13, 'A + B       : $'
    tb4 db 10, 13, 'A - B       : $'
    tb5 db 10, 13, 'A OR B      : $'
    tb6 db 10, 13, 'A AND B     : $'
dseg ends
cseg segment
    assume cs: cseg, ds: dseg
start:
    mov ax, dseg
    mov ds, ax
    
;nhap A
    inchuoi tb1
    call bin_in
    mov b1, bx
;nhap B    
    inchuoi tb2
    call bin_in
    mov b2, bx

;A + B
    inchuoi tb3
    mov bx, b2
    add bx, b1
    call bin_out
        
;A - B 
    inchuoi tb3
    mov bx, b1
    sub bx, b2
    call bin_out

;A or B
    inchuoi tb4
    mov bx, b1
    or bx, b2
    call bin_out

;A and B        
    inchuoi tb5
    mov bx, b1
    and bx, b2
    call bin_out        
    
;ket thuc    
    mov ah, 4Ch
    int 21h 

bin_in PROC
    mov bx, 0
    mov cx, 16
nhap:
    mov ah, 01h
    int 21h 
    cmp al, 0Dh
    je exit
    sub al, 30h
    shl bx, 1
    add bl, al
    loop nhap
exit:ret
bin_in endp

bin_out PROC
    mov cx, 16
xuat:
    mov dx, 0
    shl bx, 1
    rcl dl, 1
    add dl, 30h
    mov ah, 02h
    int 21h
    loop xuat
    ret 
bin_out endp    
    

                    
cseg ends
end start
