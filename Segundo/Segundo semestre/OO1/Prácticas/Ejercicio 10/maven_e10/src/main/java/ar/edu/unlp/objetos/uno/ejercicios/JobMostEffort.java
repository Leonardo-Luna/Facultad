package ar.edu.unlp.objetos.uno.ejercicios;

public class JobMostEffort extends JobScheduler {
	
	public JobDescription getNext() {
        return this.getJobs().stream()
            .max((j1,j2) -> Double.compare(j1.getEffort(), j2.getEffort()))
            .orElse(null);
	}

}
