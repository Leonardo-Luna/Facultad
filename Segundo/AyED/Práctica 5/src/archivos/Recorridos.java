package archivos;

import java.util.*;

public class Recorridos<T> {

	public List<T> dfs(Graph<T> grafo) {
		
		boolean[] marcas = new boolean[grafo.getSize()];
		List<T> lista = new LinkedList<T>();
		
		for(int i = 0; i<grafo.getSize(); i++) {
			
			dfs(i, grafo, lista, marcas);
			
		}
		
		return lista;
		
	}
	
	private void dfs(int i, Graph<T> grafo, List<T> lista, boolean[] marcas) {
		
		marcas[i] = true;
		Vertex<T> v = grafo.getVertex(i);
		lista.add(v.getData());
		List<Edge<T>> adj = grafo.getEdges(v);
		
		for(Edge<T> e : adj) {
			
			//Se podría optimizar guardando el getPosition en una variable int
			
			if(!marcas[e.getTarget().getPosition()]) {
				dfs(e.getTarget().getPosition(), grafo, lista, marcas);
			}
			
		}
		
	}
	
	public List<T> bfs(Graph<T> grafo) {
		
		List<T> lista = new LinkedList<T>();
		boolean[] marcas = new boolean[grafo.getSize()];
		
		for(int i = 0; i < grafo.getSize(); i++) {
			
			bfs(i, grafo, lista, marcas);
			
		}
		
		return lista;
		
	}
	
	private void bfs(int i, Graph<T> grafo, List<T> lista, boolean[] marcas) {

		Vertex<T> v;
		Queue<Vertex<T>> q = new Queue<Vertex<T>>();
		
		q.enqueue(grafo.getVertex(i));
		marcas[i] = true;
		
		while(!q.isEmpty()) {
			
			v = q.dequeue();
			lista.add(v.getData());
			
			List<Edge<T>> adj = grafo.getEdges(v);
			for(Edge<T> e : adj) {
				
				//Se podría optimizar con una variable int
				//int j = e.getTarget().getPosition();
				
				if(!marcas[e.getTarget().getPosition()]) {
					marcas[e.getTarget().getPosition()] = true;
					q.enqueue(e.getTarget());
				}
				
			}
			
		}
		
	}

}
