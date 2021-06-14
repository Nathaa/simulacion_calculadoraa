

.global division

division:

divi:
//Mostar un mensaje en pantalla
  LDR R0, =mensaje8
  BL printf

// Leer un mensaje de pantalla
   LDR R0, =formato1
   LDR R1, =numero1
   BL scanf

   LDR R1, =numero1             // carga la direccion del primer numero entero
   LDR R1, [R1]                 // carga el valor del primer numero entero

   CMP R1, #0                  // compara si el r1 es menor a 0, salta al ciclo valid1
   BLT valid1

divis:
   //Mostar un mensaje en pantalla
     LDR R0, =mensaje7
     BL printf


   // Leer un mensaje de pantalla
      LDR R0, =formato2
      LDR R1, =numero2
      BL scanf

      LDR R1, =numero1              // carga la direccion del primer numero entero
      LDR R1, [R1]                  // carga el valor del primer numero entero

      LDR R2, =numero2              // carga la direccion del segundo numero entero
      LDR R2, [R2]                  // carga el valor del segundo numero entero

      CMP R2, #0                    // compara si el r2 es menor o igual a 0, salta al ciclo valid2
      BLE valid2

      MOV R3, #0                   // asigna el valor de r3=0
div:
      CMP  R1, R2                 // compara el valor del registro r1 con r2, si r1 >= R2
      SUBGE  R1, R1, R2          // si se cumple la codicion de cmp resta r1=r1-r2
      ADDGE  R3, R3, #1          // sumar R3=R3+1 si R1>=R2
      BGE  div                   // salta al ciclo div si R1>=R2
      B impri                    // salta al ciclo imprimir

valid1:
        LDR R0, =mens             // carga en el r0 el mensaje de error a mostrar
        BL printf                 // llama a la funcion para imprimir
        B divi                    // salta al ciclo dividendo

valid2:
        LDR R0, =mens1           // carga en el r0 el mensaje de error a mostrar
        BL printf                // llama a la funcion para imprimir
        B divis                  // salta al ciclo divisor

impri:
        LDR R0, =resultado4     // carga el mensaje de impresion del resultado en r0
        MOV R1,R3               // mueve el resultado al r1,  r1=r3
        BL printf               // llama a la funcion imprimir
        B _exi                  // salta al ciclo de terminar el programa


_exi:
        MOV R7, #1              // llama a la funcion de terminar el programa
        SVC 0
