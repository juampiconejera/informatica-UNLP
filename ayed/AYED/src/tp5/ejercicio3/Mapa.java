package tp5.ejercicio3;

import tp5.ejercicio1.*;
import java.util.*;

public class Mapa {
	private Graph<String> mapaCiudades;
	
	public Mapa(Graph<String> mapa) {
		this.mapaCiudades = mapa;
	}
	
	public void setMapaCiudades(Graph<String> mapaCiudades) {
		this.mapaCiudades = mapaCiudades;
	}
	
	public Graph<String> getMapaCiudades() {
		return mapaCiudades;
	}
	
	public List<String> devolverCamino(String ciudad1, String ciudad2) {
		List<String> camino = new LinkedList<String>();
		if (!this.mapaCiudades.isEmpty()) {
			Vertex origen = this.mapaCiudades.search(ciudad1);
			Vertex destino = this.mapaCiudades.search(ciudad2);
			if (origen != null && destino != null) {
				devolverCamino(origen, destino, camino, new boolean[this.getMapaCiudades().getSize()]);
			}
		}
		return camino;
	}
	
	public boolean devolverCamino(Vertex<String> origen, Vertex<String> destino, List<String> camino, boolean[] marcas) {
		boolean encontre = false;
		marcas[origen.getPosition()] = true;
		camino.add(origen.getData());
		if (origen == destino) {
			return true;
		} else {
			List<Edge<String>> adyacentes = this.mapaCiudades.getEdges(origen);
			Iterator<Edge<String>> it = adyacentes.iterator();
			while (it.hasNext() && !encontre) {
				Vertex<String> v = it.next().getTarget();
				int j = v.getPosition();
				if (!marcas[j]) {
					encontre = devolverCamino(v, destino, camino, marcas);
				}
			}
		}
		if (!encontre) {
			camino.remove(camino.size() - 1);
		}
		marcas[origen.getPosition()] = false;
		return encontre;
	}
	
	public List<String> devolverCaminoExceptuando(String ciudad1, String ciudad2, List<String> ciudades) {
		List<String> camino = new LinkedList<String>();
		if (!this.mapaCiudades.isEmpty()) {
			Vertex origen = this.mapaCiudades.search(ciudad1);
			Vertex destino = this.mapaCiudades.search(ciudad2);
			if (origen != null && destino != null) {
				boolean[] marcas = new boolean[this.getMapaCiudades().getSize()];
				ciudadesProhibidas(ciudades, marcas);
				devolverCamino(origen, destino, camino, marcas);
			}
		}
		return camino;
	}
	
	private void ciudadesProhibidas(List<String> ciudadesRestringidas, boolean[] marcas) {
		for (String c: ciudadesRestringidas) {
			Vertex<String> v = mapaCiudades.search(c);
			if (v != null)
				marcas[v.getPosition()] = true;
		}
	}
	
	public List<String> caminoMasCorto(String ciudad1, String ciudad2) {
		List<String> camino = new LinkedList<>();
		if (!this.mapaCiudades.isEmpty()) {
			Vertex origen = mapaCiudades.search(ciudad1);
			Vertex destino = mapaCiudades.search(ciudad2);
			if ((origen != null) && (destino != null)) {
				caminoMasCorto(origen,destino,camino, new LinkedList<String>(), new boolean[this.getMapaCiudades().getSize()], 0, Integer.MAX_VALUE);;
			}
		}
		return camino;
	}
	
	private int caminoMasCorto(Vertex<String> origen, Vertex<String> destino, List<String> caminoMin, List<String> caminoAct, boolean[] marca, int total, int min) {
		marca[origen.getPosition()] = true;
		caminoAct.add(origen.getData());
		if (origen == destino && total < min) {
			caminoMin.removeAll(caminoMin);
			caminoMin.addAll(caminoAct);
			min = total;
		} else {
			List<Edge<String>> adyacente = this.mapaCiudades.getEdges(origen);
			Iterator<Edge<String>> it = adyacente.iterator();
			while (it.hasNext() && total < min) {
				Edge<String> v = it.next();
				int j = v.getTarget().getPosition();
				int aux = total + v.getWeight();
				if (!marca[j] && aux < min ) {
					min = caminoMasCorto(v.getTarget(), destino, caminoMin, caminoAct, marca, aux, min);
				}
			}
		}
		marca[origen.getPosition()] = false;
		caminoAct.remove(caminoAct.size() - 1);
		return min;
	}
	
