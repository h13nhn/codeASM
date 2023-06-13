inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm

dseg segment 
    tb1 DB 'Nhap 1 ky tu: $'
    tb2 DB 10,13,'Ky tu nhan duoc la: $'    
dseg ends

cseg segment
    assume cs: cseg, ds: dseg
start:    
    mov ax, dseg
    mov ds,ax
                  
    inchuoi tb1
    
    mov ah, 07h
    int 21h

    push ax
    inchuoi tb2
    
    pop ax
    mov dl, al
    mov ah, 02h
    int 21h

;ket thuc        
    mov ah, 4Ch
    int 21h    
cseg ends
end start
