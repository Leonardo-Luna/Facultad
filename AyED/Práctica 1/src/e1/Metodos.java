package e1;

public class Metodos {
	
	public static void metodoFor(int a, int b) {
		
		for(int i=a; i<=b; i++) {
			
			System.out.println(i);
			
		}
		
	}
	
	public static void metodoWhile(int a, int b) {
		
		int i = a;
		while(i <= b) {
			
			System.out.println(i);
			i++;
			
		}
		
	}
	
	public static void metodoSinLoop(int a, int b) {
		
		if(a <= b) {
			
			System.out.println(a);
			Metodos.metodoSinLoop(a+1, b);
			
		}
		
	}

}
