.model small
.stack 
.data
 msg1 db 10,13, "Que operacion quieres realizar? (Selecciona un numero) $"
 msg2 db 10,13, "1. Suma de dos numeros. $"
 msg3 db 10,13, "2. Resta de dos numeros. $"
 msg4 db 10,13, "3. Multiplicacion de dos numeros. $" 
 msg5 db 10,13, "4. Division de dos numeros. $" 
 msg6 db 10,13, "5. Salir. $" 
 msg7 db 10,13, "Opcion no valida intentalo denuevo. $"
 num1 db ? 
 num2 db ? 
 resultado db ? 
 opcion db 10,13, "Opcion: $"
 msgnum1 db 10,13, "Introduce un numero: $"
 msgnum2 db 10,13, "Introduce otro numero: $"
  res db 10, 13,"Resultado: $"
.code

mov ax, @data 
mov ds, ax 

menu: 
mov ah, 09h 
lea dx, msg1 
int 21h  

mov ah, 09h 
lea dx, msg2
int 21h 

mov ah, 09h 
lea dx, msg3 
int 21h 

mov ah, 09h 
lea dx, msg4 
int 21h 

mov ah, 09h 
lea dx, msg5 
int 21h 


mov ah, 09h 
lea dx, msg6 
int 21h 

mov ah, 09h 
lea dx, opcion
int 21h 

mov ah, 01h 
int 21h 


;Comparaciones cmp
cmp al, 31h 
jz suma
cmp al, 32h 
jz resta 
cmp al, 33h 
jz multi
cmp al, 34h
jz division 
jnz sino


suma: 
mov ah, 09h 
lea dx, msgnum1  
int 21h 

mov ah, 01h 
int 21h 

sub al, 30h 
mov num1, al 

mov ah, 09h 
lea dx, msgnum2  
int 21h

mov ah, 01h 
int 21h 


sub al, 30h 
mov num2, al  

mov al, num1 
add al, num2 
add al, 30h 

mov ah, 09h 
lea dx, res 
int 21h 

mov ah, 02h 
mov dl, al 
int 21h 

call salir 

resta: 
mov ah, 09h 
lea dx, msgnum1  
int 21h 

mov ah, 01h 
int 21h 

sub al, 30h 
mov num1, al 

mov ah, 09h 
lea dx, msgnum2  
int 21h

mov ah, 01h 
int 21h 


sub al, 30h 
mov num2, al  

mov al, num1 
sub al, num2 
add al, 30h 

mov ah, 09h 
lea dx, res 
int 21h 

mov ah, 02h 
mov dl, al 
int 21h 

call salir 
; PUNTO DE CONTROL 
multi: 
mov ah, 09h 
lea dx, msgnum1  
int 21h 

mov ah, 01h 
int 21h 

sub al, 30h 
mov num1, al 

mov ah, 09h 
lea dx, msgnum2  
int 21h

mov ah, 01h 
int 21h 


sub al, 30h 
mov num2, al  

    ;operacion
mov al, num1 
add al, num2 
add al, 30h 

mov ah, 09h 
lea dx, res 
int 21h 

mov ah, 02h 
mov dl, al 
int 21h 

call salir 




division: 

sino: 
cmp al, 35h 
jz Salir 
jnz nojala 

nojala:
mov ah, 09h 
lea dx, msg7
int 21h
call menu 

salir: 
int 27h

end 