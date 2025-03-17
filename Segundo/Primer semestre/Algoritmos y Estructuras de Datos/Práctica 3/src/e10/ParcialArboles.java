package e10;

import java.util.*;
import e1_3_5.GeneralTree;

public class ParcialArboles {
	
	private static void procesar(GeneralTree<Integer> arbol, int nivel, List<Integer> max, List<Integer> actual, ObjetoInt recorridoMax, int recorrido)
	{
		
		if(arbol.getData() == 1)
		{
			actual.add(arbol.getData());
			recorrido += arbol.getData()*nivel;
		}
		
		if(!arbol.isLeaf())
		{
			List<GeneralTree<Integer>> hijos = arbol.getChildren();
			for(GeneralTree<Integer> hActual : hijos)
			{
				procesar(hActual, nivel+1, max, actual, recorridoMax, recorrido);
			}
		}
		else if(recorrido > recorridoMax.getValor())
		{
			recorridoMax.setValor(recorrido);
			max.clear();
			max.addAll(actual);
			recorrido = 0;
		}
		
		if(arbol.getData() == 1)
		{
			actual.remove(actual.size()-1);
		}
		
	}

	public static List<Integer> resolver(GeneralTree<Integer> arbol)
	{
		
		List<Integer> max = new LinkedList<Integer>();
		List<Integer> actual = new LinkedList<Integer>();
		ObjetoInt recorridoMax = new ObjetoInt();
		
		procesar(arbol, 0, max, actual, recorridoMax, 0);
		
		return max;
		
	}
	
}
