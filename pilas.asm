.model small 
.stack 
.data
    arr db 100 dup('$') ;
    msg1 db "Ingresa los caracteres que se almacenan en la pila: $"
    msg2 db 10, "Los elementos de la pila al reves son: $"
    msg3 db 10, "Los elementos de la pila en orden son: $"

.code 
    mov ax, @data
    mov ds, ax 
    mov cl, 8 

    mov ah, 09h 
    lea dx, msg1
    int 21h 

    ingresar: 
        mov ah,01h
        int 21h
        push ax ;;Meter a la pila de ax la tecla pulsada
    loop ingresar 

    mov ah, 09h 
    mov dx, offset msg2 
    int 21h 

    mov cl, 08 
    mov si, 04h ;Inicializar el si para tomar la posicion del arreglo    

    sacar: 
    pop ax ; El ultimo dato de la pila lo almacena en ax

    mov ah, 02h 
    mov dl, al 
    int 21h 

    mov arr[si], al  ;Tomar la posicion del arreglo con si para moverlo al al
    dec si ;Decrementamos para obtener la posicion anterior

    loop sacar 

    mov ah, 09h 
    mov dx, offset msg3 
    int 21h 

    mostrar: 
   mov ah, 09h
    mov dx, offset arr ; Imprime toda la cadena
    int 21h 

    salir: 
    int 27h 

end 