package tp5.ejercicio4;

import tp5.ejercicio1.*;
import java.util.*;

public class VisitaOslo {
	public List<String> paseoEnBici(Graph<String> lugares, String destino, int maxTiempo, List<String> restringidos) {
		List<String> camino = new LinkedList<>();
		if (!lugares.isEmpty()) {
			Vertex verticeAyuntamiento = lugares.search("Ayuntamiento");
			Vertex vertice = lugares.search(destino);
			if (verticeAyuntamiento != null && vertice != null) {
				boolean[] marca = new boolean[lugares.getSize()];
				marcarRestringidos(lugares, restringidos, marca);
				dfs(lugares, verticeAyuntamiento, vertice, camino, marca, maxTiempo);
			}
		}
		return camino;
	}

	private void marcarRestringidos(Graph<String> lugares, List<String> restringidos, boolean[] marca) {
		for (String l : restringidos) {
			Vertex<String> v = lugares.search(l);
			if (v != null) {
				marca[v.getPosition()] = true;
			}
		}
	}
	
	private boolean dfs(Graph<String> lugares, Vertex<String> origen, Vertex<String> destino, List<String> camino, boolean[] marca, int t) {
		boolean ok = false;
		marca[origen.getPosition()] = true;
		camino.add(origen.getData());
		if (origen == destino) {
			return true;
		} else {
			List<Edge<String>> adyacentes = lugares.getEdges(origen);
			Iterator<Edge<String>> it = adyacentes.iterator();
			while (it.hasNext() && !ok) {
				Edge<String> v = it.next();
				int j = v.getTarget().getPosition();
				if (!marca[j] && t - v.getWeight() >= 0) {
					ok = dfs(lugares, v.getTarget(), destino, camino, marca, t);
				}
			}
		}
		if (!ok) {
			camino.remove(camino.size()-1);
		}
		marca[origen.getPosition()] = false;
		return ok;
	}
}
