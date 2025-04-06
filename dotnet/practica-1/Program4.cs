/*4) Escribir un programa que solicite al usuario ingresar su nombre e imprima en la consola un saludo
personalizado utilizando ese nombre o la frase “Hola mundo” si el usuario ingresó una línea en blanco.
Para ingresar un string desde el teclado utilizar Console.ReadLine()*/

Console.WriteLine("mensaje personalizado");
string msj = Console.ReadLine();
if (msj == "" || msj == " ") {
    Console.WriteLine("Hola mundo!");
} else {
    Console.WriteLine("Hola " + msj);
}