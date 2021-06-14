// Nombre: Simulacion de calculadora
//Objetivo: Realiza una simulacion de una calculadora con operaciones basicas con numeros enteros con signo


.include "suma.s"              // Incluye  la subrutina suma
.include "resta.s"             // Incluye  la subrutina resta
.include "multiplicacion.s"    // Incluye  la subrutina multiplicacion
.include "division.s"         // Incluye  la subrutina division
.include "potenciacion.s"     // Incluye  la subrutina potencia

.data                       // Declaracion de la variables
mensaje: .asciz "Bienvenido a la simulacion de calculadora de numeros enteros con signo\nIngrese el numero de la opcion a realizar:\n1. Suma\n2. Resta\n3. Multiplicacion\n4. Division\n5. Potenciacion\n"
mensaje1: .asciz "\n Ingrese el sumando:"
mensaje2: .asciz "\n Ingrese el sumador:"
mensaje3: .asciz "\n Ingrese el multiplicando:"
mensaje4: .asciz "\n Ingrese el multiplicador:"
mensaje5: .asciz "\n Ingrese el minuendo:"
mensaje6: .asciz "\n Ingrese el sustraendo:"
mensaje7: .asciz "\n Ingrese el divisor:"
mensaje8: .asciz "\n Ingrese el dividendo:"
mensaje9: .asciz "\n Ingrese la base:"
mensaje10: .asciz "\n Ingrese la potencia:"
mens: .asciz "Error en el dividendo, no puede ser menor de 0\n"
mens1: .asciz "Error el divisor, no puede ser menor o igual a 0\n"
mens3: .asciz "Error en la potencia, ingrese una potencia mayor que 0\n"
errormsj: .asciz "Error, esta opcion no se encuentra en las operaciones de la calculadora\nIngrese un numero valido:\n1\n2\n3\n4\n5\n"
resultado1: .asciz "\n La suma es:%d:\n"
resultado2: .asciz "\n la multiplicaion es:%d\n"
resultado3: .asciz "\n la resta es:%d\n"
resultado4: .asciz "\n la division es:%d\n"
resultado5: .asciz "\n la potenciacion es:%d\n"
msj0: .asciz "Error , vuelva a ingresar un numero positivo:0\n"

formato:  .asciz "%d"          // Declaracion de las variables para usar funciones de C
formato1:  .asciz "%d"         // Declaracion de las variables para usar funciones de C
formato2:  .asciz "%d"         // Declaracion de las variables para usar funciones de C

numero:   .word  0            // Declaracion del numero enteros a recibir al seleccionar el menu
numero1:   .word  0           // Declaracion del numero enteros con signo a recibir
numero2:   .word  0           // Declaracion del numero enteros con signo a recibir
.text
.global main
main:

PUSH {LR}                  // Llamada a la pila

 // Funcion calculadora en donde muestra las opciones disponibles para que el usuario seleccione la que desee.
calcu:
//Mostar un mensaje en pantalla
  LDR R0, =mensaje     // cargar en el r0 el mensaje a mostrar
  BL printf            // imprimir el mensaje con funcion de C

// Leer un mensaje de pantalla
   LDR R0, =formato       // cargar el formato de la variable a donde se guardara el numero de la calculadora
   LDR R1, =numero        // cargar en el r1 el numero del menu de la calculadora
   BL scanf

   LDR R1, =numero        // cargar la direccion del r1 que es el numero seleccionado de la calculadora
   LDR R1, [R1]           // cargar el valor del r1

   CMP R1, #1                      //Comparaciones del numero ingresado por el usuario r1=1
   BEQ suma                        // si la comparacion es afirmativa salta al ciclo de suma
   CMP R1, #2                      //Comparaciones del numero ingresado por el usuario r1=2
   BEQ resta                       // si la comparacion es afirmativa salta al ciclo de resta
   CMP R1, #3                      //Comparaciones del numero ingresado por el usuario r1=3
   BEQ multi                       // si la comparacion es afirmativa salta al ciclo de multiplicacion
   CMP R1, #4                     //Comparaciones del numero ingresado por el usuario r1=4
   BEQ division                   // si la comparacion es afirmativa salta al ciclo de division
   CMP R1, #5                     //Comparaciones del numero ingresado por el usuario r1=5
   BEQ potenciacion               // si la comparacion es afirmativa salta al ciclo de potenciacion


   CMP R1, #0                      // Compara si el r1 es menor o igual 0, y si es asi salta al ciclo error1
   BLE error1

   CMP R1, #5                     // Compara si el r1 es mayor a 5 y si es asi salta al ciclo error2
   BGT error2

   BL suma                       //Salta a la subrutina suma
   BL resta                      //Salta a la subrutina resta
   BL multi                      //Salta a la subrutina multi
   BL division                  //Salta a la subrutina division
   BL potenciacion              //Salta a la subrutina potenciacion

error1:
   LDR R0, =errormsj             // carga en el r0 el mensaje de error a mostrar
   BL printf                     // llama a la funcion para imprimir
   B calcu                       // salta al ciclo calculadora

error2:
   LDR R0, =errormsj             // carga en el r0 el mensaje de error a mostrar
   BL printf                     // llama a la funcion para imprimir
   B calcu                       // salta al ciclo calculadora
