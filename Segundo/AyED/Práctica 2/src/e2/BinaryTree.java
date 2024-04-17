package e2;

public class BinaryTree <T> {
	
	private T data;
	private BinaryTree<T> leftChild;   
	private BinaryTree<T> rightChild; 

	
	public BinaryTree() {
		super();
	}

	public BinaryTree(T data) {
		this.data = data;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
	/**
	 * Preguntar antes de invocar si hasLeftChild()
	 * @return
	 */
	public BinaryTree<T> getLeftChild() {
		return leftChild;
	}
	/**
	 * Preguntar antes de invocar si hasRightChild()
	 * @return
	 */
	public BinaryTree<T> getRightChild() {
		return this.rightChild;
	}

	public void addLeftChild(BinaryTree<T> child) {
		this.leftChild = child;
	}

	public void addRightChild(BinaryTree<T> child) {
		this.rightChild = child;
	}

	public void removeLeftChild() {
		this.leftChild = null;
	}

	public void removeRightChild() {
		this.rightChild = null;
	}

	public boolean isEmpty(){
		return (this.isLeaf() && this.getData() == null);
	}

	public boolean isLeaf() {
		return (!this.hasLeftChild() && !this.hasRightChild());

	}
		
	public boolean hasLeftChild() {
		return this.leftChild!=null;
	}

	public boolean hasRightChild() {
		return this.rightChild!=null;
	}
	
	@Override
	public String toString() {
		return this.getData().toString();
	}
	
	public void preorden() {
		
		System.out.println(this.getData());
		
		if(this.hasLeftChild()) {
			this.getLeftChild().preorden();
		}
		if(this.hasRightChild()) {
			this.getRightChild().preorden();
		}
		
	}
	
	public int contarHojas() {
		
		if(this.isLeaf()) {
			return 1;
		}
		
		int contIzq = 0;
		int contDer = 0;
		
		if(this.hasLeftChild()) {
			contIzq = this.getLeftChild().contarHojas();
		}
		if(this.hasRightChild()) {
			contDer = this.getRightChild().contarHojas();
		}
		
		return (contIzq + contDer);
		
	}
	
	public BinaryTree<T> espejo() {
		
		if(!this.isLeaf()) {
			
			BinaryTree<T> arbolEspejo = new BinaryTree<T>(this.getData());
			
			if(this.hasLeftChild()) {
				
				BinaryTree<T> izq = this.getLeftChild();
				this.getLeftChild().espejo();
				arbolEspejo.addRightChild(izq);
				
			}
			if(this.hasRightChild()) {
				
				BinaryTree<T> der = this.getRightChild();
				this.getRightChild().espejo();
				arbolEspejo.addLeftChild(der);
				
			}
			return arbolEspejo;
			
		}
		else {
			
			return new BinaryTree<T>(this.getData());
			
		}
		
	}

	// 0<=n<=m
	public void entreNiveles(int n, int m){
		
		T v;
		Queue<T> cola = new Queue<T>();
		
		cola.enqueue(this.getData());
		while(!cola.isEmpty()) {
			
			v = cola.dequeue();
			System.out.println(v);
			
			if(this.hasLeftChild()) {
				cola.enqueue(this.getLeftChild().getData());
			}
			if(this.hasRightChild()) {
				cola.enqueue(this.getRightChild().getData());
			}
			
		}
		
   }
		
}

