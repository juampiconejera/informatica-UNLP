/*16) Implementar un programa que permita al usuario ingresar números por la consola. Debe ingresarse
un número por línea finalizado el proceso cuando el usuario ingresa una línea vacía. A medida que se
van ingresando los valores el sistema debe mostrar por la consola la suma acumulada de los mismos.
Utilizar double.Parse() y try/catch para validar que la entrada ingresada sea un número válido,
en caso contrario advertir con un mensaje al usuario y proseguir con el ingreso de datos.*/

double total = 0;

Console.WriteLine("Ingrese un numero a sumar. 'enter' para finalizar.");
string str = Console.ReadLine();
while (str != "") {
    try {
        double numero = double.Parse(str);
        total += numero;
    } catch {
        Console.WriteLine("No ingresaste un numero, volvé a ingresar por favor.");
    }
    str = Console.ReadLine();
}

Console.WriteLine("El total es: " + total);