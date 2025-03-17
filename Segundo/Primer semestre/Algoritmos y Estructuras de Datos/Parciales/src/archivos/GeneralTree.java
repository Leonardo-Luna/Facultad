package archivos;

import java.util.LinkedList;
import java.util.List;

public class GeneralTree<T>{

	private T data;
	private List<GeneralTree<T>> children = new LinkedList<GeneralTree<T>>(); 

	public GeneralTree() {
		
	}
	public GeneralTree(T data) {
		this.data = data;
	}

	public GeneralTree(T data, List<GeneralTree<T>> children) {
		this(data);
		this.children = children;
	}	
	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public List<GeneralTree<T>> getChildren() {
		return this.children;
	}
	
	public void setChildren(List<GeneralTree<T>> children) {
		if (children != null)
			this.children = children;
	}
	
	public void addChild(GeneralTree<T> child) {
		this.getChildren().add(child);
	}

	public boolean isLeaf() {
		return !this.hasChildren();
	}
	
	public boolean hasChildren() {
		return !this.children.isEmpty(); //Aguanten los binarios
	}
	
	public boolean isEmpty() {
		return this.data == null && !this.hasChildren();
	}

	public void removeChild(GeneralTree<T> child) {
		if (this.hasChildren())
			children.remove(child);
	}
	
	private void PreOrderVoid(GeneralTree<Integer> a) {
		
		System.out.println(a.getData());
		
		for(GeneralTree<Integer> i : a.getChildren()) {
			
			PreOrderVoid(i);
			
		}
		
	}

	public void PreOrder(GeneralTree<Integer> a) {
		
		if(!a.isEmpty()) {
			PreOrderVoid(a);
		}
		
	}
	
	private void InOrderVoid(GeneralTree<Integer> a) {
		
		List<GeneralTree<Integer>> i = a.getChildren();
		if(a.hasChildren()) { 

			InOrderVoid(i.get(0));
			
		}
		
		System.out.println(a.getData());
		
		for(int j = 1; j < i.size(); j++) {
			
			InOrderVoid(i.get(j));
			
		}
		
	}
	
	public void InOrder(GeneralTree<Integer> a) {
		
		if(!a.isEmpty()) {
			InOrderVoid(a);
		}
		
	}
	
	private void PostOrderVoid(GeneralTree<Integer> a) {
		
		for(GeneralTree<Integer> i : a.getChildren()) {
			
			PostOrderVoid(i);
			
		}
		
		System.out.println(a.getData());
		
	}
	
	public void PostOrder(GeneralTree<Integer> a) {

		if(!a.isEmpty()) {
			PostOrderVoid(a);
		}
		
	}
	
	public void Traversal(GeneralTree<Integer> a) {
		
		GeneralTree<Integer> a2;
		Queue<GeneralTree<Integer>> q = new Queue<GeneralTree<Integer>>();
		
		q.enqueue(a);
		
		while(!q.isEmpty()) {
			
			a2 = q.dequeue();
			
			if(a2 != null) {
				System.out.println(a2.getData());
				for(GeneralTree<Integer> i : a2.getChildren()) {
					
					this.Traversal(i);
					
				}
				
			} else if(!q.isEmpty()) {
				q.enqueue(null);
			}
			
		}
		
	}
	
	private int CalcularNivel(T dato) {
		
		GeneralTree<T> aux;
		int nivel = 0;
		int actual;
		Queue<GeneralTree<T>> q = new Queue<GeneralTree<T>>();
		
		q.enqueue(this);
		while(!q.isEmpty()) {
			
			actual = q.size();
			
			for(int i = 0; i < actual; i++) {
				
				aux = q.dequeue();
				if(aux.getData().equals(dato)) {
					return nivel;
				}
				else {
					
					List<GeneralTree<T>> c = aux.getChildren();
					for(GeneralTree<T> child : c) {
						q.enqueue(child);
					}
					
				}
				
			}
			
			nivel++;
			
		}
		
		return -1;
		
	}
	
	private int CalcularAncho() {
		
		int actual;
		int max = -1;
		
		GeneralTree<T> aux;
		Queue<GeneralTree<T>> q = new Queue<GeneralTree<T>>();
		
		q.enqueue(this);
		while(!q.isEmpty()) {
			
			actual = q.size();
			
			if(actual > max) {
				max = actual;
			}
			
			for(int i = 0; i < actual; i++) {
				
				aux = q.dequeue();
					
				List<GeneralTree<T>> c = aux.getChildren();
				for(GeneralTree<T> child : c) {
					q.enqueue(child);
				}
				
			}
			
		}
		
		return max;
		
	}
	
	private int alturaHelper() {
		
		if(this.isLeaf()) {
			return 0;
		}
		else {
			
			int max = -1;
			
			for(GeneralTree<T> i : this.getChildren()) {
				
				int aux = i.alturaHelper();
				max = Math.max(max, aux);
				
			}
			
			return max+1;
			
		}
		
	}
	
	private GeneralTree<T> BuscarArbol(T a, T b) {
		
		GeneralTree<T> aux;
		Queue<GeneralTree<T>> q = new Queue<GeneralTree<T>>();
		
		q.enqueue(this);
		
		while(!q.isEmpty()) {
			
			aux = q.dequeue();
			
			if(aux.getData().equals(b)) {
				return new GeneralTree<T>();
			}
			else if(aux.getData().equals(a)) {
				return aux;
			}
			else {
				
				for(GeneralTree<T> i : aux.getChildren()) {
					
					q.enqueue(i);
					
				}
				
			}
			
		}
		
		return new GeneralTree<T>();
		
	}
	
	private boolean esAncestroHelper(GeneralTree<T> a, T b) {
		
		GeneralTree<T> aux;
		Queue<GeneralTree<T>> q = new Queue<GeneralTree<T>>();
		
		q.enqueue(a);
		
		while(!q.isEmpty()) {
			
			aux = q.dequeue();
			
			if(aux.getData().equals(b)) {
				
				return true;
				
			}
			else {
				
				for(GeneralTree<T> i : aux.getChildren()) {
					
					q.enqueue(i);
					
				}
				
			}
			
		}
		
		return false;
		
	}
	
	public boolean esAncestro(T a, T b) {
		
		if(this.isEmpty()) {
			return false;
		}
		else {
			
			GeneralTree<T> ancestro = BuscarArbol(a, b);
			
			if(ancestro.isEmpty()) {
				return false;
			}
			else {
				return esAncestroHelper(ancestro, b);
			}
		
		}
		
	}
	
	public int altura() {	 //1,58
		
		if(this.isEmpty()) {
			return -1;
		}
		else {
			return alturaHelper();
		}
		
	}
	
	public int nivel(T dato){
		
		if(this.isEmpty()) {
			return -1;
		}
		else {
			return CalcularNivel(dato);
		}
	  }

	public int ancho(){
		
		if(this.isEmpty()) {
			return 0;
		}
		else {
			return this.CalcularAncho();
		}
		
	}
}