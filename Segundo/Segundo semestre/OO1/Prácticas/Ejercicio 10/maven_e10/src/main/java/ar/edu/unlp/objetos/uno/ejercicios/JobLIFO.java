package ar.edu.unlp.objetos.uno.ejercicios;

public class JobLIFO extends JobScheduler {
	
	public JobDescription getNext() {
		return this.getJobs().get(jobs.size()-1);
	}

}
