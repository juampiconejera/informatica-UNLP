void imprimirMatriz (double[,] matriz) {
    for (int i = 0; i < matriz.GetLength(0); i++) {
        for (int j = 0; j < matriz.GetLength(1); j++) {
            Console.Write(matriz[i,j] + " ");
        }
    }
}