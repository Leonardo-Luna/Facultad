package ar.edu.objetos.uno.patrones_14;

import java.util.ArrayList;

public class CompositeMixta extends Component {

	private ArrayList<Component> lista;
	
	public CompositeMixta() {
		super();
		this.lista = new ArrayList<Component>();
	}
	
	public void agregar(Component prenda) {
		this.lista.add(prenda);
	}
	
	public double getValor() {
		return this.lista.stream().mapToDouble(prenda -> prenda.getValor()).sum();
	}
	
	public double getLiquidez() {
		return 0.5;
	}
	
}