	public List<String> caminoSinCargarCombustible(String ciudad1, String ciudad2, int tanqueAuto) {
		List<String> camino = new LinkedList<>();
		if (!this.mapaCiudades.isEmpty()) {
			Vertex origen = this.mapaCiudades.search(ciudad1);
			Vertex destino = this.mapaCiudades.search(ciudad2);
			if (origen != null && destino != null) {
				caminoSinCargarCombustible(origen,destino,camino, new boolean[this.mapaCiudades.getSize()], tanqueAuto);
			}
		}
		return camino;
	}
	
	private boolean caminoSinCargarCombustible(Vertex<String> origen, Vertex<String> destino, List<String> camino, boolean[] marca, int tanqueAuto) {
		boolean ok = false;
		marca[origen.getPosition()] = true;
		camino.add(origen.getData());
		if (origen == destino) {
			return true;
		} else {
			List<Edge<String>> adyacentes = this.mapaCiudades.getEdges(origen);
			Iterator<Edge<String>> it = adyacentes.iterator();
			while (it.hasNext() && !ok) {
				Edge<String> v = it.next();
				int j = v.getTarget().getPosition();
				if (!marca[j] && tanqueAuto - v.getWeight() > 0) {
					ok = caminoSinCargarCombustible(origen, destino, camino, marca, tanqueAuto);
				}
			}
		}
		if (!ok) {
			camino.remove(camino.size()-1);
		}
		marca[origen.getPosition()] = false;
		return ok;
	}
	
	public List<String> caminoConMenorCargaDeCombustible(String ciudad1, String ciudad2, int tanqueAuto) {
		List<String> camino = new LinkedList<>();
		if (!this.mapaCiudades.isEmpty()) {
			Vertex origen = this.mapaCiudades.search(ciudad1);
			Vertex destino = this.mapaCiudades.search(ciudad2);
			if (origen != null && destino != null) {
				caminoConMenorCargaDeCombustible(origen, destino, camino, new LinkedList<String>(), new boolean[this.getMapaCiudades().getSize()], tanqueAuto, tanqueAuto, 0, Integer.MAX_VALUE);
			}
		}
		return camino;
	}
	
	private int caminoConMenorCargaDeCombustible(Vertex<String> origen, Vertex<String> destino, List<String> caminoAct, List<String> caminoMin, boolean[] marca, int tanqueActual, int tanque, int recarga, int recargasMin) {
		marca[origen.getPosition()] = true;
		caminoAct.add(origen.getData());
		if (origen == destino && recarga < recargasMin) {
			caminoMin.removeAll(caminoMin);
			caminoMin.addAll(caminoAct);
			recargasMin = recarga;
		} else {
			List<Edge<String>> adyacentes = this.mapaCiudades.getEdges(origen);
			Iterator<Edge<String>> it = adyacentes.iterator();
			while (it.hasNext() && recarga < recargasMin) {
				Edge<String> v = it.next();
				int j = v.getTarget().getPosition();
				int distancia = v.getWeight();
				if (!marca[j]) {
					if (tanqueActual >= distancia) {
						recargasMin = caminoConMenorCargaDeCombustible(origen, destino, caminoAct, caminoMin, marca, tanqueActual - distancia, tanque, recarga, recargasMin);
					} else if (tanque >= distancia){
						recargasMin = caminoConMenorCargaDeCombustible(origen, destino, caminoAct, caminoMin, marca, tanque - distancia, tanque, recarga+1, recargasMin);
					}
				}
			}
		}
		marca[origen.getPosition()] = false;
		caminoAct.remove(caminoAct.size()-1);
		return recargasMin;
	}
}
