package tp1.ejercicio8;

public class DoubleEndedQueue<T> extends Queue<T> {
	public void enqueueFirst(T item) {
		super.data.add(0, item);
	}
}
