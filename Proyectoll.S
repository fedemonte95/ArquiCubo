  ; Instituto Tecnológico de Costa Rica          * *
  ; Escuela de Ingeniería en Computación         * *
  ; Arquitectura de Computadores                 * *
  ;                                              * *
  ; Proyecto 2: Cubo de leds                     * *
  ; Profesor:   Erick Hernandez                  * *
  ; Autores:    Esteban Mora          2013113381 * *
  ;             Federico Montealegre  2014072002 * *
  ;             Kevin Quesada         2014031724 * *
  ; ********************************************** *

  ; Diagrama de pines, por columna en el cubo
  ; 5 10 13
  ; 7 9  12
  ; 6 8  11
  ; pisos: 
  ; 0b01110000
  ; ----321----
  
  .global setup
  .global loop
  
setup:
  clr r10 
  ldi r21, 0b00000000
  ldi r20, 0b11111111
  ldi r22, 0b11100000
  ldi r23, 0b00111000       ; encender los tres pisos y para la salida   
  ldi r24, 0b00011000       ; encender dos pisos
  ldi r25, 0b00001000       ; encender solo primer piso 
  ldi r27, 0b00100000       ; encender solo segundo piso
  ldi r26, 0b00010000       ; encender solo tercer piso 
  ldi r28, 0b00011000       ; encender primer y tercer piso      
  ldi r30,        
  
  out 0x04, r20             ; r20 = 0b11111111 Cargo los pines 8-13 como salida. (1 significa salida)     
  out 0x0A, r22             ; r22 = 0b11100000 Cargo los pines 7-4 como salida. por lo tanto 
  out 0x07, r23             ; los establece en modo salida 
  clr r9
  mov r9, 0                 ; valor inicial del estado del boton
  
; *********************************************************************************************************************************************************************
loop:
  cp r9, 0
  jmp   PATRON_BLINK
  
; *********************************************************************************************************************************************************************
Delay:
  sbr   r18, 0x11     
  sbr   r17, 0x11    
  sbr   r16, 0x11 

wait:  
  dec   r16         ; Decrement r16-1
  brne  wait        ; jump to label name wait if <> zero
  dec   r17         ; Decrement r17-1
  brne  wait        
  dec   r18         ; Decrement r18-1
  brne  wait        
  ret               
; ********************************************************************************************************************************************************************* 
 PATRON_BLINK:
  out   0x08, r23
  out   0x05, r20 
  out   0x0B, r22  
  call  Delay
  out   0x05, r21 
  out   0x0B, r21
  call  Delay
  rjmp  PATRON_SNAKE
; ********************************************************************************************************************************************************************* 
PATRON_SNAKE: 
  sbi   0x05, 5   ; 13
  call  Delay
  cbi   0x05, 5
  call  Delay 
  sbi   0x05, 4   ; 12 
  call  Delay 
  cbi   0x05, 4   
  call  Delay 
  sbi   0x05, 3   ; 11
  call  Delay 
  cbi   0x05, 3
  call  Delay 
  sbi   0x05, 2   ; 10
  call  Delay 
  cbi   0x05, 2
  call  Delay
  sbi   0x05, 1   ; 9
  call  Delay
  cbi   0x05, 1
  call  Delay 
  sbi   0x05, 0   ; 8
  call  Delay
  cbi   0x05, 0 
  call  Delay
  sbi   0x0B,5 ;
  call  Delay 
  cbi   0x0B,5
  call  Delay
  sbi   0x0B, 6 ;
  call  Delay
  cbi   0x0b, 6
  call  Delay 
  sbi   0x0B, 7 ; 
  call  Delay
  cbi   0x0B, 7
  call  Delay
  rjmp  PATRON_HELICE
