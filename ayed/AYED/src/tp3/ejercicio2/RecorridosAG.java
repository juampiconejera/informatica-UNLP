package tp3.ejercicio2;
import tp3.ejercicio1.*;
import java.util.*;
import tp1.ejercicio8.Queue;

public class RecorridosAG {
	 public List<Integer> numerosImparesMayoresQuePreOrden (GeneralTree <Integer> a, Integer n){
		 List<Integer> listReturn = new LinkedList<Integer>();
		 if(a.isEmpty()) return listReturn;
		 numerosImparesMayoresQueRecurPre(a, n, listReturn);
		 return listReturn;
	 }
	 private void numerosImparesMayoresQueRecurPre(GeneralTree<Integer> a, Integer n, List<Integer> listReturn) {
		 int dato = a.getData();
		 if((dato>n)&&(dato%2==1)) {
			 listReturn.add(dato);
		 }
		 List <GeneralTree<Integer>> children = a.getChildren();
		 for(GeneralTree<Integer> child : children) {
			 numerosImparesMayoresQueRecurPre(child, n, listReturn);
		 }
	 }
	
	 public List<Integer> numerosImparesMayoresQuePostOrden (GeneralTree <Integer> a, Integer n){
		 List<Integer> listReturn = new LinkedList<Integer>();
		 if(a.isEmpty()) return listReturn;
		 numerosImparesMayoresQueRecurPost(a, n, listReturn);
		 return listReturn;
	 }
	 private void numerosImparesMayoresQueRecurPost(GeneralTree<Integer> a, Integer n, List<Integer> listReturn) {
		 List <GeneralTree<Integer>> children = a.getChildren();
		 for(GeneralTree<Integer> child : children) {
			 numerosImparesMayoresQueRecurPost(child, n, listReturn);
		 }
		 int dato = a.getData();
		 if((dato>n)&&(dato%2==1)) {
			 listReturn.add(dato);
		 }
	 }

     public List<Integer> numerosImparesMayoresQueInOrden(GeneralTree<Integer> a, Integer n){
        List<Integer> listReturn = new LinkedList<Integer>();
		 if(a.isEmpty()) return listReturn;
		 numerosImparesMayoresQueRecurIn(a, n, listReturn);
		 return listReturn;
     }
     private void numerosImparesMayoresQueRecurIn(GeneralTree<Integer> a, Integer n, List<Integer> listReturn){
        List<GeneralTree<Integer>> children = a.getChildren();
        Iterator<GeneralTree<Integer>> it = children.iterator();
        //HI
        if (it.hasNext()) {
        	numerosImparesMayoresQueRecurIn(it.next(), n, listReturn);
        }
        //nodo actual
        if (a.getData() > n && a.getData()%2 ==1) {
            listReturn.add(a.getData());
        }
        //HD
        while (it.hasNext()) {
            numerosImparesMayoresQueRecurIn(it.next(),n,listReturn);
        }
     }
    public List<Integer> numerosImparesMayoresQuePorNiveles(GeneralTree <Integer> a, Integer n){
        List<Integer> listReturn = new LinkedList<Integer>();
        if(a.isEmpty()) return listReturn;
        numerosImparesMayoresQueRecurPorNiveles(a, n, listReturn);
        return listReturn;
    }
    private void numerosImparesMayoresQueRecurPorNiveles(GeneralTree<Integer> a, Integer n, List<Integer> listReturn){
        Queue<GeneralTree<Integer>> cola = new Queue<>();
        GeneralTree<Integer> aux = new GeneralTree<>();
        cola.enqueue(a);

        while(!cola.isEmpty()){     //mientras la lista no este vacia, desencolamos y chequeamos si el valor actual se debe agregar a la lista de retorno.
            aux = cola.dequeue();
            if (aux.getData() > n && aux.getData()%2==1){
                listReturn.add(aux.getData());
            }
            List<GeneralTree<Integer>> listAux = aux.getChildren();     //encolamos a los hijos por niveles en una lista.
            for(GeneralTree<Integer> child:listAux){
                cola.enqueue(child);
            }
        }
    }
}