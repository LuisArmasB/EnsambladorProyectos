.model small 
.stack
.data
    msgNombre db 10,13, 'Ingresa un nombre', 10,13,'$'
    msgCadenaIngresada db 10,13, 'El nombre que ingreso es: $' 
    cadenaIngresada db 100 dup('$')
    comparar db ? 

.code

    mov ax, @data
    mov ds, ax 
    
    lea dx, msgNombre 
    mov ah,09
    int 21h 
    
    leer: 
    mov ax, 0000 
    mov ah,01h 
    int 21h 
    mov cadenaIngresada[si], al 
    inc si
    cmp al,0dh 
    ja leer 

    ver: 
        mov dx, offset msgCadenaIngresada
        mov ah,09 
        int 21h 
        mov dx, offset cadenaIngresada 
        mov ah,09
        int 21h 

    salir:
    mov ah, 4ch
    int 21h 

end 