inchuoi MACRO chuoi 
   MOV AH, 9h 
   LEA DX, chuoi 
   INT 21h 
   ENDM
dseg segment
    tb1 DB 'Nhap vao 1 ki tu: $'
    tb2 DB 10,13,'Ma bin ASCII: $'
    tb3 DB 10, 13,"Ma ASCII o dang Hex: $"
    tb4 db 10, 13,'Ma ASCII o dang Dec: $'
    kytu db ?
    hai DB 2

dseg ends
cseg segment
    assume: cs: cseg, ds: dseg
start:
    mov ax, dseg
    mov ds, ax
    
    inchuoi tb1
    mov ah, 01h
    int 21h 
    mov kytu, al
    
    inchuoi tb3
    mov bh, kytu
    call hex_out
    mov ah, 02h
    mov dl, 'h'
    int 21h
    
    inchuoi tb4
    xor ax, ax
    mov al, kytu
    call dec_out
    
    mov al, kytu
    call bin_out
    mov ah, 02h
    mov dl, 'b'
    int 21h
    

;Ket thuc
    mov AH, 4Ch
    int 21h
    
bin_out PROC
    xor cx, cx
    xor ah, ah
chuyen:
    xor dx, dx          
    div hai            
    add ah, 30h         
    mov dl, ah
    push dx           
    inc cx             
    xor ah, ah          
    cmp ax, 0h
    jne chuyen         
    inchuoi tb2
inra1:
    pop dx
    mov ah, 02h
    int 21h            
    loop inra1
ret
bin_out endp

hex_out PROC
    MOV CX, 2
xuat:
    PUSH CX
    MOV CL, 4
    MOV DL, BH
    SHR DL, CL
    CMP DL, 09h
    JA nhan
    ADD DL, 30h 
    JMP inra2
    
nhan:ADD DL, 37h
inra2:
    MOV AH, 02h
    INT 21h
    SHL BX, CL 
    POP CX
    LOOP xuat
    RET
hex_out ENDP 

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
END start
          
