.model 
.stack
.data
 cadena db 100 dup(" "), '$';Solo tiene 99 espacios libres la pila 
 msg1 db "Cuantos datos quiere ingresar?: $"
 numDatos db ? 
 pos db ? 
 msg2 db 10,13, "Ingrese los datos: $"
 msg3 db 10,13, "El arreglo normal es igual a: $"
 msg4 db 10,13, "El arreglo invertido es igual a: $"
 msg5 db 10,13, "Cual posicion quiere buscar?: $"
 msg6 db 10,13, "El caracter en la posicion: $"
 msg7 db 10,13, "es: $"
 msg8 db 10,13, "Volver a intentarlo? Si=1, y No=0: $"
.code

mov ax, seg @data 
mov ds, ax 
inicio:
;msg1: Cuantos datos quiere ingresar:.....  .. . .  .
mov ah, 09h
lea dx, msg1 
int 21h 

;NumDatos
mov ah, 01h
int 21h 
sub al, 30h 
mov numDatos, al
mov cl, numDatos
mov al, numDatos



;msg2:Ingrese los datos:.. . . . . . .  . 
mov ah, 09h 
lea dx, msg2
int 21h 

    ;Este loop realizara la instruccion numDatos veces
    ingresar: 
        mov ah, 01h 
        int 21h 
        push ax 
    loop ingresar 

    ;msg4: El arreglo invertido es:.. . .  . . 
    mov ah, 09h 
    lea dx, msg4 
    int 21h  

 
    mov cl, numDatos
    mov si, cx ;Inicializar el si para tomar la posicion del arreglo    


    ;Imprimne el arreglo invertido y lo guarda en el arr
    sacar: 
    pop ax ; El ultimo dato de la pila lo almacena en ax
    mov ah, 02h 
    mov dl, al 
    int 21h 

    mov cadena[si], al  ;Tomar la posicion del arreglo con si para moverlo al al
    dec si ;Decrementamos para obtener la posicion anterior
    loop sacar 


        


        ;msg3 : El arreglo normal es:... .. . .  
        mov ah, 09h 
        lea dx, msg3
        int 21h 
    
   
    mov ah, 09h
    mov dx, offset cadena ; Imprime toda la cadena
    int 21h 
        

        ;msg5: Cual posicion quiere buscar?? 
        mov ah, 09h 
        lea dx, msg5 
        int 21h 

        ; Guardar valor en pos
        mov ah, 01h 
        int 21h
        sub al, 30h 
        mov pos, al


          ;Ajustes para pooder usar repe.
            mov cl, pos
            mov si, cx  

           
           ;ME FALTO HACER LA COMPARACION  
                   mov numDatos, [cadena +2]


         ;       comparacion: 
      ;         lea di,cadena
      ;         repe cmpsb  
       ;       Jne desiguales 
      ;       je iguales 


        ;Condicionales
        mov ah, 09h 
        lea dx, msg8
        int 21h 

        mov ah, 01h 
        int 21h 
        sub al, 30h 
        mov numDatos, al 


      

        ;"Volver a intentarlo? Si=1, y No=0 $"
        cmp numDatos, 1  
        jl salir
        jmp reiniciar 

        reiniciar: 
        jmp inicio

    salir: 
    int 27h 
end 