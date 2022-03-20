;Armas Barragan Luis Fernando 
;6"B" 
.MODEL SMALL
.STACK 
.DATA
.CODE
;A
    MOV DX,41H 
    MOV AH,02h 
     
     int 21h

;R
    MOV DX,72H 
    MOV AH,02h 
     
     int 21h

;M
    MOV DX,6DH 
    MOV AH,02h 
     
     int 21h

;A
    MOV DX,61H 
    MOV AH,02h 
     
     int 21h
;S
    MOV DX,73H 
    MOV AH,02h 
     
     int 21h
;Espacio
    MOV DX,20H 
    MOV AH,02h 
     
     int 21h
;B
    MOV DX,42H 
    MOV AH,02h 
     
     int 21h

;A
    MOV DX,61H 
    MOV AH,02h 
     
     int 21h
;R
    MOV DX,72H 
    MOV AH,02h 
     
     int 21h
;R
    MOV DX,72H 
    MOV AH,02h 
     
     int 21h
;A
    MOV DX,61H 
    MOV AH,02h 
     
     int 21h
;G
    MOV DX,67H 
    MOV AH,02h 
     
     int 21h
;A
    MOV DX,61H 
    MOV AH,02h 
     
     int 21h
;N
    MOV DX,6EH 
    MOV AH,02h 
     
     int 21h
;Espacio 
    MOV DX,20H 
    MOV AH,02h 
     
     int 21h
;L
    MOV DX,4CH 
    MOV AH,02h 
     
     int 21h
;U
    MOV DX,75H 
    MOV AH,02h 
     
     int 21h
;I
    MOV DX,69H 
    MOV AH,02h 
     
     int 21h
;S
    MOV DX,73H 
    MOV AH,02h 
     
     int 21h
;Espacio 
    MOV DX,20H 
    MOV AH,02h 
     
     int 21h
;F
    MOV DX,46H 
    MOV AH,02h 
     
     int 21h
;E
    MOV DX,65H 
    MOV AH,02h 
     
     int 21h
;R
    MOV DX,72H 
    MOV AH,02h 
     
     int 21h
;N
    MOV DX,6EH 
    MOV AH,02h 
     
     int 21h
;A
    MOV DX,61H 
    MOV AH,02h 
     
     int 21h
;N
    MOV DX,6EH 
    MOV AH,02h 
     
     int 21h
;D
    MOV DX,64H 
    MOV AH,02h 
     
     int 21h
;O
    MOV DX,6FH 
    MOV AH,02h 
     
     int 21h
;Enter
    MOV DX,0AH 
    MOV AH,02h 
     
     int 21h
;M
    MOV DX,4DH 
    MOV AH,02h 
     
     int 21h
;I
    MOV DX,69H 
    MOV AH,02h 
     
     int 21h
;Espacio
    MOV DX,20H 
    MOV AH,02h 
     
     int 21h
;E
    MOV DX,65H 
    MOV AH,02h 
     
     int 21h
;D
    MOV DX,64H 
    MOV AH,02h 
     
     int 21h
;A
    MOV DX,61H 
    MOV AH,02h 
     
     int 21h
;D
    MOV DX,64H 
    MOV AH,02h 
     
     int 21h
;Espacio 
    MOV DX,20H 
    MOV AH,02h 
     
     int 21h
;E
    MOV DX,65H 
    MOV AH,02h 
     
     int 21h
;S
    MOV DX,73H 
    MOV AH,02h 
     
     int 21h
;Dos puntos
    MOV DX,3AH 
    MOV AH,02h 
     
     int 21h
;Enter
    MOV DX,0AH 
    MOV AH,02h 
     
     int 21h
;2
    MOV DX,32H 
    MOV AH,02h 
     
     int 21h
;0
    MOV DX,30H 
    MOV AH,02h 
     
     int 21h
     int 27h
     
end