.model SMALL 
.stack
.data
variable1 db ? 
variable2 db ? 
variable3 db ? 
mensaje1 db 'Ingresa el primer numero:$'
mensaje2 db 10,13, 'Ingresa el segundo numero:$'
mensaje3 db 10,13, 'Resultado:$'

.code
 ;Metodo inicio
    inicio: 
    ;Mandamos a los registros todas las variables
    mov ax,@data 
    ;Mandamos las var a las direcciones
    mov ds, ax 
    
    ;Imprime el primer mensaje que pide el numero1  
    mov ah, 09h
    ;Se mandan a dx en lugar de a ax 
    lea dx, mensaje1
    int 21h 
    ;Pedir un numero 
    ;(Llamamos al servicio) 
    mov ah,01h
    int 21h
     ;Le substraemos 30 al numero que pedimos y lo movemos su valor a la
     ;A la variable siguiente
    sub al,30h 
    mov variable1,al 
    
    ;Imprimimos la segunda cadena pero esta ves en lugar de lea 
    ;llamamos el offset que hace lo mismo y como tenemos 
    mov ah,09h
    mov dx, offset mensaje2 
    int 21h 
    
    ;Pedir segundo numero 
    ;(Llamamos al servicio) 
    mov ah,01h
    int 21h 
    
    sub al, 30h 
    mov variable2,al   
    add al, variable1 
    
    ;Movemos el resultado de la operacion a variable3 
    mov variable3, al 

    ;Se viene la vuelta de carro, el ajuste para poder imprimir mas de 1 digito
    ; es decir unidades y decenas 
    aaa
    or ax,3030h 
    mov bx, ax 
    sub bh,01h

    ;Imprimimos el mensaje del resultado 
    mov ah, 09h 
    lea dx, mensaje3 
    int 21h

    ;Imprimimos las decenas
    mov ah, 02
    mov variable3, bl 
    mov dl, variable3
    int 21h 

    ;Imprimimos las unidades (parte baja) 
    mov ah,02
    mov variable3,bl 
    mov dl,variable3 
    int 21h 

    salir: 
    mov ah, 04ch
    int 21h 
    int 27h 
end 