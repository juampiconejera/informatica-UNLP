package tp2.ejercicio3;

import tp2.ejercicio2.BinaryTree;
import java.util.*;

public class ContadorArbol {
	BinaryTree<Integer> tree;
	
	public ContadorArbol(BinaryTree<Integer> tree) {
		this.tree = tree;
	}
	
	public List<Integer> numerosParesIn() {
		List<Integer> li = new LinkedList<>();
		if (!tree.isEmpty()) calcularNumerosParesIn(li, tree);
		return li;
	}
	
	private void calcularNumerosParesIn(List<Integer> li, BinaryTree<Integer> t) {
		if (t.hasLeftChild()) calcularNumerosParesIn(li, t.getLeftChild());
		if (t.getData() % 2 == 0)	li.add(t.getData());
		if (t.hasRightChild()) calcularNumerosParesIn(li, t.getRightChild());
	}
	
	public List<Integer> numerosParesPos() {
		List<Integer> li = new LinkedList<>();
		if (!tree.isEmpty()) calcularNumerosParesPos(li, tree);
		return li;
	}
	
	private void calcularNumerosParesPos(List<Integer> li, BinaryTree<Integer> t) {
		if (t.hasLeftChild()) calcularNumerosParesPos(li, t.getLeftChild());
		if (t.hasRightChild()) calcularNumerosParesPos(li, t.getRightChild());
		if (t.getData() % 2 == 0) li.add(t.getData());
	}
}
