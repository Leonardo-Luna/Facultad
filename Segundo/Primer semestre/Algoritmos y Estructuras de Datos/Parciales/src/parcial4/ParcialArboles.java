package parcial4;

import archivos.GeneralTree;
import archivos.Queue;

public class ParcialArboles {
	
	private static boolean calcular(GeneralTree<Integer> a) {
		
		int min;
		boolean ok = true;
		GeneralTree<Integer> a2;
		Queue<GeneralTree<Integer>> cola = new Queue<GeneralTree<Integer>>();
		
		cola.enqueue(a);
		cola.enqueue(null);
		
		while(!cola.isEmpty() && ok) {

			a2 = cola.dequeue();
			
			if(a2 != null) {
				
				min = Integer.MAX_VALUE;
				
				for(GeneralTree<Integer> i : a2.getChildren()) {
					
					cola.enqueue(i);
					min = Math.min(i.getData(), min);
					
				}
				
				if(!a2.isLeaf() && min != a2.getData()) {
					ok = false;
				}
				
			} else if(!cola.isEmpty()) {
				cola.enqueue(null);
			}
			
		}
		
		return true;
		
		
	}
	
	public static boolean esDeSeleccion(GeneralTree<Integer> arbol) {
		
		if(!arbol.isEmpty()) {
			
			return calcular(arbol);
			
		} else {
			return false;
		}
		
	}

}
