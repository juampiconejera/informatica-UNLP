/* 
1) Consultar en la documentación de Microsoft y responder cuál es la diferencia entre los métodos
WriteLine() y Write() de la clase System.Console ¿Cómo funciona el método ReadKey() de
la misma clase? Escribir un programa que imprima en la consola la frase “Hola Mundo” haciendo una
pausa entre palabra y palabra esperando a que el usuario presione una tecla para continuar.
Tip: usar los métodos ReadKey() y Write() de la clase System.Console


El método WriteLine() de la clase System.Console escribe los datos especificados, seguidos del terminador de línea actual, en el flujo de salida estándar.
El método Write() escribe los datos especificados en el flujo de salida estándar sin un terminador de línea.
El método WriteLine() agrega un carácter de nueva línea al final de la salida, moviendo el cursor a la siguiente línea.
El método Write() no agrega un carácter de nueva línea, por lo que el cursor permanece en la misma línea después de la salida.

Por ejemplo:
<code>
Console.Write("Hola, ");
Console.WriteLine("Mundo!");
</code>
Salida:
Hola, Mundo!

El método ReadKey() de la clase System.Console obtiene el siguiente carácter o tecla de función presionada por el usuario.
El método ReadKey() espera a que se presione una tecla y devuelve un objeto ConsoleKeyInfo que describe la tecla presionada.

Este método puede mostrar la tecla presionada en la ventana de la consola.
ConsoleKeyInfo keyInfo = Console.ReadKey();
Console.WriteLine($"Presionaste: {keyInfo.KeyChar}"); */
using System;

class Program1 {
    static void Main() {
        Console.Write("Hola ");
        Console.ReadKey();
        Console.Write("mundo!");
    }
}