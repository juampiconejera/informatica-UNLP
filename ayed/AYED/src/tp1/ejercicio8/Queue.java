package tp1.ejercicio8;

import java.util.*;

public class Queue <T> extends Sequence {
	protected List<T> data;
	
	public Queue() {
		this.data = new ArrayList<>();
	}
	
	public void enqueue(T dato) {
		data.add(dato);
	}
	
	public T dequeue() {
		T aux = data.get(0);
		data.remove(0);
		return aux;
	}
	
	public T head() {
		return data.get(0);
	}
	@Override
	public boolean isEmpty() {
		return data.isEmpty();
	}
	@Override
	public int size() {
		return data.size();
	}
	
	public String toString() {
		String str = "[ ";
		for (T i : data) {
			str += i + " ";
		}
		str += "]";
		return str;
	}
}
