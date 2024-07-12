package e5;

import java.util.*;
import archivos.*;
import archivos.Queue;

public class QuedateEnCasa {
	
	public QuedateEnCasa() {
		
	}
	
	public List<Persona> calcularLista(Graph<Persona> grafo, String nombre, int separacion) {
		
		Persona empleado = this.buscarEmpleado(grafo, nombre);
		Vertex<Persona> e = grafo.search(empleado);
		List<Persona> lista = new LinkedList<Persona>();

		if(!grafo.isEmpty()) {
			
			if(e != null) { 
				
				boolean[] marcas = new boolean[grafo.getSize()];
				this.dfs(grafo, e, marcas, separacion, lista);
				
			}
			
		}
		
		return lista;

	}
	
	private Persona buscarEmpleado(Graph<Persona> grafo, String nombre) {
		
		Persona p = null;
		List<Vertex<Persona>> l = grafo.getVertices();
		Iterator<Vertex<Persona>> it = l.iterator();
		boolean seguir = true;
		
		while(it.hasNext() && seguir) {
			
			Vertex<Persona> v = it.next();
			if(v.getData().getNombre().equals(nombre)) {
				p = v.getData();
				seguir = false;
			}
			
		}
		
		return p;
		
	}
	
	private void dfs(Graph<Persona> grafo, Vertex<Persona> e, boolean[] marcas, int separacion, List<Persona> lista) {
		
		boolean seguir = true;
		marcas[e.getPosition()] = true;
 
		if(!e.getData().getEsEmpleado() && !e.getData().getCobro()) {
			if(!lista.contains(e.getData())) {
				lista.add(e.getData());
			}
		}
		
		if(separacion > 0 && lista.size() <= 40) {
			
			Iterator<Edge<Persona>> it = grafo.getEdges(e).iterator();
	
			while(it.hasNext() && seguir) {
				
				Edge<Persona> arista = it.next();
				Vertex<Persona> v = arista.getTarget();
				int j  = v.getPosition();
					
				if(!marcas[j] && !v.getData().getEsEmpleado()) {
						
					this.bfs(grafo, v, marcas, --separacion, lista);
						
				}
				
			}
			
		}
		
		marcas[e.getPosition()] = false;
		
	}
	
	private void bfs(Graph<Persona> grafo, Vertex<Persona> e, boolean[] marcas, int separacion, List<Persona> lista) {
		
		Queue<Vertex<Persona>> q = new Queue<Vertex<Persona>>();
		Vertex<Persona> v;
		int grado = 0;
		
		q.enqueue(e);
		q.enqueue(null);
		marcas[e.getPosition()] = true;
		
		while(!q.isEmpty() && lista.size() <= 40) {
			
			v = q.dequeue();
			
			if(v != null) {
				
				grado++;
				List<Edge<Persona>> adj = grafo.getEdges(v);
				for(Edge<Persona> edge : adj) {
	
					if(!marcas[edge.getTarget().getPosition()] && grado <= separacion) {
						marcas[edge.getTarget().getPosition()] = true;
						q.enqueue(edge.getTarget());
						
						if(!v.getData().getCobro() && !v.getData().getEsEmpleado()) {
							lista.add(v.getData());
						}
					
					}
					
				}
				
			} else if(!q.isEmpty()) {
				grado--;
				q.enqueue(null);
			}
			
		}
		
	}

}
