.model small 
.stack
.data

    msgNombre db 10,13, 'Ingresa un nombre', 10,13,'$'
    msgCadenaIngresada db 10,13, 'El nombre que ingreso es: $' 
    cad3 db 10,13, 'Las cadenas no son iguales. $' 
    cad4 db 10,13, 'Las cadenas SON iguales. $' 
    cadenaIngresada db 100 dup('$')
    cadenaIngresada2 db 100 dup('$')
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

    
    ;Ingreso del segundo nombre 

    lea dx, msgNombre 
    mov ah,09
    int 21h 

    leer2: 
    mov ax, 0000 
    mov ah,01h 
    int 21h 
    mov cadenaIngresada2[si], al 
    inc si
    cmp al,0dh 
    ja leer2 
    
    ver2: 
        mov dx, offset msgCadenaIngresada
        mov ah,09 
        int 21h 
        mov dx, offset cadenaIngresada2
        mov ah,09
        int 21h 



    ;Comparacion
    comparacion: 
    lodsb cadenaIngresada 
    movsw comparar,al 
    lodsb cadenaIngresada2    
    cmpsb comparar, al 
    ; Instruccion no esta en este procesador jecxz iguales   
    ;if not 
    lea dx,cad3
    mov ah, 09 
    int 21h 

    iguales:
    lea dx, cad4 
    mov ah, 09 
    int 21h 

    salir:
    mov ah, 4ch
    int 21h 

end 