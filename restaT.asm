.model SMALL
.stack 
.data
    N1 DB ? 
    N2 DB ? 
    N3 DB ? 
    M1 DB 10,13, 'Ingrese primer numero: $' 
    M2 DB 10,13, 'Ingrese segundo numero: $'   
    M3 DB 10,13, 'Resultado: $'  
.CODE




MAIN: 
    ;NO ADMITE RESTAS QUE DEN COMO RESULTADO DECENAS 

    ;Movemos todas las variables para poder trabajar con ellas
    mov ax,@data
    mov ds,ax

    ;Imprimir y recibir num 1 
    mov ah, 09 
    lea dx, m1 
    int 21h 
    ;Servicio entrada num1  para detectar tecla pulsada
    mov ah,01 
    int 21h   ;Interrupcion 21h 

    ;Restar 30h para que si nos de el valor bien pq todo esta en hexadecimal
    sub al,30h 
    ;mover lo guardado en al a n1 
    mov N1, al 

    ;Imprimir y recibir num 2
    mov ah,09 
    lea dx, m2 
    int 21h 
    ;detectar tecla 
    mov ah,01 
    int 21h
    sub al, 30h 
    ;La variable n2 toma el valor del segundo numero guardado en el al 
    mov N2, al 

    ;Parte de la resta 
    mov al, n1 
    sub al, n2 
    add al, 30h 
    mov n3, al 

    ;Imprimimos el resultado 
    mov, ah 09
    lea dx, m3 
    int 21h
    
    mov ah,02 
    mov dl, n3 
    int 21h
    ;Otro servicio de finalizacion
    mov ah, 4cH
    int 21h 

END MAIN 



