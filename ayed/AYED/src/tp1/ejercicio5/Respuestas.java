package tp1.ejercicio5;

public class Respuestas {
	private int maximo;
	private int minimo;
	private double promedio;
	
	public Respuestas(int min, int max, double promedio) {
		minimo = min;
		maximo = max;
		this.promedio = promedio;
	}
	
	public int getMaximo() {
		return maximo;
	}
	public void setMaximo(int maximo) {
		this.maximo = maximo;
	}
	
	public int getMinimo() {
		return minimo;
	}
	public void setMinimo(int minimo) {
		this.minimo = minimo;
	}
	
	public double getPromedio() {
		return promedio;
	}
	public void setPromedio(double promedio) {
		this.promedio = promedio;
	}
}