; *********************************************************************************************************************************************************************
PATRON_HELICE:
  out   0x08, r23
  
  sbi   0x05, 1
  sbi   0x05, 5
  sbi   0x0B, 6
  call  Delay
  cbi   0x05, 5
  cbi   0x0B, 6
  call  Delay
  sbi   0x0B, 5
  sbi   0x05, 3
  call  Delay
  cbi   0x0B, 5
  cbi   0x05, 3
  call  Delay
  sbi   0x05, 4
  sbi   0x0B, 7
  call  Delay
  cbi   0x05, 4
  cbi   0x0B, 7
  call  Delay 
  sbi   0x05, 0
  sbi   0x05, 2
  call  Delay 
  cbi   0x05, 0
  cbi   0x05, 2
  call  Delay

  out   0x08, r28
  sbi   0x05, 1
  sbi   0x05, 5
  sbi   0x0B, 6
  call  Delay
  cbi   0x05, 5
  cbi   0x0B, 6
  call  Delay
  sbi   0x0B, 5
  sbi   0x05, 3
  call  Delay
  cbi   0x0B, 5
  cbi   0x05, 3
  call  Delay
  sbi   0x05, 4
  sbi   0x0B, 7
  call  Delay
  cbi   0x05, 4
  cbi   0x0B, 7
  call  Delay 
  sbi   0x05, 0
  sbi   0x05, 2
  call  Delay 
  cbi   0x05, 0
  cbi   0x05, 2
  call  Delay
  
  jmp   PATRON_HELICE2

 
; *********************************************************************************************************************************************************************
PATRON_HELICE2:
  out   0x08, r26 ; enciende solo el piso 3
  sbi   0x05, 1
  sbi   0x05, 5
  sbi   0x0B, 6
  call  Delay
  cbi   0x05, 5
  cbi   0x0B, 6
  call  Delay
  sbi   0x0B, 5
  sbi   0x05, 3
  call  Delay
  cbi   0x0B, 5
  cbi   0x05, 3
  call  Delay
  sbi   0x05, 4
  sbi   0x0B, 7
  call  Delay
  cbi   0x05, 4
  cbi   0x0B, 7
  call  Delay 
  sbi   0x05, 0
  sbi   0x05, 2
  call  Delay 
  cbi   0x05, 0
  cbi   0x05, 2
  call  Delay
  
  out   0x08, r27 ; enciende solo el segundo piso 

  sbi   0x05, 1
  sbi   0x05, 5
  sbi   0x0B, 6
  call  Delay
  cbi   0x05, 5
  cbi   0x0B, 6
  call  Delay
  sbi   0x0B, 5
  sbi   0x05, 3
  call  Delay
  cbi   0x0B, 5
  cbi   0x05, 3
  call  Delay
  sbi   0x05, 4
  sbi   0x0B, 7
  call  Delay
  cbi   0x05, 4
  cbi   0x0B, 7
  call  Delay 
  sbi   0x05, 0
  sbi   0x05, 2
  call  Delay 
  cbi   0x05, 0
  cbi   0x05, 2
  call  Delay
  out   0x08, r25 ; enciendo solo el primer piso 
  sbi   0x05, 1
  sbi   0x05, 5
  sbi   0x0B, 6
  call  Delay
  cbi   0x05, 5
  cbi   0x0B, 6
  call  Delay
  sbi   0x0B, 5
  sbi   0x05, 3
  call  Delay
  cbi   0x0B, 5
  cbi   0x05, 3
  call  Delay
  sbi   0x05, 4
  sbi   0x0B, 7
  call  Delay
  cbi   0x05, 4
  cbi   0x0B, 7
  call  Delay 
  sbi   0x05, 0
  sbi   0x05, 2
  call  Delay 
  cbi   0x05, 0
  cbi   0x05, 2
  call  Delay
  jmp   pisos_walk
; *********************************************************************************************************************************************************************
PATRON_SCAN:

; *********************************************************************************************************************************************************************
PATRON_ZIGZAG:
; *********************************************************************************************************************************************************************
 pisos_walk:
                                                                ; enciende
  out   0x08, r26 ;  enciende tercer piso.
  out   0x05, r20 ; enciende todos los leds de 8-13
  out   0x0B, r22 ; enciende todos los leds de 5-7
  
  call  Delay
                                                                ; apaga 
  out   0x05, r21 
  out   0x0B, r21
  
  call  Delay 
  
  out   0x08, r27                                               ; enciende 
  out   0x05, r20 
  out   0x0B, r22 
  
  call  Delay
                                                                ; apaga
  out   0x05, r21 
  out   0x0B, r21
  call  Delay
                                                                ; enciende 
  out   0x08, r25
  out   0x05, r20 
  out   0x0B, r22 
  
  call  Delay
                                                                ; apaga
  out   0x05, r21 
  out   0x0B, r21
  
  call  Delay
  jmp   loop
  LECTURA_BOTON:
    

