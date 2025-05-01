/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package tp3.ejercicio6;
import tp3.ejercicio1.GeneralTree;
/**
 *
 * @author Juampi conejera
 */
public class RedDeAguaPotable {
    GeneralTree<Character> arbol;

    public RedDeAguaPotable(GeneralTree<Character> arbol) {
        this.arbol = arbol;
    }

    public double minimoCaudal (double caudal) {
        if (arbol.isEmpty()) return caudal;

        return minimoCaudalRec(arbol, caudal);
    }

    private double minimoCaudalRec (GeneralTree<Character> a, double caudal) {
        if (a.isLeaf()) {
            return caudal;
        }

        double particionCaudal = a.getChildren().size(); 
        double min = Double.MAX_VALUE;

        for (GeneralTree<Character> c : a.getChildren()) {
            double caudalSubarbol = minimoCaudalRec(c, caudal/particionCaudal);
            if (caudalSubarbol < min) min = caudalSubarbol;
        }
        return min;
    }
}
