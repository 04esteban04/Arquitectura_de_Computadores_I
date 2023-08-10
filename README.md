# Generador de números pseudo-aleatorios LFSR 

Se crea un generador de números pseudo-aleatorios utilizando el algoritmo _linear-feedback shift register_ (LFSR), en su variante fibonacci.

Dicho generador funciona de la siguiente manera:

1. Se inicia con un valor semilla.
2. Se toman los bits de las posiciones dadas por el polinomio a utilizar y se les aplica la operación _XOR_.
3. Se realiza un _shift left_ al valor semilla para descartar el bit menos significativo (_LSB_).
4. Se ingresa el bit resultante de las operaciones _XOR_ (bit de _feedback_) en la posición del bit más significativo (_MSB_).


El código en el archivo `ejercicio.s` implementa este algoritmo en ensamblador utilizando el set de instrucciones _RISC-V_ y el siguiente polinomio: 

$$ P(x) = x^8 + x^6 + x^5 + x^4 + 1  $$

## Requisitos

Para ejecutar el código del archivo `ejercicio.s` debe tener instalado en su computador un simulador de lenguaje ensamblador. Es recomendable utilizar el simulador de _RISC-V_ llamado _Ripes_ el cual puede encontrar [aquí](https://github.com/mortbopet/Ripes/releases).

Dicho simulador se encuentra disponible para Windows, MacOS y Linux. Consulte las instrucciones de instalación [aquí](https://github.com/mortbopet/Ripes/blob/master/README.md).


## Pasos

Para correr el programa:

1. Abra el simulador _Ripes_.
2. Para cargar el archivo haga clic en `File -> Load Program` y seleccione el archivo `ejercicio.s`.
3. En la pestaña **_Editor_** podrá revisar el código fuente. Cada  línea del programa tiene su correspondiente comentario con la finalidad de mejorar la legibilidad de este. El valor de la semilla viene por defecto en `0x53` que es el código ASCII de la letra _S_. 
4. Finalmente, corra el programa haciendo click en el **botón play** que se ubica en la barra superior. Podrá ver los resultados en la tabla de registros o en la pestaña **_Memory_**.
