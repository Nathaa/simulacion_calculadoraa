
 .global multi

multi:

      //Mostar un mensaje en pantalla
        LDR R0, =mensaje3
        BL printf

      // Leer un mensaje de pantalla
         LDR R0, =formato1
         LDR R1, =numero1
         BL scanf

         //Mostar un mensaje en pantalla
           LDR R0, =mensaje4
           BL printf

         // Leer un mensaje de pantalla
            LDR R0, =formato2
            LDR R1, =numero2
            BL scanf

            LDR R1, =numero2             // carga la direccion del primer numero entero
            LDR R1, [R1]                // carga el valor del primer numero entero

            LDR R2, =numero1            // carga la direccion del segundo numero entero
            LDR R2, [R2]                // carga el valor del segundo numero entero

            MUL R3, R1, R2             // realiza la multiplicacion r3= r1xr2
            B resul                    // salta al ciclo imprimir
resul:
            LDR R0, =resultado2        // carga el mensaje de impresion del resultado en r0
            MOV R1, R3                 // mueve el resultado al r1,  r1=r3
            BL printf                  // llama a la funcion imprimir
            B _exit                    // salta al ciclo de terminar el programa

_exit:
           MOV R7, #1                  // llama a la funcion de terminar el programa
           SVC 0
