package tp3.ejercicio4;
/* El esquema de comunicación de una empresa está organizado en una estructura jerárquica, en donde cada nodo envía el mensaje a sus descendientes. Cada nodo posee el tiempo que tarda en transmitir el mensaje.
Se debe devolver el mayor promedio entre todos los valores promedios de los niveles.
 Para el ejemplo presentado, el promedio del nivel 0 es 14, el del nivel 1 es 16 y el del nivel 2 es 10. Por lo tanto, debe devolver 16.
 a) Indique y justifique qué tipo de recorrido utilizará para resolver el problema.
 b) Implementar en una clase AnalizadorArbol, el método con la siguiente firma:
 public double devolverMaximoPromedio (GeneralTree<AreaEmpresa>arbol)
 Donde AreaEmpresa es una clase que representa a un área de la empresa mencionada y que contiene
 la identificación de la misma representada con un String y una tardanza de transmisión de mensajes
 interna representada con int */
import java.util.*;
import tp1.ejercicio8.Queue;
import tp3.ejercicio1.GeneralTree;

public class AnalizarArbol {
    public double devolverMaximoPromedio (GeneralTree<AreaEmpresa> arbol) {
        if (arbol.isEmpty()) return 0;
        
        GeneralTree<AreaEmpresa> aux;
        Queue<GeneralTree<AreaEmpresa>> cola = new Queue<>();
        cola.enqueue(arbol);
        cola.enqueue(null);
        int suma = 0;
        int cantNodos = 0;
        double promedioMax = 0;
        double promedio = 0;

        while (!cola.isEmpty()) {
            aux = cola.dequeue();
            if (aux != null) {
                List<GeneralTree<AreaEmpresa>> listAux = aux.getChildren();
                cantNodos += listAux.size();
                for (GeneralTree<AreaEmpresa> c : listAux) {
                    cola.enqueue(c);
                    suma += c.getData().getTiempo();
                }
                if (cantNodos > 0) promedio = suma/cantNodos;
            } else if (!cola.isEmpty()) {
                cola.enqueue(null);
                if (promedio > promedioMax) promedioMax = promedio;
                cantNodos = 0;
                suma = 0; 
            }
        }
        return promedioMax;
    }
}
