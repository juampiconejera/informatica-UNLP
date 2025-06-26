package tp3.ejercicio7;

import java.util.*;
import tp3.ejercicio1.GeneralTree;

public class Caminos {
    private GeneralTree<Integer> ag;

    public Caminos(GeneralTree<Integer> ag) {
        this.ag = ag;
    }

    public List<Integer> caminoAHojaMasLejana () {
        List<Integer> listAct = new ArrayList<>();
        if (ag.isEmpty()) return listAct;

        List<Integer> listMax = new ArrayList<>();
        caminoAHojaMasLejana(ag,listAct,listMax);
        return listMax;
    }

    private void caminoAHojaMasLejana (GeneralTree<Integer> arbol, List<Integer> listAct, List<Integer> listMax) {
        listAct.add(arbol.getData());

        if (arbol.isLeaf() && listAct.size() > listMax.size()) {
            listMax.clear();
            listMax.addAll(listAct);
        } else {
            for (GeneralTree<Integer> h : arbol.getChildren()) {
                caminoAHojaMasLejana(h, listAct, listMax);
            }
        }
        listAct.remove(listAct.size() - 1);
    }
}