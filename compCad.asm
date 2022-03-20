.model small 
.stack
.data

    msgNombre db 10,13, 'Ingresa un nombre: $'
    msgCadenaIngresada db 10,13, 'El nombre que ingreso es: $' 
    cad3 db 10,13, 'Las cadenas no son iguales. $' 
    cad4 db 10,13, 'Las cadenas SON iguales. $' 
    cadenaIngresada db 100 dup('$')
    cadenaIngresad2 db 100 dup('$')

.code 

    mov ax, @data
    mov ds, ax 
    

    ;impresion cad1 
    lea dx, msgNombre 
    mov ah,09
    int 21h 
    
    ;Obtencion cad1
    leer: 
    lea si, cadenaIngresada
    mov ah,01h 
    int 21h 
    mov [si], al  ;Guardamos en el registro no el nombre completo
    inc si
    cmp al,0dh 
    ja leer 
    jb leer 

     mov ax,@data
     mov ds,ax

    
   ;Se necesita hacer un arreglo 
    ;impresion cad2 
    lea dx, msgNombre 
    mov ah,09
    int 21h 

    lea si, cadenaIngresad2
    ;Obtencion cad2 
    leer2: 
    mov ah,01h 
    int 21h 
    mov [si], al 
    inc si
    cmp al,0dh 
    ja leer2 
    jb leer2 
    

  mov cx,100  
  mov AX,DS 
  mov ES,AX 

    ;Comparacion
    comparacion: 
    lea si, cadenaIngresada 
    lea di, cadenaIngresad2
    repe cmpsb
    jne desiguales
    je iguales
   

    
    desiguales: 
  mov ax,@data
  mov ds,ax
    lea dx,cad3
    mov ah, 09 
    int 21h 
    jmp salir

    iguales:
  mov ax,@data
  mov ds,ax   
    lea dx, cad4 
    mov ah, 09 
    int 21h 
    jmp salir 

    salir:
    mov ah, 4ch
    int 21h 

end 