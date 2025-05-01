package tp1.ejercicio9;

import java.util.*;

public class TestBalanceo {
	public static boolean esBalanceado(String str) {
		if (str.length() % 2 == 1) {
			return false;
		}
		Stack<Character> pila = new Stack<>();
		
		List<Character> openChar = new LinkedList<>();
		openChar.add('{');
		openChar.add('[');
		openChar.add('(');
		
		List<Character> closeChar = new LinkedList<>();
		closeChar.add('}');
		closeChar.add(']');
		closeChar.add(')');
		
		for (char ch : str.toCharArray()) { //Convierto el String en un array para recorrer cada indice.
			if (openChar.contains(ch)) {
				pila.push(ch);
			} else if (closeChar.contains(ch)) {
				if (pila.isEmpty()) {
					return false;
				}
				
				char top = pila.pop();
				
				if (closeChar.get(openChar.indexOf(ch)) != top) { //.indexOf me devuelve la posicion de ch (0, 1 o 2) y .get me devuelve el char que hay en esa posicion, luego la comparo con la var "top"					
					return false;
				}
			}
		}
		return pila.isEmpty(); //si la pila está vacia va a devolver true debido a que dentro del for desapilé todos los chars (hay balanceo)
	}
}
