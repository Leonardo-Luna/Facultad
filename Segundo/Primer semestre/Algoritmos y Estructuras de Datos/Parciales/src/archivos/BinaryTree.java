package archivos;

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
	
	public void postorden() {
		
		if(this.hasLeftChild()) {
			this.getLeftChild().postorden();
		}
		if(this.hasRightChild()) {
			this.getRightChild().postorden();
		}
		
		System.out.println(this.getData());
		
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
		
		int nivel = 1;
		BinaryTree<T> ab = null;
		Queue<BinaryTree<T>> cola = new Queue<BinaryTree<T>>();
		cola.enqueue(this);
		cola.enqueue(null);
		while (!cola.isEmpty() && nivel <= m) {
			ab = cola.dequeue();
			
			if (ab != null) {
				
				if(nivel >= n && nivel <= m) {
					System.out.print(ab.getData() + "       ");
				}
				if (ab.hasLeftChild()) {
					cola.enqueue(ab.getLeftChild());
				}
				if (ab.hasRightChild()) {
					cola.enqueue(ab.getRightChild());
				}
				
			} else if (!cola.isEmpty()) {
				System.out.println(" ");
				cola.enqueue(null);
				nivel++;
			}
		}
		
	}
		
}

