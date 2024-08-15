package e3;

public class E3 {

	public static void main(String[] args) {
		
		Estudiante[] v1 = new Estudiante[2];
		Profesor[] v2 = new Profesor[3];
		
		v1[0] = new Estudiante("Leo", "L.", "1A", "asd@gmail.com" , "Pepe 3, Popo 4");
		v1[1] = new Estudiante("Gus" , "G.", "2B", "dsa@hotmail.com", "Porteño o algo asi");
		
		v2[0] = new Profesor("Gonza", "G.", "aaa@info.unlp.edu.ar", "CADP", "Informatica");
		v2[1] = new Profesor("Laura", "L.", "bbb@info.com", "Taller de Prog.", "Informatica");
		v2[2] = new Profesor("Mati", "M.", "ccc@unlp.ar", "Arqui. de Computadoras", "Informatica");
		
		for(int i = 0; i<v1.length; i++) {
			
			System.out.println(v1[i].tusDatos());
			
		} System.out.println("");
		
		for(int i = 0; i<v2.length; i++) {
			
			System.out.println(v2[i].tusDatos());
			
		}

	}

}
