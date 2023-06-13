inchuoi MACRO chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm
dseg segment
    b1 dw ?
    b2 dw ?
    tb1 db         'So A he 10: $'
    tb2 db 10, 13, 'So B he 10: $'
    tb3 db 10, 13, 'A + B       : $'
    tb4 db 10, 13, 'A - B       : $'
    kytu db ?
    muoi db 10
dseg ends
cseg segment
    assume cs: cseg, ds: cseg
start:
    mov ax, dseg
    mov ds, ax 
    
;nhap A
    inchuoi tb1
    call dec_in
    mov b1, ax
;nhap B    
    inchuoi tb2
    call dec_in
    mov b2, ax

;A + B
    inchuoi tb3
    mov ax, b2
    add ax, b1
    call dec_out
        
;A - B 
    inchuoi tb4
    mov ax, b1
    sub ax, b2
    call dec_out

    mov ah, 4Ch
    int 21h
    
dec_in proc
    mov bx, 0
    mov dx, 0 
nhap:
    mov ah, 01h 
    int 21h
    cmp al, 0Dh
    jz exit
    
    sub al, 30h
    xor ah, ah
    mov dx, ax
    mov ax, bx
    mul muoi
    add ax, dx
    mov bx, ax
    jmp nhap    
exit:
    mov ah, 0 
    mov al, bl
    ret    
      
dec_in endp                                           
dec_out proc    
    xor cx, cx
    mov bx, 10
    chia10:
        xor dx, dx
        div bx
        push dx
        inc cx
        cmp ax, 0
        jnz chia10
    inra:
        mov ah, 02h
        pop dx
        add dl, 30h
        int 21h
        loop inra
    ret
dec_out endp
cseg ends
end start
