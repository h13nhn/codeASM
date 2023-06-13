inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm

dseg segment
    kyTu DB ? 
    tb1 DB 'Nhap 1 ky tu: $'
    tb2 DB 10,13,'Ky tu nhan duoc la: $'    
dseg ends

cseg segment
    assume cs: cseg, ds: dseg
start:    
    mov ax, dseg
    mov ds,ax
       
;hien thi thong bao             
    inchuoi tb1
    
;nhap ky tu vao
    mov ah, 07h
    int 21h
;gan ky tu cho bien tam
    mov kyTu, al

;thong bao ky tu nhan duoc
    inchuoi tb2
    
;hien thi ky tu duoc nhap vao
    mov dl, kyTu
    mov ah, 02h
    int 21h

;ket thuc        
    mov ah, 4Ch
    int 21h    
cseg ends
end start
