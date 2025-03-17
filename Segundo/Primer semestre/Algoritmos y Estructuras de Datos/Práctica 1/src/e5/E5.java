package e5;

import java.util.Scanner;

public class E5 {

	public static void main(String[] args) {
		
		System.out.println("Ingrese la cantidad de numeros: ");
		Scanner s = new Scanner(System.in);
		int cantidad = s.nextInt();
		
		int[] v = new int[cantidad]; //Creo el vector necesario
		int n;
		
		System.out.println("Ingrese los " + cantidad + " numeros:");
		for(int i = 0; i<cantidad; i++) { //Lleno el vector
			
			n = s.nextInt();
			v[i] = n;
 			
		}
		
		//A
		
		int[] valores = Calcular.devolverArreglo(v);
		for(int i = 0; i < valores.length; i++) {
			System.out.println(valores[i]);
		}
		
		System.out.println(""); //B
		
		Objetin obj = new Objetin();
		Calcular.devolverObjeto(v, obj);
		
		System.out.println("Min: " + obj.getMinO() + " | Max: " + obj.getMaxO() + " | Promedio: " + obj.getPromedioO());
		
		System.out.println(""); //C
		
		Calcular a = new Calcular(v);
		System.out.println(a.getMax());
		System.out.println(a.getMin());
		System.out.println(a.getPromedio());
		
	}

}
