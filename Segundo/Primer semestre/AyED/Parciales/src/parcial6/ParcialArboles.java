package parcial6;

import archivos.*;

public class ParcialArboles {
	
	public static boolean resolver(GeneralTree<Integer> arbol) {
		
		int max = 1;
		int cant = 0;
		
		GeneralTree<Integer> a2;
		Queue<GeneralTree<Integer>> q = new Queue<GeneralTree<Integer>>();
		
		q.enqueue(arbol);
		q.enqueue(null);
		
		while(!q.isEmpty()) {
			
			a2 = q.dequeue();
			
			if(cant > max) {
				return false;
			}
			
			if(a2 != null) {
				
				cant++;
				
				for(GeneralTree<Integer> i : a2.getChildren()) {
					q.enqueue(i);
				}
				
			} else if(!q.isEmpty()) {
				
				if(cant < max) {
					return false;
				}
			
				cant = 0;
				max++;
				q.enqueue(null);
				
			}
			 
		}
		
		return true;
		
	}

}
