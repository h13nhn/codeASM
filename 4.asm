inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm

DSEG SEGMENT
    tb1 db 'Hay nhap ten: $'
    tb2 db 10,13, 'Xin chao $'  
    str db 50, 0, 50 dup('$')
DSEG ENDS
CSEG SEGMENT
    ASSUME CS: CSEG, DS: DSEG
start:
    mov ax, DSEG
    mov ds, ax 
    
    inchuoi tb1
    
    mov ah, 0Ah
    lea dx, str
    int 21h
    
    inchuoi tb2
    
    lea dx, str + 2
    int 21h
   
    mov ah, 4Ch
    int 21h
CSEG ENDS
END start
