package e9;

public class Main {

	public static void main(String[] args) {
		
		String c = "[}]";
		char[] cv = c.toCharArray();
		Queue<Character> cola = new Queue<Character>();
		
		for(char i : cv) {
			
			if(i == '{' || i == '[' || i == '(') {
				
				cola.enqueue(i);
				
			}
			else {
				
				cola.dequeue();
				
			}
			
		}
		
		if(cola.isEmpty()) {
			
			System.out.println("La cadena estaba balanceada");
			
		}
		else {
			
			System.out.println("La cadena no estaba balanceada");
			
		}

	}

}
