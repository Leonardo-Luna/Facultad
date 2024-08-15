package parcialGrafos;

import java.util.*;
import archivos.*;
import archivos.Queue;
import archivos.adjList.*;

public class parcialGrafos {
	
	public parcialGrafos() {
		
	}
	
    public Tupla nivelPopularidad(Graph<String> red, String usuario, int distancia, int umbral) {
        if(!red.isEmpty()) {
            Vertex<String> origen = red.search(usuario);
            Tupla t = new Tupla();
            if(origen!=null) {
                this.bfs(red, origen, distancia, t, umbral); 
                return t;
            } 
        }
        return null;
    }

private void bfs(Graph<String> red, Vertex<String> origen,int distancia, Tupla t, int umbral) {
    int cant = 0;
    int grado = 1;
    Vertex<String> v;
    Queue<Vertex<String>> cola = new Queue<Vertex<String>>();
    boolean[] marcas = new boolean[red.getSize()];
    cola.enqueue(origen);
    cola.enqueue(null);
    while(!cola.isEmpty() && grado <= distancia) {
        v = cola.dequeue();
        if(v != null) {
            Iterator<Edge<String>> it = red.getEdges(v).iterator();
            while(it.hasNext()) {
                Vertex<String> v2 = it.next().getTarget();
                if(!marcas[v2.getPosition()]) {
                    marcas[v2.getPosition()] = true;
                    cola.enqueue(v);
                    if(grado == distancia) {cant++;};
                }
            }
        } else if (!cola.isEmpty()) {
            grado++;
            cola.enqueue(null);
        }
    }
    
    t.setCantidad(cant);
    if(cant >= umbral) {t.setEsPopular(true);} else {t.setEsPopular(false);}

	}

public static void main(String args[]) {
	
    Graph<String> grafo = new AdjListGraph<String>();
    Vertex<String> v1 = grafo.createVertex("Lionel");
    Vertex<String> v2 = grafo.createVertex("Rodrigo");
    Vertex<String> v3 = grafo.createVertex("Ángel");
    Vertex<String> v4 = grafo.createVertex("Emiliano");
    Vertex<String> v5 = grafo.createVertex("Julián");
    Vertex<String> v6 = grafo.createVertex("Diego");
    Vertex<String> v7 = grafo.createVertex("Lautaro");
    Vertex<String> v8 = grafo.createVertex("Enzo");
    
    grafo.connect(v1, v2);
    grafo.connect(v2, v1);
    
    grafo.connect(v1, v3);
    grafo.connect(v3, v1);
    
    grafo.connect(v2, v4);
    grafo.connect(v4, v2);
    
    grafo.connect(v2, v5);
    grafo.connect(v5, v2);
    
    grafo.connect(v3, v5);
    grafo.connect(v5, v3);
    
    grafo.connect(v3, v6);
    grafo.connect(v6, v3);
    
    grafo.connect(v6, v7);
    grafo.connect(v7, v6);
    
    grafo.connect(v5, v7);
    grafo.connect(v7, v5);
    
    grafo.connect(v6, v8);
    grafo.connect(v8, v6);
    
    grafo.connect(v4, v8);
    grafo.connect(v8, v4);
    
    grafo.connect(v4, v7);
    grafo.connect(v7, v4);
    
    parcialGrafos p = new parcialGrafos();
    
    System.out.println(p.nivelPopularidad(grafo, "Lionel", 2, 3));
    System.out.println(p.nivelPopularidad(grafo, "Lionel", 1, 3));
    
    }

}

