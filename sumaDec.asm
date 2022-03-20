.model small 
.stack 
.data 
    num1 DB ?
    num2 DB ? 
    dec1 DB ? 
    dec2 DB ? 

    cad1 DB 10,13, "Ingresa el primer numero: $"
        cad2 DB 10,13, "Ingresa el segundo numero: $"
            cad3 DB 10,13, "Resultado: $"

.code 
    mov ax, @data 
    mov ds, ax 

    numero1:
    ;Num1  
    mov ah,09h 
    lea dx, cad1 
    int 21h 

    mov ah,01 
    int 21h 
    sub al, 30h 
    mov num1, al 
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
    mov ah,09h 
    lea dx, cad2 
    int 21h 

    mov ah,01 
    int 21h 
    sub al, 30h 
    mov num2, al 
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
    mov dec1, ah 
    mov dec2, al   ;Guardamos en dec 2 el residuo 
 
    mov al, num1 
    add al, dec1 
    mov num1, al 

    ;Termina suma de decimales 

    ;Suma de numeros 

    mov al, num1 
    add al, num2 
    aam 
    add al, 30h 
    add ah, 30h 

    mov num1,ah 
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


    ;Punto 
    mov ah,02h 
    mov dl, 46
    int 21h 

    ;Decimal 
    mov ah,02h 
    mov dl, dec2 
    int 21h  






end 