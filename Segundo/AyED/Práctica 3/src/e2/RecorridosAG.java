package e2;

import java.util.*;

import e1_3_5.GeneralTree;
import e1_3_5.Queue;

public class RecorridosAG {
	
	private void numerosImparesMayoresQuePreOrdenVoid(GeneralTree<Integer> a, Integer n, List<Integer> lista) {
		
		if((a.getData() > n) && (a.getData() % 2 != 0)) {
			
			lista.add(a.getData());
			
		}
		
		for(GeneralTree<Integer> i : a.getChildren()) {
			
			numerosImparesMayoresQuePreOrdenVoid(i, n, lista);
			
		}
		
	}

	public List<Integer> numerosImparesMayoresQuePreOrden(GeneralTree<Integer> a, Integer n) {
		
		List<Integer> lista = new LinkedList<Integer>();
		
		numerosImparesMayoresQuePreOrdenVoid(a, n, lista);
		
		return lista;
		
	}
	
	private void numerosImparesMayoresQueInOrdenVoid(GeneralTree<Integer> a, Integer n, List<Integer> lista) {
		
		List<GeneralTree<Integer>> i = a.getChildren();
		if(a.hasChildren()) { 

			numerosImparesMayoresQueInOrdenVoid(i.get(0), n, lista);
			
		}
		
		Integer dato = a.getData();
		
		if((dato > n) && (dato % 2 != 0)) {
			
			lista.add(dato);
			
		}
		
		for(int j = 1; j < i.size(); j++) {
			
			numerosImparesMayoresQueInOrdenVoid(i.get(j), n, lista);
			
		}
		
	}
	
	public List<Integer> numerosImparesMayoresQueInOrden(GeneralTree<Integer> a, Integer n) {
		
		List<Integer> lista = new LinkedList<Integer>();
		
		numerosImparesMayoresQueInOrdenVoid(a, n, lista);
		
		return lista;
		
	}
	
	private void numerosImparesMayoresQuePostOrdenVoid(GeneralTree<Integer> a, Integer n, List<Integer> lista) {
		
		for(GeneralTree<Integer> i : a.getChildren()) {
			
			numerosImparesMayoresQuePostOrdenVoid(i, n, lista);
			
		}
		
		if((a.getData() > n) && (a.getData() % 2 != 0)) {
			
			lista.add(a.getData());
			
		}
		
	}
	
	public List<Integer> numerosImparesMayoresQuePostOrden(GeneralTree<Integer> a, Integer n) {
		
		List<Integer> lista = new LinkedList<Integer>();
		
		numerosImparesMayoresQuePostOrdenVoid(a, n, lista);
		
		return lista;
		
	}
	
	public List<Integer> numerosImparesMayoresQuePorNiveles(GeneralTree<Integer> a, Integer n) {
		
		List<Integer> lista = new LinkedList<Integer>();
		GeneralTree<Integer> aux;
		
		Queue<GeneralTree<Integer>> q = new Queue<GeneralTree<Integer>>();
		
		q.enqueue(a);
		while(!q.isEmpty()) {
			
			aux = q.dequeue();
			
			Integer dato = aux.getData();
			if((dato > n) && (dato % 2 != 0)) {
				
				lista.add(dato);
				
			}
			List<GeneralTree<Integer>> c = aux.getChildren();
			for(GeneralTree<Integer> child : c) {
				q.enqueue(child);
			}
			
		}
		
		
		return lista;
		
	}
	
}
