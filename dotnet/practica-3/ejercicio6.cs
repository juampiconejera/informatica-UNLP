/*6) Implementar los siguientes métodos que devuelvan la suma, resta y multiplicación de matrices
pasadas como parámetros. Para el caso de la suma y la resta, las matrices deben ser del mismo tamaño,
en caso de no serlo devolver null. Para el caso de la multiplicación la cantidad de columnas de A debe
ser igual a la cantidad de filas de B, en caso contrario generar una excepción ArgumentException.*/

double[,]? Suma(double[,] A, double[,] B) {
    if (A.GetLength(0) != B.GetLength(0)) {
        return null;
    } else if (A.GetLength(1) != B.GetLength(1)) {
        return null;
    }
    
    double[,] sumMatrix = new double[A.GetLength(0),A.GetLength(1)];

    for (int i = 0; i < A.GetLength(0); i++) {
        for (int j = 0; j < A.GetLength(1); j++) {
            sumMatrix[i,j] = A[i,j] + B[i,j];
        }
    }
    return sumMatrix;
}

double[,]? Resta(double[,] A, double[,] B) {
    if (A.GetLength(0) != B.GetLength(0)) {
        return null;
    } else if (A.GetLength(1) != B.GetLength(1)) {
        return null;
    }

    double[,] differenceMatrix = new double[A.GetLength(0), B.GetLength(1)];

    for (int i = 0; i < A.GetLength(0); i++) {
        for (int j = 0; j < A.GetLength(1); j++) {
            differenceMatrix[i,j] = A[i,j] - B[i,j];
        }
    }

    return differenceMatrix;
}

double[,] Multiplicacion(double[,] A, double[,] B) {
    if (A.GetLength(1) != B.GetLength(0)) {
        throw new ArgumentException("Las columnas de la matriz A no coinciden con las filas de la matriz B");
    }

    double[,] productMatrix = new double[A.GetLength(0), B.GetLength(1)];

    /*Si A=[3,2] y B=[2,3] me va a quedar una matriz resultante de [3,3]
    Por lo que debo recorrer primero las columnas de A y las filas de B para multiplicar
    */


    for (int i = 0; i < A.GetLength(0); i++) { //Me permite recorrer primero las columnas y luego bajar de fila
        for (int j = 0; j < B.GetLength(1); j++) { //me permite recorrer primero las filas y luegos las columnas
            productMatrix[i,j] = 0; //Inicializo el indice para poder sumar las respectivas multiplicaciones
            for (int k = 0; k < A.GetLength(1); k++) { /*Siguiendo el ejemplo explicado en la linea 48, me permite alternar los indices,
                                                        - ProductMatrix[0,0] = A[0,0]*B[0,0] + A[0,1]*B[1,0].
                                                        - ProductMatrix[0,1] = A[0,0]*B[0,1] + A[0,1]*B[1,1]
                                                        - ProductMatrix[0,2] = A[0,0]*B[0,2] + A[0,1]*B[1,2]*/
                productMatrix[i,j] += A[i, k] * B[k, j];
            }
        }
    }

    return productMatrix;
}