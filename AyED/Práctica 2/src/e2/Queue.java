package e2;

import java.util.*;

public class Queue<T> extends Sequence {
	
	private List<T> q;
	
	public int size() {
		
		return q.size();
		
	}

	public boolean isEmpty() {
		
		return q.isEmpty();
		
	}
	
	public Queue() {
		
		q = new LinkedList<T>();
		
	}
	
	public void enqueue(T dato) {
		
		q.add(dato);
		
	}
	
	public T dequeue() {
		
		if(!q.isEmpty()) {
			return q.remove(0);
		}
		else {
			return null;
		}
		
	}
	
	public T head() {
		
		return q.get(0);
				
	}
	
	@Override
	public String toString() {
		
		String st = "";
		
		for(T i : q) {
			
			st = st + i + " ";
			
		}
		
		return st;
	}
	
}
