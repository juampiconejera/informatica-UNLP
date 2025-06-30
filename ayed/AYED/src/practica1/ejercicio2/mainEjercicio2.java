package practica1.ejercicio2;

import java.util.Scanner;

public class mainEjercicio2 {
	public static void main(String[] args) {
		System.out.print("Ingrese numero para saber su multiplo: ");
		Scanner s = new Scanner(System.in);
		int num = s.nextInt();
		
		int[] arreglo = Multiplos.nMultiplos(num);
		
		for (int i = 0; i < num; i++) {
			System.out.print(arreglo[i] + " ; ");
		}
	}
}
