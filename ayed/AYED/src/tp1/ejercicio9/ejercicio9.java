package tp1.ejercicio9;

import java.util.*;

public class ejercicio9 {
	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		System.out.println("String a verificar si esta balanceado: ");
		String str = s.nextLine();
		
		if (TestBalanceo.esBalanceado(str)) {
			System.out.println("El string esta balanceado.");
		} else {
			System.out.println("El string no esta balanceado.");
		}
	}
}
