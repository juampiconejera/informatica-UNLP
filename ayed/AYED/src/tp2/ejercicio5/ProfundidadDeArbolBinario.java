package tp2.ejercicio5;

import tp1.ejercicio8.*;
import tp2.ejercicio1.*;

public class ProfundidadDeArbolBinario {
	private BinaryTree<Integer> arbol;
	
	public ProfundidadDeArbolBinario(BinaryTree<Integer> arbol) {
		this.arbol = arbol;
	}
	
	public int sumaElementosProfundidad(int profundidad) {
		if(arbol.isEmpty()) return 0;
		
		Queue<BinaryTree<Integer>> cola = new Queue<>();
		cola.enqueue(arbol);
		
		int nivelActual = 0;
		int suma = 0;
		
		while(nivelActual <= profundidad) {
			int tamañoCola = cola.size();
			
			if(nivelActual == profundidad) {
				for (int i = 0; i < tamañoCola; i++) {
					BinaryTree<Integer> nodo = cola.dequeue();
					suma += nodo.getData();
					
				}
			} else {
				for (int i = 0; i < tamañoCola; i++) {
					BinaryTree<Integer> nodo = cola.dequeue();
					if (nodo.hasLeftChild()) cola.enqueue(nodo.getLeftChild());
					if (nodo.hasRightChild()) cola.enqueue(nodo.getRightChild());
				}
			}
			nivelActual++;
		}
		
		
		return suma;
	}
	public static void main (String[] args) {
        System.out.println("Test Profundidad");
        BinaryTree<Integer> ab = new BinaryTree<Integer>(1);
        ab.addLeftChild(new BinaryTree<Integer>(2));
        ab.addRightChild(new BinaryTree<Integer>(3));
        ab.getLeftChild().addLeftChild(new BinaryTree<Integer>(4));
        ab.getLeftChild().addRightChild(new BinaryTree<Integer>(5));
        ab.getRightChild().addLeftChild(new BinaryTree<Integer>(6));
        ab.getRightChild().addRightChild(new BinaryTree<Integer>(7));
        
        ProfundidadDeArbolBinario prof = new ProfundidadDeArbolBinario(ab);
        System.out.println(prof.sumaElementosProfundidad(2));
        
    }
}