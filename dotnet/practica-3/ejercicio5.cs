/*5) Implementar un método que devuelva un arreglo de arreglos con los mismos elementos que la matriz
pasada como parámetro:*/
double[][] GetArregloDeArreglo(double [,] matriz) {
    double[][] arrayOfArrays = new double[matriz.GetLength(0)][];
    for (int i = 0; i < matriz.GetLength(0); i++) {
        arrayOfArrays[i] = new double[matriz.GetLength(1)];
        for (int j = 0; j < matriz.GetLength(1); j++) {
            arrayOfArrays[i][j] = matriz[i,j];
        }
    }

    return arrayOfArrays;
}