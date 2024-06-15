package parcial6;

import java.util.*;
import archivos.GeneralTree;

public class Parcial {

	public static void main(String[] args){
		
		List <GeneralTree<Integer>> subArb1 = new LinkedList <GeneralTree<Integer>>();
        subArb1.add(new GeneralTree<Integer>(1));
        subArb1.add(new GeneralTree<Integer>(2));
        GeneralTree<Integer> subA3 = new GeneralTree<Integer>(4, subArb1);
        List <GeneralTree<Integer>> subArb2 = new LinkedList <GeneralTree<Integer>>();
        
        List<GeneralTree<Integer>> hh = new LinkedList<GeneralTree<Integer>>();
        hh.add(new GeneralTree<Integer>(7));
        
        subArb2.add(new GeneralTree<Integer>(3, hh));
        subArb2.add(subA3);
        GeneralTree<Integer> a5 = new GeneralTree<Integer>(6, subArb2); 
        
        //a5.Traversal(a5);
        System.out.println("Es creciente el arbol 5: " + ParcialArboles.resolver(a5));
        
    }
	
}
