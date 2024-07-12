package e5;

import archivos.*;
import archivos.adjList.*;
import java.util.*;

public class Main {

	public static void main(String[] args) {
		
		Graph<Persona> grafo = new AdjListGraph<>();
        Vertex v1 = grafo.createVertex(new Persona("Matias", "AAA", true, true));
        Vertex v2 = grafo.createVertex(new Persona("Julian", "BBB", false, false));
        Vertex v3 = grafo.createVertex(new Persona("Francisco", "CCC", false, false));
        Vertex v4 = grafo.createVertex(new Persona("Valentin", "DDD", false, false));
        Vertex v5 = grafo.createVertex(new Persona("Omar", "EEE", true, false));
        Vertex v6 = grafo.createVertex(new Persona("Rosana", "FFF", true, false));
        Vertex v7 = grafo.createVertex(new Persona("Maria", "GGG", false, false));
        Vertex v8 = grafo.createVertex(new Persona("Sandra", "HHH", true, false));
        Vertex v9 = grafo.createVertex(new Persona("Matheo", "III", false, false));
        
        grafo.connect(v1, v2);
        grafo.connect(v2, v1);
        grafo.connect(v2, v3);
        grafo.connect(v3, v2);
        
        grafo.connect(v1, v9);
        grafo.connect(v9, v1);
        grafo.connect(v9, v8);
        grafo.connect(v8, v9);
        
        grafo.connect(v1, v4);
        grafo.connect(v4, v1);
        grafo.connect(v1, v6);
        grafo.connect(v6, v1);
        grafo.connect(v4, v5);
        grafo.connect(v5, v4);
        grafo.connect(v5, v7);
        grafo.connect(v7, v5);
        
        
        QuedateEnCasa banco = new QuedateEnCasa();
        
        //System.out.println(banco.carteraJubilados(grafo, "Matias", 1, 40));
        List<Persona> lista = (banco.calcularLista(grafo, "Matias", 2));
        
        for(Persona p : lista) {
        	System.out.println(p);
        }
        
        //System.out.println(banco.carteraJubilados(grafo, "Matias", 3, 40));
        
        //System.out.println(banco.carteraJubilados(grafo, "Rosana", 2, 40));
        
        //System.out.println(banco.carteraJubilados(grafo, "Matias", 2, 1));
		
	}
	
}
