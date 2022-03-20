.model small 
.stack
.data
    opc1 db 10,13, "1. Compara 2 numeros y diga si el primero es mayor, menor o igual al segundo. $"
    opc2 db 10,13, "2. Calcular el promedio de 4 numeros ingresados. $"
    opc3 db 10,13, "3. Salir $"
    opc4 db 10,13, "Elige una opcion: $"
    opc5 db 10,13, "Opcion no valida $"
    opc6 db 10,13, "Ingresa un numero: $"
    opc7 db 10,13, "Ingresa otro numero: $"
    opc8 db 10,13, "Saliendo.... $"
    opc9 db 10,13, "Son iguales $",10,13
    opc10 db 10,13, "El primero es mayor que el segundo $",10,13 
    opc11 db 10,13, "El segundo es mayor que el primero $",10,13 
    opc12 db 10,13, "El resultado del promedio es: $",10,13 
    arr db 4 dup(" "), "$"
    num db 0 
.code 
    mov ax, @data
    mov ds, ax 

    Menu: 
        mov ah, 09h 
        lea dx, opc1 
        int 21h 

        mov ah,09h 
        lea dx, opc2
        int 21h 

        mov ah,09h 
        lea dx, opc3 
        int 21h 

        mov ah,09h 
        lea dx, opc4 
        int 21h 

        mov ah,01h 
        int 21h 

        cmp al, 31h 
        jz Comparar 
        cmp al,32h 
        jz Promedio
        jnz aux 


        Comparar: 
            mov ah,09h 
            lea dx, opc6
            int 21h 

            mov ah, 01h 
            int 21h 
            mov bl,al 

            mov ah,09h 
            lea dx, opc7
            int 21h 

            mov ah,01h 
            int 21h 

            cmp al,bl 
            jc mayor2 
            jz iguales
            jnz mayor1 

            iguales: 
                mov ah,09h 
                lea dx, opc9
                int 21h 
                call Menu 
            mayor1: 
                mov ah,09h 
                lea dx, opc11
                int 21h 
                call Menu 

            mayor2: 
                mov ah,09h 
                lea dx, opc10
                int 21h 
                call Menu
        
        aux: 
            cmp al,33h 
            jz Salir 
            jnz Error 
        
        Promedio: 
            mov cx, 04
            califs: 
            mov ah,09h 
            lea dx, opc6
            int 21h 

            mov ah,01h 
            int 21h 

            push ax 
            loop califs 
            mov cx, 04 

            sumar: 
                pop ax
                sub al,30h 
                add bl, al 
            loop sumar 
            mov num,bl 

            mov ah,09h 
            lea dx,opc12
            int 21h 
            xor ax,ax 
            mov al, num 
            mov bl, 04
            div bl 

            aam 
            mov bx, ax 
            mov ah, 02h 
            add bh, 30h 
            mov dl, bh 
            int 21h 
            mov ah, 02h 
            add bl, 30h 
            mov dl, bl 
            int 21h 
            call Menu 
        
        Salir: 
        mov ah,09h 
        lea dx, opc8
        int 21h 
        int 27h 

        Error: 
        mov ah, 09h 
        lea dx, opc5
        int 21h 
        call Menu



end 