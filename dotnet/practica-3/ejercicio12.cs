/*12) Realizar un análisis sintáctico para determinar si los paréntesis en una expresión aritmética están
bien balanceados. Verificar que por cada paréntesis de apertura exista uno de cierre en la cadena de
entrada. Utilizar una pila para resolverlo. Los paréntesis de apertura de la entrada se almacenan en una
pila hasta encontrar uno de cierre, realizándose entonces la extracción del último paréntesis de apertura
almacenado. Si durante el proceso se lee un paréntesis de cierre y la pila está vacía, entonces la cadena
es incorrecta. Al finalizar el análisis, la pila debe quedar vacía para que la cadena leída sea aceptada, de
lo contrario la misma no es válida.*/
bool testBalanceo(string str) {
    Stack<char> pila = new Stack<char>();

    foreach (char ch in str) {
        if (ch == '(') {
            pila.Push(ch);
        } else if (ch == ')') {
            if (pila.Count == 0) {
                return false;
            }

            char top = pila.Pop();

            if (ch != ')' || top != '(') {
                Console.WriteLine("Debug");    
                return false;
            }
        }
    }
    Console.WriteLine("TERMINA CON: " + pila.Count);
    return pila.Count == 0;
    
}

Console.WriteLine(testBalanceo("(1+2)"));
Console.WriteLine(testBalanceo("(1+2)*(2+3)"));
Console.WriteLine(testBalanceo("(1+2"));
Console.WriteLine(testBalanceo("((((1+2))))"));
