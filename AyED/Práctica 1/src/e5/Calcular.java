package e5;

public class Calcular {
	
	private int max = Integer.MIN_VALUE;
	private int min = Integer.MAX_VALUE;
	private int promedio = -1;
	
	public Calcular(int[] v) {
		
		for(int i = 0; i < v.length; i++) {
			
			this.promedio += v[i];
			
			if(v[i] >= this.max) {
				this.max = v[i];
			}
			
			if(v[i] <= this.min) {
				this.min = v[i];
			}
			
		}
		
		this.promedio = this.promedio/v.length;
		
	}
	
	public int getMax() {
		
		return this.max;
		
	}
	
	public int getMin() {
		
		return this.min;
		
	}
	
	public int getPromedio() {
		
		return this.promedio;
		
	}
	
	public static void devolverObjeto(int[] v, Objetin obj) {
		
		int ma = obj.getMaxO();
		int mi = obj.getMinO();
		int p = obj.getPromedioO();
		
		for(int i = 0; i < v.length; i++) {
			
			p += v[i];
			
			if(v[i] >= ma) {
				ma = v[i];
			}
			
			if(v[i] <= mi) {
				mi = v[i];
			}
			
		}
		
		p = p/v.length;
		
		obj.setMaxO(ma);
		obj.setMinO(mi);
		obj.setPromedioO(p);
		
	}

	public static int[] devolverArreglo(int[] v) {
		
		int min = Integer.MAX_VALUE;
		int max = Integer.MIN_VALUE;
		int promedio = -1;
		int cantidad = v.length;
		int[] valores = new int[3];
		
		for(int i = 0; i < cantidad; i++) {
			
			promedio += v[i];
			
			if(v[i] >= max) {
				max = v[i];
			}
			
			if(v[i] <= min) {
				min = v[i];
			}
			
		}
		
		promedio = promedio/cantidad;
		
		valores[0] = max;
		valores[1] = min;
		valores[2] = promedio;
		
		return valores;
		
	}
	
}
