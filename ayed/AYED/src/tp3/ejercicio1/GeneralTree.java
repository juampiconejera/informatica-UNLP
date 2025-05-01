package tp3.ejercicio1;

import java.util.LinkedList;
import java.util.List;
import tp1.ejercicio8.Queue;

public class GeneralTree<T>{

	private T data;
	private List<GeneralTree<T>> children = new LinkedList<>(); 

	public GeneralTree() {
		
	}
	public GeneralTree(T data) {
		this.data = data;
	}

	public GeneralTree(T data, List<GeneralTree<T>> children) {
		this(data);
		this.children = children;
	}	
	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public List<GeneralTree<T>> getChildren() {
		return this.children;
	}
	
	public void setChildren(List<GeneralTree<T>> children) {
		if (children != null)
			this.children = children;
	}
	
	public void addChild(GeneralTree<T> child) {
		this.getChildren().add(child);
	}

	public boolean isLeaf() {
		return !this.hasChildren();
	}
	
	public boolean hasChildren() {
		return !this.children.isEmpty();
	}
	
	public boolean isEmpty() {
		return this.data == null && !this.hasChildren();
	}

	public void removeChild(GeneralTree<T> child) {
		if (this.hasChildren())
			children.remove(child);
	}

	public int altura() {
		if (this.isEmpty()) {
			return -1;
		}
		int max = 0;
		List<GeneralTree<T>> hijo = this.getChildren(); 
		for (GeneralTree<T> c : hijo) {
			int altura = c.altura();
			if (altura > max) max = altura;
		}
		return (max++);
	}

	public int nivel(T dato){
		if (this.isEmpty()) {
			return -1;
		}
		Queue<GeneralTree<T>> cola = new Queue<>();
		GeneralTree<T> aux;
		cola.enqueue(this);
		cola.enqueue(null);
		int nivelActual = 0;
		
		while (!cola.isEmpty()) {
			aux = cola.dequeue();
			if (aux != null) {
				if (aux.getData().equals(dato)) {
					return nivelActual;
				}

				List<GeneralTree<T>> listAux = aux.getChildren();
				for (GeneralTree<T> c : listAux){
					cola.enqueue(c);
				}

			} else if (!cola.isEmpty()) {
				cola.enqueue(null);
				nivelActual++;
			}
		}
		return -1;
	  }

	public int ancho(){
		if (this.isEmpty()) {
			return -1;
		}
		Queue<GeneralTree<T>> cola = new Queue<>();
		GeneralTree<T> aux;
		cola.enqueue(this);
		cola.enqueue(null);

		int cont = 0;
		int max = 1;

		while (!cola.isEmpty()) {
			aux = cola.dequeue();
			if (aux != null) {
				cont++;
				List<GeneralTree<T>> listAux = aux.getChildren();
				for (GeneralTree<T> c: listAux) {
					cola.enqueue(c);
				}
			} else if (!cola.isEmpty()) {
				cola.enqueue(null);
				if (cont > max) max = cont;
				cont = 0;
			}
		}
		return max;
	}

	public boolean esAncestro (T a, T b) {
		if (this.isEmpty()) return false;
		return buscadorA(a,b);
	}

	private boolean buscadorA(T a, T b) {
		Queue<GeneralTree<T>> cola = new Queue<>();
		GeneralTree<T> aux;
		cola.enqueue(this);
		
		while (!cola.isEmpty()) {
			aux = cola.dequeue();
			if (aux.getData().equals(a)) return buscadorB(aux, b); //encontré lo deseado (soy re capoeira)

			List<GeneralTree<T>> listAux = aux.getChildren();
			for (GeneralTree<T> c : listAux) {
				cola.enqueue(c);
			}
		}

		return false; //recorrí todo el arbol sin encontrar a
	}

	private boolean buscadorB(GeneralTree<T> arbol, T b) {
		Queue<GeneralTree<T>> cola = new Queue<>();
		GeneralTree<T> aux;
		cola.enqueue(arbol);
		
		while (!cola.isEmpty()) {
			aux = cola.dequeue();
			if (aux.getData().equals(b)) return true; //encontré b

			List<GeneralTree<T>> listAux = aux.getChildren();
			for (GeneralTree<T> c : listAux) {
				cola.enqueue(c);
			}
		}
		
		return false; //recorri todo el subarbol y no encontré b
	}
}