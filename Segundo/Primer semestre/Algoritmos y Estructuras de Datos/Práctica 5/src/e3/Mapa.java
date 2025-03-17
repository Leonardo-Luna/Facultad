package e3;

import java.util.*;
import archivos.*;

public class Mapa {
	
	private Graph<String> mapaCiudades;
	
	public Mapa(Graph<String> m) {
		this.mapaCiudades = m;
	}
	
	public List<String> devolverCamino(String ciudad1, String ciudad2) {
		
		Vertex<String> origen = mapaCiudades.search(ciudad1);
		Vertex<String> destino = mapaCiudades.search(ciudad2);
		List<String> camino = new LinkedList<String>();
		
		if(!this.mapaCiudades.isEmpty()) {
		
			if(origen != null && destino != null) {
				
				boolean[] marcas = new boolean[mapaCiudades.getSize()];
		
				dfs(camino, marcas, origen, destino);
				
			}
		
		}
		
		return camino;
		
	}
	
	private boolean dfs(List<String> camino, boolean[] marcas, Vertex<String> origen, Vertex<String> destino) {
		
		boolean seguir = true;
		marcas[origen.getPosition()] = true;
		List<Edge<String>> adj = this.mapaCiudades.getEdges(origen);
		
		camino.add(origen.getData());
		
		if(origen.getData() == destino.getData()) {
			return false;
		} else {
			
			Iterator<Edge<String>> it = adj.iterator();
			
			while(it.hasNext() && seguir) {
				
				Vertex<String> v = it.next().getTarget();
				int j = v.getPosition();
				
				if(!marcas[j]) {
					seguir = dfs(camino, marcas, v, destino);
				}
				
			}
			
		}
		
		if(seguir) camino.remove(camino.size()-1);
		marcas[origen.getPosition()] = false;
		return seguir;
		
	}
	
	public List<String> devolverCaminoExceptuando(String ciudad1, String ciudad2, List<String> ciudades) {
		
		Vertex<String> origen = this.mapaCiudades.search(ciudad1);
		Vertex<String> destino = this.mapaCiudades.search(ciudad2);
		List<String> camino = new LinkedList<String>();
		
		if(!this.mapaCiudades.isEmpty()) {
			
			if(origen != null && destino != null) {
				
				boolean[] marcas = new boolean[this.mapaCiudades.getSize()];
				
				for(String c : ciudades) {
					/* Se podría hacer mejor de esta manera:
					 * 
					 * Vertex<String> v = this.mapaCiudades.search(c);
					 * if(v != null) {
					 *		marcas[v.getPosition] = true;
					 * }
					 */
					marcas[this.mapaCiudades.search(c).getPosition()] = true;
				}
				
				this.dfsExceptuando(camino, origen, destino, marcas);
				
			}
			
		}
		
		return camino;
		
	}
	
	private boolean dfsExceptuando(List<String >camino, Vertex<String> origen, Vertex<String> destino, boolean[] marcas) {
		
		boolean seguir = true;
		marcas[origen.getPosition()] = true;
		camino.add(origen.getData());
		
		if(origen.getData() == destino.getData()) {
			return false;
		} else {
			
			Iterator<Edge<String>> it = this.mapaCiudades.getEdges(origen).iterator();
			
			while(it.hasNext() && seguir) {
				
				Vertex<String> v = it.next().getTarget();
				int j = v.getPosition();
				
				if(!marcas[j]) {
					seguir = this.dfsExceptuando(camino, v, destino, marcas);
				}		
			}
		}
		
		if(seguir) camino.remove(camino.size()-1);
		marcas[origen.getPosition()] = false;
		return seguir;
		
	}
	
	public List<String> caminoMasCorto(String ciudad1, String ciudad2) {
		
		Vertex<String> origen = this.mapaCiudades.search(ciudad1);
		Vertex<String> destino = this.mapaCiudades.search(ciudad2);
		List<String> camino = new LinkedList<String>();

		if(!this.mapaCiudades.isEmpty()) {
			
			if(origen != null && destino != null) {
				
				boolean[] marcas = new boolean[this.mapaCiudades.getSize()];
				dfsMasCorto(origen, destino, camino, new LinkedList<String>(), marcas, 0, Integer.MAX_VALUE);
				//Mando un número muy alto para calcular los mínimos
				
			}
			
		}
		
		return camino;
		
	}
	
