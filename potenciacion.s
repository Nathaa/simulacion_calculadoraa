
.global potenciacion

potenciacion:

//Mostar un mensaje en pantalla
  LDR R0, =mensaje9
  BL printf

// Leer un mensaje de pantalla
   LDR R0, =formato1
   LDR R1, =numero1
   BL scanf

pot:
   //Mostar un mensaje en pantalla
     LDR R0, =mensaje10
     BL printf

   // Leer un mensaje de pantalla
      LDR R0, =formato2
      LDR R1, =numero2
      BL scanf

      LDR R1, =numero1                   // carga la direccion del primer numero entero
      LDR R1, [R1]                       // carga el valor del primer numero entero

      LDR R2, =numero2                  // carga la direccion del segundo numero entero
      LDR R2, [R2]                      // carga el valor del segundo numero entero

      CMP R2, #0                       // compara si el r1 es menor a 0, salta al ciclo validp
      BLT validp

      MOV R3, #1                       // asigna el valor de r3=1

loop:
      CMP  R2, #0                      // compara si R2>=0
      BEQ salir
      MUL  R3, R3, R1                 // multiplica r3=r3*r1
      SUB  R2, R2, #1                 //resta para ir disminuyendo el exponente r2=r2-1
      B  loop                         // salta al ciclo loop

validp:
      LDR R0, =mens3                  // carga en el r0 el mensaje de error a mostrar
      BL printf                       // llama a la funcion para imprimir
      B pot                           // salta al ciclo divisor
salir:
      LDR R0, =resultado5             // carga el mensaje de impresion del resultado en r0
      MOV R1, R3                     // mueve el resultado al r1,  r1=r3
      BL printf                      // llama a la funcion imprimir
      B _exit                        // salta al ciclo de terminar el programa
