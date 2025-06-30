package practica1.ejercicio2;

public class Multiplos {
	public static int[] nMultiplos(int n) {
		int arreglo[] = new int[n];
		for (int i = 0; i < n; i++) {
			arreglo[i] = (i+1) * n;
		}
		
		return arreglo;
	}
}
