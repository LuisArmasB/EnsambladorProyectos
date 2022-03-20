.MODEL SMALL
.STACK 
.DATA
    askN1 DB 13, 'Ingrese primer numero: $'
    cdecim1  DB 10,13, 'Ingrese el primer decimal: $'
    askN2 DB 10,13, 'Ingrese segundo numero: $'   
    cdecim2  DB 10,13, 'Ingrese el segundo decimal: $'    
    CADENA1 DB 10,13, 'La resta es: $'
    num1 DB ? 
    num2 DB ?
    decim1 DB ?
    decim2 DB ?
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
    
    ;Empezamos con los decimales
    mov ah, 09h
    lea dx, cdecim1
    int 21h 
    ;Ahora pedimos el numero 
     mov ah, 01h 
     int 21h 
     ;Le restamos los 30h al numero para que se guarde ya restao
     sub al, 30h 
    mov decim1,al 
    int 21h 
    sub al, 30h 
    mov ah, decim1
    aad
    mov decim1, al 
    ; ahora con el segundo decimal 
            ;Empezamos con los decimales
    mov ah, 09h
    lea dx, cdecim2
    int 21h 
    ;Ahora pedimos el numero 
     mov ah, 01h 
     int 21h 
     ;Le restamos los 30h al numero para que se guarde ya restao
     sub al, 30h 
    mov decim2,al 
    int 21h 
    sub al, 30h 
    mov ah, decim2
    aad
    mov decim2, al 
    ;parte de impresion  y calculos

    ; Imprimimos el string reusltado es: 
    mov ah,09h 
    lea dx,CADENA1
    int 21h
    ;Acarreo y calculo de la resta
    mov al,num1 
    sub al,num2 
    xor ah,ah
    div cien
    add al,30h
    mov dl,al 
    mov al,ah
    aam
    add ax,3030h 
    mov bx,ax
    mov ah,02h 
    ;int 21h
    mov dl,bh
    int 21h
    mov dl,bl 
    int 21h 

    ;Llamamos al servicio de impresion de caracter
    mov ah, 02h 
    mov dx, 46
    int 21h
    
    ;Hacemmos lo de arriba pero con los decimales. 
    mov al,decim1
    sub al,decim2
    xor ah,ah
    div cien
    add al,30h
    mov dl,al 
    mov al,ah
    aam
    add ax,3030h 
    mov bx,ax
    mov ah,02h 
   ; int 21h
    mov dl,bh
    int 21h
    mov dl,bl 
    int 21h
    ;Terminamos 
    int 27h 

end 