	private int dfsMasCorto(Vertex<String> origen, Vertex<String> destino, List<String> camino, List<String> actual, boolean[] marcas, int act, int minimo) {
		
		marcas[origen.getPosition()] = true;
		actual.add(origen.getData());
		
		if(origen == destino) {
			
			if(act < minimo) {
				camino.clear();
				camino.addAll(actual);
				minimo = act;
			}
			
		} else {
		
			Iterator<Edge<String>> it = this.mapaCiudades.getEdges(origen).iterator();
			
			while(it.hasNext()) {
				
				Edge<String> e = it.next();
				Vertex<String> v = e.getTarget();
				int aux = act + e.getWeight();
				int j = v.getPosition();
				
				if(!marcas[j]) {
					minimo = dfsMasCorto(v, destino, camino, actual, marcas, aux, minimo);
				}
			}
		}
		
		actual.remove(actual.size()-1);
		marcas[origen.getPosition()] = false;
		return minimo;
		
	}

	public List<String> caminoSinCargarCombustible(String ciudad1, String ciudad2, int tanqueAuto) {
		
		Vertex<String> origen = this.mapaCiudades.search(ciudad1);
		Vertex<String> destino = this.mapaCiudades.search(ciudad2);
		List<String> camino = new LinkedList<String>();
		
		if(!this.mapaCiudades.isEmpty()) {
			
			if(origen != null && destino != null) {
				
				boolean[] marcas = new boolean[this.mapaCiudades.getSize()];
				this.dfsSinCargar(origen, destino, tanqueAuto, marcas, camino);
				
			}
			
		}
		
		return camino;
		
	}
	
	private boolean dfsSinCargar(Vertex<String> origen, Vertex<String> destino, int tanqueAuto, boolean[] marcas, List<String> camino) {
		
		boolean seguir = true;
		camino.add(origen.getData());
		marcas[origen.getPosition()] = true;
		
		if(origen == destino)
		{
			
			return false;
			
		} else {
			
			Iterator<Edge<String>> it = this.mapaCiudades.getEdges(origen).iterator();
			
			while(it.hasNext() && seguir) {
				
				Edge<String> e = it.next();
				Vertex<String> v = e.getTarget();
				int j = v.getPosition();
				
				if(!marcas[j] && e.getWeight() < tanqueAuto) {
					seguir = this.dfsSinCargar(v, destino, tanqueAuto-e.getWeight(), marcas, camino);
				}
				
			}
			
		}
		
		if(seguir) camino.remove(camino.size()-1);
		marcas[origen.getPosition()] = false;
		return seguir;
		
	}

	public List<String> caminoConMenorCargaDeCombustible(String ciudad1, String ciudad2, int tanqueAuto) {
		
		Vertex<String> origen = this.mapaCiudades.search(ciudad1);
		Vertex<String> destino = this.mapaCiudades.search(ciudad2);
		List<String> camino = new LinkedList<String>();
		
		if(!this.mapaCiudades.isEmpty()) {
			
			if(origen != null && destino != null) {
				
				boolean[] marcas = new boolean[this.mapaCiudades.getSize()];
				dfsMenorCarga(origen, destino, marcas, camino, new LinkedList<String>(), tanqueAuto, tanqueAuto, Integer.MAX_VALUE, 0);
				
			}
			
		}
		
		return camino;
		
	}
	
	private int dfsMenorCarga(Vertex<String> origen, Vertex<String> destino, boolean[] marcas, List<String> camino, List<String> caminoAct, int tanqueAuto, int act, int min, int cargas) {
		
		caminoAct.add(origen.getData());
		marcas[origen.getPosition()] = true;
		
		if(origen == destino) {
			
			if(cargas < min) {
				
				camino.clear();
				camino.addAll(caminoAct);
				min = cargas;
				
			}
			
		} else {
			
			Iterator<Edge<String>> it = this.mapaCiudades.getEdges(origen).iterator();
			
			while(it.hasNext()) {
				
				Edge<String> e = it.next();
				Vertex<String> v = e.getTarget();
				int j = v.getPosition();
				int peso = e.getWeight();
				
				if(!marcas[j] && peso < act) {
					
					min = this.dfsMenorCarga(v, destino, marcas, camino, caminoAct, tanqueAuto, act-peso, min, cargas);
					
				} else if(!marcas[j] && tanqueAuto > peso) {
					
					min = this.dfsMenorCarga(v, destino, marcas, camino, caminoAct, tanqueAuto, tanqueAuto-peso, min, ++cargas);
					
				}
				
			}
			
		}
		
		caminoAct.remove(caminoAct.size()-1);
		marcas[origen.getPosition()] = false;
		return min;
		
	}
	
}
