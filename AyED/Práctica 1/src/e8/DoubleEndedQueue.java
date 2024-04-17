package e8;

public class DoubleEndedQueue<T> extends Queue<T> {

	public void enqueueFirst(T dato) {
		
		Queue<T> aux = new Queue<T>();
		
		while(!super.isEmpty()) {
			aux.enqueue(super.dequeue());
		}
		
		super.enqueue(dato);
		
		while(!aux.isEmpty()) {
			super.enqueue(aux.dequeue());
		}
	}
	
}
