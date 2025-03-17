package ar.edu.unlp.objetos.uno.ejercicios;

public class JobFIFO extends JobScheduler {
	
	public JobDescription getNext() {
		return this.getJobs().get(0);
	}

}
