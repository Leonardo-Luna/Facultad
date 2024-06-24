package parcialReal;

import java.util.*;
import archivos.GeneralTree;
import archivos.Queue;

public class ParcialArboles {
	
	GeneralTree<Integer> arbol;
	
	public ParcialArboles(GeneralTree<Integer> a) {
		this.arbol = a;
	}
	
	public List<Integer> nivel(int num) {
		
		List<Integer> lista = new LinkedList<Integer>();
		
		GeneralTree<Integer> a2;
		Queue<GeneralTree<Integer>> q = new Queue<GeneralTree<Integer>>();
		
		q.enqueue(this.arbol);
		q.enqueue(null);
		
		boolean encontre = true;
		int cant = 0;
		
		while(!q.isEmpty() && encontre) {
			
			a2 = q.dequeue();
			
			if(a2 != null) {
				
				lista.add(a2.getData());
				
				for(GeneralTree<Integer> i : a2.getChildren()) {
					
					cant++;
					q.enqueue(i);
					
				}
				
			} else if(!q.isEmpty()) {
				
				if(cant/num != num) {
					q.enqueue(null);
					cant = 0;
					lista.clear();
				} else {
					encontre = false;
				}
				
			}
			
		}
		
		return lista;
		
	}

}
