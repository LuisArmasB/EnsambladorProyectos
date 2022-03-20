.MODEL SMALL
.STACK
.DATA
    CADENA1 DB 'Armas Barragan Luis Fernando $'
    CADENA2 DB 10,13, 'Jonathan Zacek Alcanzar Jurado $'
.CODE
    mov ax,@data ; Inicializa los datos
    mov ds,ax 
    lea dx, CADENA1
    mov AH, 09h
    int 21h 
    mov ax,@data ; Inicializa los datos
    mov ds,ax 

    lea dx, CADENA2
    mov AH, 09h
    int 21h 
    
    int 27h 
end 