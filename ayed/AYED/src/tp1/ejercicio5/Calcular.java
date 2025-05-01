package tp1.ejercicio5;

public class Calcular {
	
	public static Respuestas puntoA(int[] array) {
		int max = Integer.MIN_VALUE;
		int min = Integer.MAX_VALUE;
		double sumador = 0;
		
		for (int i = 0; i < array.length; i++) {
			if (array[i] < min) {
				min = array[i];
			}
			if (array[i] > max) {
				max = array[i];
			}
			sumador += array[i];
		}
		
		Respuestas respuesta = new Respuestas(min,max,sumador/array.length);
		
		return respuesta;
	}
	
	public static void puntoB(int[] array, Respuestas datos) {
		int min = Integer.MAX_VALUE;
		int max = Integer.MIN_VALUE;
		double sumador = 0;
		
		for (int i = 0; i < array.length; i++) {
			if (array[i] < min) {
				min = array[i];
			}
			if (array[i] > max) {
				max= array[i];
			}
			sumador += array[i];
		}
		
		//RESPUESTAS
		datos.setMinimo(min);
		datos.setMaximo(max);
		datos.setPromedio(sumador/array.length);
	}
	
	public static void puntoC(int[] array) {
		int min = Integer.MAX_VALUE;
		int max = Integer.MIN_VALUE;
		double sumador = 0;
		
		for (int i = 0; i < array.length; i++) {
			if (array[i] < min) {
				min = array[i];
			}
			if (array[i] > max) {
				max= array[i];
			}
			sumador += array[i];
		}
		
		//RESPUESTAS
		Respuestas datos = new Respuestas(min,max, sumador/array.length);
	
	}
}
