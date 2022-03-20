;Programa de comparar dos cadenas
nombre macro param 
    mov ah,09h 
    mov dx, offset param 
    int 21h 
    mov ah,3fh 
    mov bx, 00 
    mov cx, 10 
    mov dx, offset param 
    int 21h 
endm 

escribir macro param 
    mov ah,09h 
    mov dx, offset param 
    int 21h 
endm 

macronSinp macro 
    mov ah,02h 
    mov dx,'a'
    int 21h 
endm 



.model small 
.stack 
.data
    cad1 db 50 dup('$'),'$'
    cad2 db 50 dup('$'),'$' 
    msj db 10,13,"..:::::::Compara cadenas:::::::..$"
    msj2 db 10,13, "Introduce cadena 1: $" 
    msj3 db 10,13, "Introduce cadena 2: $"
    msj4 db 10,13, "No son iguales $"
    msj5 db 10,13, "Son iguales $"
.code 
    mov ax,@data 
    mov dx, ax 
    
    inicio: 
        macronSinp
        escribir msj
        escribir msj2 
        nombre cad1 
        escribir msj3 
        nombre cad2
    
    ciclo: 
        mov al,cad1
        cmp al,cad2[si] 
        ja noSon
        jb noSon
        inc si 
        loop ciclo 
    son: 
        escribir msj5
        int 27h 
    noSon: 
        escribir msj4
        int 27h 
end 