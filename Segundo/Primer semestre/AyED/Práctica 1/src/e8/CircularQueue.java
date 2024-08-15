package e8;

public class CircularQueue<T> extends Queue<T> {

	public T shift() {
		
		T aux;
		
		if(!this.isEmpty()) {
			aux = super.dequeue();
			super.enqueue(aux);
			return aux;
		}
		else {
			return null;
		}
		
		
	}
	
}
