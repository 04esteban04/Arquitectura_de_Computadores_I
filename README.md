# Generador de números pseudo-aleatorios LFSR 

Generador de números pseudo aleatorios utilizando el algoritmo _linear-feedback shift register_ (LFSR), en su variante fibonacci.

## Algoritmo LFSR 💾

El generador LFSR tiene múltiples aplicaciones en criptografía, videojuegos, simulación y otros. El generador obtiene números en un orden secuencial aleatorio:

1. Se inicia con un valor semilla.
2. Se toman los bits de las posiciones (`tab`) dadas por el polinomio y se les aplica la operación `xor`.
3. Se realiza un `shift left` para descartar el `LSB`.
4. Se ingresa el bit resultante en la posición del `MSB`.


El código en el archivo `ejercicio.s` implementa este algoritmo en ensamblador utilizando el set de instrucciones `RISC-V`.

## Requisitos

Para correr el código de ejemplo debe tener instalado en su computador un simulador de lenguaje ensamblador. Le recomendamos utilizar el simulador de procesador `RISC-V` : [Ripes](https://github.com/mortbopet/Ripes/releases).

El simulador Ripes se encuentra disponible para Windows, MacOS y Linux. Consulte las instrucciones de instalación [aquí](https://github.com/mortbopet/Ripes/blob/master/README.md).


## Pasos

Para correr el programa:

1. Abra el simulador de `RISC-V` Ripes.
2. Para cargar el archivo `File > Load Program` y seleccione el archivo `lfsr_ealvarado_v2.s`.
3. En la pestaña **Editor** podrá revisar el código fuente. El valor de la semilla viene por defecto en `0x53` que es el ASCII de la letra _S_. 
4. Finalmente, corra el programa haciendo click en el **botón de play** que se ubica en la barra superior. Podrá ver los resultados en la tabla de registros o en la pestaña **Memory**.


