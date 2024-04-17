package e7;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.Scanner;

public class TestArrayList {

	public static void main(String[] args) {

		Scanner s = new Scanner(System.in);
		
		ArrayList<Integer> numeros = new ArrayList<Integer>(); // a)
		LinkedList<Integer> numeros2 = new LinkedList<Integer>(); // b) (No hay diferencia)
		
		System.out.println("Ingresar numeros, corte en 0");
		int n = s.nextInt();
		while(n != 0)
		{
			numeros.add(n);
			numeros2.add(n);
			n = s.nextInt();
		}
		
		for(int i : numeros)
		{
			//System.out.println(i);
		}
		
		// c)
		System.out.println(numeros);
		
		// d(); // d)
		
		//boolean f = esCapicua(numeros); // f)
		//System.out.println(f);
		
		n = s.nextInt();
		List<Integer> sucesion = new LinkedList<Integer>();
		sucesion = EjerG(n); // g)
		System.out.println(sucesion);
		
		//invertirArrayList(sucesion);
		//System.out.println(sucesion);
		
		LinkedList<Integer> linked = new LinkedList<Integer>(sucesion);
		ArrayList<Integer> arrayL = new ArrayList<Integer>(sucesion);
		
		//int sumarLista = sumarLinkedList(linked);
		//System.out.println(sumarLista);
		
		ArrayList<Integer> listaOrdenada = new ArrayList<Integer>();
		listaOrdenada = combinarOrdenado(arrayL, numeros);
		System.out.println(listaOrdenada);
		
	}
	
	static void d() // d)
	{
		
		ArrayList<String> estudiantes = new ArrayList<String>();
		estudiantes.add("Leo");
		estudiantes.add("Pepe");
		estudiantes.add("José");
		
		ArrayList<String> estudiantesCopia = new ArrayList<String>();
		estudiantesCopia = estudiantes;
		
		System.out.println(estudiantes);
		System.out.println(estudiantesCopia);
		
		estudiantesCopia.set(0, "Juan");
		
		System.out.println(estudiantes);
		System.out.println(estudiantesCopia);
		
		Scanner s = new Scanner(System.in);
		String e = s.next();
		if(!estudiantes.contains(e)) {
			estudiantes.add(e);
		}
		
		System.out.println(estudiantes);
		
		//La lista copiada toma las referencias de los objetos, entonces al realizar un cambio
		//en una, se modifican las dos paralelamente.
		
		//.clone() devuelve la misma estructura pero vacia
		//lista1 = lista copia por referencia la lista original
		//ArrayList<String> estudiantesCopia = new ArrayList<String>(estudiantes); copia el contenido de la lista por valor
		
	}
	
	static boolean esCapicua(ArrayList<Integer> lista) {
		
		ArrayList<Integer> listaInversa = new ArrayList<Integer>(lista);
		Collections.reverse(listaInversa);
		
		if(lista.equals(listaInversa)) {
			return true;
		}
		else {
			return false;
		}	
	}
	
	static List<Integer> EjerG(int n) {
		
		List<Integer> s = new LinkedList<Integer>();
			
		if(n % 2 == 0) {
				
			s = EjerG((n/2));
				
		}
		else if (n != 1){
				
			s = EjerG((3*n+1));
				
		}
		
		s.add(0, n);
		return s;
		
	}

	static void invertirArrayList(List<Integer> lista) {
		
		ArrayList<Integer> l = new ArrayList<Integer>();
		int n;
		
		for(int i = 0; i < lista.size(); i++) {
			
			n = lista.get(i);
			l.add(0, n);
		
		}
		
		lista.clear();
		lista.addAll(l);
		
	}
	
	static int sumarLinkedList(LinkedList<Integer> lista) {
	
		if(lista.size() > 1) {
			
			lista.set(0, (lista.getFirst() + lista.getLast()));
			lista.removeLast();
			sumarLinkedList(lista);
			
		}

		int n = lista.getFirst();
		return n;
	}

	public static ArrayList<Integer> combinarOrdenado(ArrayList<Integer> lista1, ArrayList<Integer> lista2) {
		
		ArrayList<Integer> lista3 = new ArrayList<Integer>();
		
		for(int i : lista1) {
			lista3.add(i);
		}
		for(int i : lista2) {
			lista3.add(i);
		}
		
		Collections.sort(lista3);
		return lista3;
		
	}
	
}
