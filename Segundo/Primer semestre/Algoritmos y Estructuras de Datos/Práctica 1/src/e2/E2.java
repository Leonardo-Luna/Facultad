package e2;

import java.util.Scanner;

public class E2 {

	public static void main(String[] args) {

		Scanner s = new Scanner(System.in); //Creo el objeto scanner
		System.out.println("Ingrese un valor:");
		int n = s.nextInt();
		
		while(n != 0) {
			int[] v = new int[n];
			v = Multiplos.calcular(n);
			
			for(int i = 0; i < n; i++) {
				
				System.out.println(v[i]);
				
			}
			
			System.out.println("Ingrese un valor:");
			n = s.nextInt(); //Leo un int de teclado
			
		}
		
		s.close();

	}

}
