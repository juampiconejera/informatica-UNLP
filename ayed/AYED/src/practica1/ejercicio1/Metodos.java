package practica1.ejercicio1;

public class Metodos {
	public static void puntoA(int a, int b) {
		for (int i = a; i <= b; i++) {
			System.out.println(i);
		}
	}
	
	public static void puntoB(int a, int b) {
		while (a <= b) {
			System.out.println(a);
			a++;
		}
	}
	
	public static void puntoC(int a, int b) {
		if (b > a) {
			puntoC(a, b-1);
		}
		System.out.println(b);
	}
}
