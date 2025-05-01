package tp3.ejercicio4;


public class AreaEmpresa {
    private String id;
    private int tiempo;

    public AreaEmpresa(String id, int tiempo) {
        this.id = id;
        this.tiempo = tiempo;
    }

    public int getTiempo(){
        return this.tiempo;
    }
}
