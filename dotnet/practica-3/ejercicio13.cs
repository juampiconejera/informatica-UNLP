/*13) Utilizar la clase Stack<T> (pila) para implementar un programa
que pase un número en base 10 a otra base realizando divisiones
sucesivas. Por ejemplo para pasar 35 en base 10 a binario dividimos
sucesivamente por dos hasta encontrar un cociente menor que el
divisor, luego el resultado se obtiene leyendo de abajo hacia arriba el
cociente de la última división seguida por todos los restos.*/

string convertirBase(int numero, int baseDeseada) {
    if (baseDeseada < 2 || baseDeseada > 16) {
        throw new ArgumentException("La base es entre 2 y 16");
    }

    Stack<char> pila = new Stack<char>();
    string characters = "0123456789ABCDEF"; // saco el char mediante el indice (lo busque en internet pq no se me ocurria como hacerlo para base hexa :P)

    while (numero > 0) {
        int resto = numero % baseDeseada;
        pila.Push(characters[resto]);
        numero /= baseDeseada;
    }

    string resultado = "";

    while (pila.Count > 0) {
        resultado += pila.Pop();
    }

    return resultado;
}

Console.WriteLine("Numero en base 10: ");
int numero = int.Parse(Console.ReadLine());

Console.WriteLine("Base a convertir: ");
int baseDeseada = int.Parse(Console.ReadLine());

Console.WriteLine(convertirBase(numero, baseDeseada));