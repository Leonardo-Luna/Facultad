package ar.edu.unlp.objetos.uno.ejercicios;

public class TestEnvioEntreCuentas {
	
	public static void main(String[] args) {
		CajaDeAhorro c1 = new CajaDeAhorro();
		CuentaCorriente c2 = new CuentaCorriente();
		
		c1.depositar(1000);
		c1.transferirACuenta(500, c2);
		
		System.out.println(c1.getSaldo());
		System.out.println(c2.getSaldo());
		
		c2.extraer(490);
		System.out.println(c2.getSaldo());
		
		c2.setLimite(200);
		c2.transferirACuenta(100, c1);
		System.out.println(c2.getSaldo());
		c2.transferirACuenta(200, c1); // No lo permite
		System.out.println(c2.getSaldo());
	}

}
