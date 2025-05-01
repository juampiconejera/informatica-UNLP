package tp2.ejercicio6;


import tp2.ejercicio1.BinaryTree;

public class Transformacion {
	BinaryTree<Integer> bt;
	
	public Transformacion(BinaryTree<Integer> a) {
		bt = a;
	}
	
	public BinaryTree<Integer> getArbol() {
		return bt;
	}
	
	public BinaryTree<Integer> suma() {
		sumar(bt);
		return bt;
	}
	
	private int sumar(BinaryTree<Integer> a) {
		int suma = 0;
		if (a.isLeaf()) {
			suma = a.getData();
			a.setData(0);
			return suma;
		}
		if (a.hasLeftChild()) suma += sumar(a.getLeftChild());
		if (a.hasRightChild()) suma += sumar(a.getRightChild());
		
		int aux = a.getData();
		a.setData(suma);
		return aux + suma;
	}
}


