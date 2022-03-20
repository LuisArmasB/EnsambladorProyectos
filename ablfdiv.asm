;Division en ensamblador 
.model small 
.stack 
.data
;Tres variables para la multi 2 de los numeros y 1 para el resultado
 num1 DB ? 
 num2 DB ?
 res DB ? 
;Textos 
 cad1 DB 10, "Ingresa el primer numero: $"
 cad2 DB 10,13,"Lo vas a dividir entre: $"
 cad3 DB 10, "Resultado: $"
.code
    ;Movemos las variables para trabajarlas a la memoria 
    mov ax,@data
    mov ds,ax

    ;Imprimos el mensaje 1 
    mov ah, 09
    lea dx, cad1
    int 21h 
    
    ;Leemos el primer numero
    mov ah, 01 
    int 21h 
    ;Le restamos 30h y lo mandamos a num1 
    sub al, 30h
    mov num1, al
    

   ;Imprimos el mensaje 2 
    mov ah, 09
    lea dx, cad2
    int 21h 

    ;Leemos el segundo numero
    mov ah, 01 
    int 21h 
    ;Le restamos 30h y lo mandamos a num1 
    sub al, 30h
    mov num2, al


   ;Imprimos el mensaje 3 
    mov ah, 09
    lea dx, cad3
    int 21h 


    ;division
    AAD 
    mov al, num1 
    div num2 
    mov res, al 

    ;El resultado de la div lo pasamos al acumulador
    mov al, res 
    mov bx, ax   ;mandamos el resultado del acarreo a bx
    mov ah,02h          ;Servicio de impresion
    mov dl,bh           ;Desplazamos bh donde estaba el resultado a dl
    add dl, 30h         ;Le agregamos a dl 30h por lo de hexadecimal
    int 21h 

                        ;Servicio de impresionx2
    mov ah,02h      
    mov dl, bl           ;movemos lo que teniamos en bl a dl 
    add dl, 30h             ;Le agregamos los 30h del hexadecimal 
    int 21h                 ;Inicio servicio 


    int 27h 
end 