package ar.edu.objetos.uno.patrones_13;

public class ScriptArmadorMagico {
	
	public static void main(String[] args) {
		
		DirectorSubteWay subteWay = new DirectorSubteWay();
		
		SandwichBuilder builder = new BuilderSinTACC();
		subteWay.setBuilder(builder);
		Sandwich s = subteWay.buildSandwich();
		System.out.println(s.calcularPrecioFinal());
		
		builder = new BuilderVegano();
		subteWay.setBuilder(builder);
		s = subteWay.buildSandwich();
		System.out.println(s.calcularPrecioFinal());
		
	}

}
