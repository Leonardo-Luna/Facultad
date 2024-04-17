package e2;

public class Multiplos {

	public static int[] calcular(int n) {
		
		int[] v = new int[n];

		if(n < 1) {
			
			System.out.println("El numero ingresado debe ser >= 1");
			v = new int[1];
			
		} else {
			
			for(int i = 1; i <= n; i++) {
				
				v[i-1] = n*i;
				
			}
			
		}
		
		return v;
		
	}
	
}
