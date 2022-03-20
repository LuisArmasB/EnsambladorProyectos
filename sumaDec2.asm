.model small 
.stack 
.data 
    num1 DB ?
    num2 DB ? 
    num1Un DB ?
    num2Un DB ? 
    dec1 DB ? 
    dec2 DB ? 

    cad1 DB 10,13, 'Ingresa el primer numero: $'
        cad2 DB 10,13, 'Ingresa el segundo numero: $'
            cad3 DB 10,13, 'Resultado: $'

.code 
    mov ax, @data 
    mov ds, ax 

    numero1:
    ;Num1   
        ;Decenas
    mov ah,09h 
    lea dx, cad1 
    int 21h 

    mov ah,01 
    int 21h 
    sub al, 30h 
    mov num1, al 

         ;Unidades
    mov ah,01 
    int 21h 
    sub al, 30h 
    mov num1Un, al 

    ;Punto decimal 
    mov ah,02h 
    mov dl, 46
    int 21h 

    mov ah,01 
    int 21h 
    sub al, 30h 
    mov dec1, al 

    numero2:
    ;Num2
        ;Unidades 
    mov ah,09h 
    lea dx, cad2 
    int 21h 

    mov ah,01 
    int 21h 
    sub al, 30h 
    mov num2, al 

        ;Decenas
    mov ah,01 
    int 21h 
    sub al, 30h 
    mov num2Un, al 

    ;Punto decimal 
    mov ah,02h 
    mov dl, 46
    int 21h 

    mov ah,01 
    int 21h 
    sub al, 30h 
    mov dec2, al


    suma: 
    ;Sumamos decimales

    mov al, dec1 
    add al, dec2 
    aam 
    add al, 30h 
    mov dec1, ah    ;El cociente lo vamos a sumar a un numero  dec1 contiene cociente
    mov dec2, al   ;Residuo a imprimir 
 
    
    mov al, num1Un 
    add al, dec1 ;;unidades se las sumamos a un numero    
    mov num1Un, al  
    ;Termina suma de decimales 

                         ;Aqui puede que requiera limpiar ax  x2 

    ;Inicia Suma de numeros unidades

     mov al, num1Un
     add al, num2Un
     aam 
     add al, 30h        ;;residuo 
     mov num1Un, ah      ;cociente se va a sumar a num1 
     mov num2Un, al      ;Residuo a imprimir
     
                        ;Aqui puede que requiera limpiar ax 
     mov al, num1
     add al, num1Un     
     mov num1, al 




    ;Suma de numeros decenas 
    mov al, num1 
    add al, num2 
    aam 

    mov num1,ah ;;Decenas
    mov num2, al  ;Resto 

    mov al, num1 
    add al, 30h 
    mov num1, al 

    mov al, num2 
    add al, 30h 
    mov num2, al 


    ;Imprimimos
    mov ah, 09h 
    lea dx, cad3 
    int 21h 


    mov ah,02h 
    mov dl, num1 
    int 21h 

    mov ah,02h 
    mov dl, num2
    int 21h 

    mov ah, 02h 
    mov dl, num2Un 
    int 21h 

    ;Punto 
    mov ah,02h 
    mov dl, 46
    int 21h 

    ;Decimal 
    mov ah,02h 
    mov dl, dec2 
    int 21h  


    int 27h 
end 