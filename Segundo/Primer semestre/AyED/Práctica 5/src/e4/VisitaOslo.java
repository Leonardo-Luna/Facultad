package e4;

import java.util.*;
import archivos.*;

public class VisitaOslo {
	
	public List<String> paseoEnBici(Graph<String> lugares, String destino, int maxTiempo, List<String> lugaresRestringidos) {
		
		Vertex<String> ayuntamiento = lugares.search("Ayuntamiento");
		Vertex<String> vDestino = lugares.search(destino);
		List<String> camino = new LinkedList<String>();
		
		if(!lugares.isEmpty()) {
			
			if(ayuntamiento != null && vDestino != null) {
				
				boolean[] marcas = new boolean[lugares.getSize()];
				
				for(String s : lugaresRestringidos) {
					Vertex<String> v = lugares.search(s);
					if(v != null) {
						marcas[v.getPosition()] = true;
					}
				}
				
				this.dfs(ayuntamiento, vDestino, camino, marcas, lugares, maxTiempo);
				
			}
			
		}
		
		return camino;
		
	}
	
	private boolean dfs(Vertex<String> origen, Vertex<String> destino, List<String> camino, boolean[] marcas, Graph<String> grafo, int maxTiempo) {

		boolean seguir = true;
		marcas[origen.getPosition()] = true;
		camino.add(origen.getData());
		
		if(origen == destino) {
			
			seguir = false;
			
		} else {
			
			Iterator<Edge<String>> it = grafo.getEdges(origen).iterator();
			
			while(it.hasNext() && seguir) {
				
				Edge<String> e = it.next();
				Vertex<String> v = e.getTarget();
				int tiempo = e.getWeight();
				int j = v.getPosition();
				
				if(!marcas[j] && tiempo < maxTiempo) {
					
					seguir = this.dfs(v, destino, camino, marcas, grafo, maxTiempo-tiempo);
					
				}
				
			}
			
		}
		
		if(seguir) camino.remove(camino.size()-1);
		marcas[origen.getPosition()] = false;
		return seguir;
		
	}

}
