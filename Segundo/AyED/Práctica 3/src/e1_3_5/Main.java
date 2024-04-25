package e1_3_5;

import java.util.*;

public class Main {

    public static void main(String[] args) {
        GeneralTree<Integer> a1 = new GeneralTree<Integer>(1);
        List<GeneralTree<Integer>> children2 = new LinkedList<GeneralTree<Integer>>();
        children2.add(new GeneralTree<Integer>(21));
        children2.add(new GeneralTree<Integer>(22));
        children2.add(new GeneralTree<Integer>(23));
        
        GeneralTree<Integer> a2 = new GeneralTree<Integer>(2, children2);
        List<GeneralTree<Integer>> children3 = new LinkedList<GeneralTree<Integer>>();
        children3.add(new GeneralTree<Integer>(31));
        children3.add(new GeneralTree<Integer>(32));
        
        GeneralTree<Integer> a3 = new GeneralTree<Integer>(3, children3);
        List<GeneralTree<Integer>> childen = new LinkedList<GeneralTree<Integer>>();
        childen.add(a1);childen.add(a2);childen.add(a3);
        
        GeneralTree<Integer> a = new GeneralTree<Integer>(11, childen);
        
        System.out.println("AlturaMax=" + a.altura());
        System.out.println("En que nivel esta el num 11? Nivel:" + a.nivel(11));
        System.out.println("En que nivel esta el num 3? Nivel:" + a.nivel(3));
        System.out.println("En que nivel esta el num 21? Nivel:" + a.nivel(21));
        System.out.println("Ancho=" + a.ancho());
        System.out.println("ES ANCESTRO 11 DE 2:" + a.esAncestro(11, 2));
        System.out.println("ES ANCESTRO 2 DE 11:" + a.esAncestro(2, 11));
        System.out.println("ES ANCESTRO 11 DE 21:" + a.esAncestro(11, 21));
        System.out.println("ES ANCESTRO 21 DE 11:" + a.esAncestro(21, 11));
          
    }

}
