package e8;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		
		Queue<Integer> cola = new Queue<Integer>();
		Scanner s = new Scanner(System.in);
		
		for(int i = 0; i < 5; i++) {
			
			cola.enqueue(s.nextInt());
			
		}
		
		System.out.println(cola.toString());
		int a = cola.dequeue();
		System.out.println("de q " + a);
		a = cola.head();
		System.out.println("head " + a);
		System.out.println(cola.toString());

		DoubleEndedQueue<Integer> colaDF = new DoubleEndedQueue<Integer>();
		colaDF.enqueue(1);
		colaDF.enqueue(2);
		colaDF.enqueueFirst(3);
		
		System.out.println(colaDF.toString());

	}

}
