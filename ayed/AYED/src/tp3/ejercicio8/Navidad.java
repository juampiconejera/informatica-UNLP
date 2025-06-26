package tp3.ejercicio8;

import tp3.ejercicio1.GeneralTree;

public class Navidad {
    private GeneralTree<Integer> ag;

    public Navidad(GeneralTree<Integer> ag) {
        this.ag = ag;
    }

    public String esAbetoNavidenio() {

        if (esAbetoNavidenio(ag)) {
            return "yes";
        } else {
            return "no";
        }
    }

    public boolean esAbetoNavidenio(GeneralTree<Integer> arbol) {
        int cantHojas = 0;
        
        for (GeneralTree<Integer> h : arbol.getChildren()) {
            if (h.isLeaf()) cantHojas++;
            else if (!esAbetoNavidenio(h)) return false; //Si es true, tengo que seguir evaluando el resto del arbol. Si da F, esta confirmado que no es abeto
        }
        return cantHojas >= 3;
    }
}
