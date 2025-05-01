package tp1.ejercicio7;

import java.util.*;
public class EjercicioSucesion {
	public static List<Integer> calcularSucesion (int n) {
		List<Integer> lista = new ArrayList<>();
		recursividad(lista, n);
		return lista;
	}
	
	private static void recursividad (List<Integer> lista, int n) {
		if (n != 1) {
			lista.add(n);
			int aux = n % 2 == 0 ? (n/2) : (3*n + 1); 
			recursividad(lista, aux);
		}
		else {
			lista.add(n);
		}
	}
}
