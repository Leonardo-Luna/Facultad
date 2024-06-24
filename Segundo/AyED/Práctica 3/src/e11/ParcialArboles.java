package e11;

import java.util.*;
import e1_3_5.GeneralTree;
import e1_3_5.Queue;

public class ParcialArboles {
	
	public static boolean resolver(GeneralTree<Integer> arbol)
	{

		List<GeneralTree<Integer>> lista = new LinkedList<GeneralTree<Integer>>();
		GeneralTree<Integer> aux;
		Queue<GeneralTree<Integer>> cola = new Queue<GeneralTree<Integer>>();
		
		cola.enqueue(arbol);
		int nodosActual = 1;
		int nodosAnteriores = 0;
		
		while(!cola.isEmpty())
		{
			
			if(nodosAnteriores+1 != nodosActual)
			{
				return false;
			}
			else
			{
				for(int i = 0; i < nodosActual; i++)
				{
					aux = cola.dequeue();
					lista = aux.getChildren();
					
					for(GeneralTree<Integer> c : lista)
					{
						cola.enqueue(c);
					}
					
				}
				
			}
			
			nodosAnteriores = nodosActual;
			nodosActual = cola.size();
			
		}
		
		return true;
		
	}

}
