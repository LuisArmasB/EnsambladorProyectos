.model small  
.stack 
.data 
    num1 DB ?  
    num2 DB ? 
    res  DB ? 
    cad1 DB 10,13, "Ingresa el primer numero $"
        cad2 DB 10,13, "Ingresa el segundo numero $"
            cad3 DB 10,13, "Resultado:  $"
                cad4 DB 10,13, "Introduciste un numero no valido. $"
.code 
    mov ax,@data ; Inicializa los datos
    mov ds,ax 
    


numero1: 
   ;Cadena 1
   mov ah,09h 
   lea dx,cad1 
   int 21h 
   
 
    ;Ahora pedimos el numero 
     mov ah, 01h 
     int 21h 
     ;Le restamos los 30h al numero para que se guarde ya restao
     sub al, 30h 
     mov num1, al
     ;Condicional   
     cmp num1, 5   ; si num1 es igual o mayor a 5
     jge numero1
       jcxz numero2

numero2: 
   ;Cadena 2
   mov ah,09h 
   lea dx,cad2
   int 21h 

    ;Ahora pedimos el numero 
     mov ah, 01h 
     int 21h 
     sub al, 30h 
     mov num2, al    
    
     cmp num2, 5   ; si num1 es igual o mayor a 5
     jb numero2 

    jcxz suma






suma: 
;Resultado
   mov ah,09h 
   lea dx,cad3 
   int 21h 







int 27h 

end 



