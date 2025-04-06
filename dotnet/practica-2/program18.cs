/*18) Escribir una función (método int Fac(int n)) que calcule el factorial de un número n pasado al
programa como parámetro por la línea de comando
a) Definiendo una función no recursiva
b) Definiendo una función recursiva
c) idem a b) pero con expression-bodied methods (Tip: utilizar el operador condicional ternario)*/

Console.WriteLine("numero factorial: ");
int factorial = int.Parse(Console.ReadLine());

/*      A       */
int facA(int n) {
    int res = n;
    for (int i = n-1; i > 1; i--) {
        res = res * i;
    }
    return res;
}

int facB(int n) {
    if (n <= 1) return 1;
    return n * facB(n - 1);
}

int facC(int n) => n <= 1 ? 1 : n * facC(n - 1); 

Console.WriteLine(facA(factorial));
Console.WriteLine(facB(factorial));
Console.WriteLine(facC(factorial));