package parcial5;

import java.util.*;

import archivos.GeneralTree;

public class ParcialArboles {
	
	private static void buscarMaximo(GeneralTree<Integer> a, LinkedList<Integer> cA, LinkedList<Integer> cM, objMax o, int cActual, int nivel) {
		
		if(a.getData() == 1) {
			cA.add(a.getData());
			cActual += a.getData() * nivel;
		}
		
		if(a.hasChildren()) {
			
			for(GeneralTree<Integer> i : a.getChildren()) {
				buscarMaximo(i, cA, cM, o, cActual, ++nivel);
			}
			
		} else if(cActual > o.getCM()) {
			o.setCM(cActual);
			cM.clear();
			cM = new LinkedList<Integer>(cA);
		}
		
		if(a.getData() == 1) {
			cA.removeLast();
		}
		
		
	}
	
	public static List<Integer> resolver(GeneralTree<Integer> arbol) {
		
		LinkedList<Integer> caminoActual = new LinkedList<Integer>();
		LinkedList<Integer> caminoMaximo = new LinkedList<Integer>();
		
		objMax o = new objMax(0);
		int cActual = 0;
		
		if(!arbol.isEmpty()) {
			
			buscarMaximo(arbol, caminoActual, caminoMaximo, o, cActual, 0);
			System.out.println(o.getCM());
		}
		
		return caminoMaximo;
		
	}

}
