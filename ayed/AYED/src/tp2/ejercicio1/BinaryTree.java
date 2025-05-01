package tp2.ejercicio1;

import java.util.*;

public class BinaryTree <T> {
	
	private T data;
	private BinaryTree<T> leftChild;   
	private BinaryTree<T> rightChild; 

	
	public BinaryTree() {
		super();
	}

	public BinaryTree(T data) {
		this.data = data;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
	/**
	 * Preguntar antes de invocar si hasLeftChild()
	 * @return
	 */
	public BinaryTree<T> getLeftChild() {
		return leftChild;
	}
	/**
	 * Preguntar antes de invocar si hasRightChild()
	 * @return
	 */
	public BinaryTree<T> getRightChild() {
		return this.rightChild;
	}

	public void addLeftChild(BinaryTree<T> child) {
		this.leftChild = child;
	}

	public void addRightChild(BinaryTree<T> child) {
		this.rightChild = child;
	}

	public void removeLeftChild() {
		this.leftChild = null;
	}

	public void removeRightChild() {
		this.rightChild = null;
	}

	public boolean isEmpty(){
		return (this.isLeaf() && this.getData() == null);
	}

	public boolean isLeaf() {
		return (!this.hasLeftChild() && !this.hasRightChild());

	}
		
	public boolean hasLeftChild() {
		return this.leftChild!=null;
	}

	public boolean hasRightChild() {
		return this.rightChild!=null;
	}
	@Override
	public String toString() {
		return this.getData().toString();
	}
	

	public  int contarHojas() {
	   if (this.isLeaf()) return 1;
	   
	   int countChilds = 0;
	   
	   if (this.hasLeftChild()) countChilds += this.getLeftChild().contarHojas();
		   
	   if (this.hasRightChild()) countChilds += this.getRightChild().contarHojas();
	
	   return countChilds;
			   
	}
		
    public BinaryTree<T> espejo(){
    	BinaryTree<T> mirrorTree = new BinaryTree<T>(this.getData());
    	
    	if (this.hasLeftChild()) mirrorTree.addRightChild(this.getLeftChild().espejo());
    	if (this.hasRightChild()) mirrorTree.addLeftChild(this.getRightChild().espejo());
 	   
    	return mirrorTree;
    }

	// 0<=n<=m
    public void entreNiveles(int n, int m){
		Queue<BinaryTree<T>> queue = new LinkedList<>();
		queue.add(this);
		int actualLevel = 0;
		
		while (!queue.isEmpty()) {
			int tamañoCola = queue.size();
			if (actualLevel >= n && actualLevel <= m) {
				for (int i = 0; i < tamañoCola; i++) {
					BinaryTree<T> node = queue.poll();
					System.out.println(node.getData() + " ");
					if (node.hasLeftChild()) queue.add(node.getLeftChild());
					if (node.hasRightChild()) queue.add(node.getRightChild());
				}
			} 
			actualLevel++;
		}
   }
	
    public void imprimirArbol() {
        if(this.hasLeftChild()) this.getLeftChild().imprimirArbol();
        System.out.print(this.getData() + " ");
        if(this.hasRightChild()) this.getRightChild().imprimirArbol();
    }
}

