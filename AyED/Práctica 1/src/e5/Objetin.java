package e5;

public class Objetin {
    	
	private int maxO = Integer.MIN_VALUE;
	private int minO = Integer.MAX_VALUE;
	private int promedioO = -1;

    public Objetin() {
    	
    }
	
	public Objetin(int max, int min, int promedio) {

        this.maxO = max;
        this.minO = min;
        this.promedioO = promedio;

    }

	public int getMaxO() {
		return maxO;
	}

	public void setMaxO(int maxO) {
		this.maxO = maxO;
	}

	public int getMinO() {
		return minO;
	}

	public void setMinO(int minO) {
		this.minO = minO;
	}

	public int getPromedioO() {
		return promedioO;
	}

	public void setPromedioO(int promedioO) {
		this.promedioO = promedioO;
	}

    

}
