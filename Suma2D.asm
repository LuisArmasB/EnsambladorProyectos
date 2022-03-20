.MODEL SMALL
.STACK 
.DATA
    askN1 DB 13, 'Ingrese primer numero: $'
    askN2 DB 10,13, 'Ingrese segundo numero: $'   
    CADENA1 DB 10,13, 'La suma es: $'
    num1 DB ? 
    num2 DB ?
    cien DB 100

.CODE
    mov ax,@data ; Inicializa los datos
    mov ds,ax 
   
   ;mensaje
   mov ah,09h 
   lea dx,askN1 
   int 21h 
   ;Recibir 1er numero
   mov ah,01h 
   int 21h 
   sub al,30h 
   mov num1, al 
   
   int 21h ;llamamos la interrupcion 

    sub al,30h 
    mov ah,num1 
    aad 
    
    mov num1,al 
    ;termina leer numero de dos digitos

    mov ah,09h 
    lea dx,askN2
    int 21h
    ;Llamamos la interrupcion 

    mov ah, 01h 
    int 21h 
    sub al,30h
    
    mov num2,al 
    int 21h 
    sub al,30h 

    mov ah,num2 
    aad 
    mov num2,al 
    
    mov ah,09h 
    lea dx,CADENA1
    int 21h 
    mov al,num1 
    add al,num2 
    xor ah,ah
    div cien
    add al,30h
    mov dl,al 
    mov al,ah
    aam
    add ax,3030h 
    mov bx,ax
    mov ah,02h 
    int 21h
    mov dl,bh
    int 21h
    mov dl,bl 
    int 21h 
    int 27h 

end 