package tp2.ejercicio6;

import tp2.ejercicio1.*;

public class ejercicio6 {
	public static void main(String[] args) {
		 	System.out.println("Test Transformacion");
	        BinaryTree<Integer> ab = new BinaryTree<Integer>(4);
	        ab.addLeftChild(new BinaryTree<Integer>(2));
	        ab.addRightChild(new BinaryTree<Integer>(6));
	        ab.getLeftChild().addLeftChild(new BinaryTree<Integer>(1));
	        ab.getLeftChild().addRightChild(new BinaryTree<Integer>(3));
	        ab.getRightChild().addLeftChild(new BinaryTree<Integer>(5));
	        ab.getRightChild().addRightChild(new BinaryTree<Integer>(8));
	        ab.imprimirArbol();
	        Transformacion tras = new Transformacion(ab);
	        tras.suma();
	        System.out.println();
	        System.out.println("Arbol transformado");
	        tras.getArbol().imprimirArbol();
	}
}
