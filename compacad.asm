.model small
.stack 
.data
    msgNombre db 10,13, 'Ingresa un nombre: $' 
    cad3 db 10,13, 'Las cadenas no son iguales. $' 
    cad4 db 10,13, 'Las cadenas SON iguales. $' 
    cadenaIngresada db 100 dup('$')
    cadenaIngresad2 db 100 dup('$')
.code 
inicio:
  mov ax,@data
  mov ds,ax

  ;Msgnombre
  mov ah,09
  mov dx,offset msgNombre 
  int 21h
 
  lea si,cadenaIngresada  
leer:
  mov ah,01h  
  int 21h
  mov [si],al 
  inc si
  cmp al,0dh  
  ja leer
  jb leer

  ;Volvemos a mandar las variables a la direccion de memoria para poder usarlas
  mov ax,@data
  mov ds,ax

  ;Msgnombre
  mov ah,09
  mov dx,offset msgNombre  
  int 21h


  lea si,cadenaIngresad2  
pedir2:    
  mov ah,01h
  int 21h
  mov [si],al
  inc si
  cmp al,0dh
  ja pedir2
  jb pedir2
  
  ;Ajustes para pooder usar repe.
  mov cx,100  
  mov AX,DS  
  mov ES,AX 

comparacion: 
  lea si,cadenaIngresada  
  lea di,cadenaIngresad2 
  repe cmpsb  
  Jne desiguales 
  je iguales 


desiguales:
  mov ax,@data
  mov ds,ax
  mov ah,09
  mov dx,offset cad3  
  int 21h
  mov ah,04ch
  int 21h

 iguales:
   mov ax,@data
  mov ds,ax
  mov ah,09
  mov dx,offset cad4 ;Imprime que son iguales y finaliza el programa.
  int 21h
  mov ah,04ch
  int 21h 
end