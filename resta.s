

.global resta

resta:

//Mostar un mensaje en pantalla
  LDR R0, =mensaje5
  BL printf

// Leer un mensaje de pantalla
   LDR R0, =formato1
   LDR R1, =numero1
   BL scanf

   //Mostar un mensaje en pantalla
     LDR R0, =mensaje6
     BL printf

   // Leer un mensaje de pantalla
      LDR R0, =formato2
      LDR R1, =numero2
      BL scanf

      LDR R1, =numero1          // carga la direccion del primer numero entero
      LDR R1, [R1]             // carga el valor del primer numero entero

      LDR R2, =numero2         // carga la direccion del segundo numero entero
      LDR R2, [R2]             // carga el valor del segundo numero entero

      SUB R3, R1, R2          // realiza la resta r3= r1-r2
      B imp                  // salta al ciclo imprimir

imp:
      LDR R0, =resultado3     // carga el mensaje de impresion del resultado en r0
      MOV R1,R3               // mueve el resultado al r1,  r1=r3
      BL printf               // llama a la funcion imprimir
      B sal                   // salta al ciclo de terminar el programa


sal:
      MOV R7, #1             // llama a la funcion de terminar el programa
      SVC 0
