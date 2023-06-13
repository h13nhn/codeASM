DSEG SEGMENT
    tbao1 db 'Hay nhap ky tu: $'
    tbao2 db 10,13, 'Ky tu ke truoc la: $'  
    tbao3 db 10,13, 'Ky tu ke sau la: $'
DSEG ENDS
CSEG SEGMENT
    ASSUME CS: CSEG, DS: DSEG
start:
    mov ax, DSEG
    mov ds, ax 
    
    mov ah, 09h
    lea dx, tbao1
    int 21h ; hien tbao1
    
    mov ah, 01h 
    int 21h; nhap ky tu
    
    add al, 01h
    mov dl, al
    push dx; day ky tu ke sau vao ngan xep 
    
    sub al, 02h
    mov dl, al
    push dx ; day ky tu ke truoc vao ngan xep
    
    mov ah, 09h
    lea dx, tbao2
    int 21h ; hien thi thong bao ky tu ke truoc la:
    
    pop dx ; lay ky tu ke truoc
    mov ah, 02h 
    int 21h ; hien thi ky tu ke truoc
    
    mov ah, 09h
    lea dx, tbao3
    int 21h; hien thi thong bao ky tu ke sau
    
    pop dx ; day ky tu ke sau tu ngan xep ra
    mov ah, 02h 
    int 21h ; hien thi ky tu ke sau
    
    mov ah, 4Ch
    int 21h
CSEG ENDS
END start
