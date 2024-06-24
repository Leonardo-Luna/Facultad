package e9;

import java.util.*;
import e1_3_5.GeneralTree;

public class ParcialArboles {
	
	private static boolean procesar(GeneralTree<Integer> arbol)
	{
		
		if(!arbol.isLeaf())
		{
			
			List<GeneralTree<Integer>> hijos = arbol.getChildren();
			int min = Integer.MAX_VALUE;
			boolean ok = true;
			Iterator<GeneralTree<Integer>> iterar = hijos.iterator();
			
			while((iterar.hasNext()) && (ok))
			{
				GeneralTree<Integer> dato = iterar.next();
				min = Math.min(min, dato.getData());
				ok = procesar(dato);
			}
			
			return ((arbol.getData() == min) && (ok));
			
		}
		
		return true;
		
	}
	
	public static boolean esDeSeleccion(GeneralTree<Integer> arbol)
	{
		
		return procesar(arbol);
		
	}

}
