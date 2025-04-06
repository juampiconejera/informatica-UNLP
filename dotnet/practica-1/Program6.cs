/*6) Utilizar Console.ReadLine() para leer líneas de texto (secuencia de caracteres que finaliza al
presionar <ENTER>) por la consola. Por cada línea leída se debe imprimir inmediatamente la cantidad
de caracteres de la misma. El programa termina al ingresar la cadena vacía.
Tip: si st es una variable de tipo string, entonces st.Length devuelve la cantidad de caracteres del
string.*/

Console.WriteLine("Escribí una palabra");
string msj;
do {
    msj = Console.ReadLine();
    Console.WriteLine(msj.Length);
    } while (msj != "");
