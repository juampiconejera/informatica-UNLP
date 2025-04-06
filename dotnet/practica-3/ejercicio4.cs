/*4) Implementar los métodos GetDiagonalPrincipal y GetDiagonalSecundaria que devuelven
un vector con la diagonal correspondiente de la matriz pasada como parámetro. Si la matriz no es
cuadrada generar una excepción ArgumentException.*/

double[] GetDiagonalPrincipal(double[,] matriz) {
    if (matriz.GetLength(0) != matriz.GetLength(1)) {
        throw new ArgumentException("La matriz no es cuadrada");
    }

    int tamaño = matriz.GetLength(0);
    double[] arrayDiagonal = new double[tamaño];

    for (int i = 0; i < tamaño; i++) {
        arrayDiagonal[i] = matriz[i,i];
    }

    return arrayDiagonal;
}
double[] GetDiagonalSecundaria(double[,] matriz) {
    if (matriz.GetLength(0) != matriz.GetLength(1)) {
        throw new ArgumentException("La matriz no es cuadrada");
    }

    int tamaño = matriz.GetLength(0);
    double[] arrayDiagonal = new double[tamaño];

    for (int i = 0; i < tamaño; i++) {
        arrayDiagonal[i] = matriz[i,(tamaño-1) - i];
    }

    return arrayDiagonal;
}