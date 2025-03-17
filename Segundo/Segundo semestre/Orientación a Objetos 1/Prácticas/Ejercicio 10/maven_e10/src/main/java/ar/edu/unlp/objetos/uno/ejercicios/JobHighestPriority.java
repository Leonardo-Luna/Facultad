package ar.edu.unlp.objetos.uno.ejercicios;

public class JobHighestPriority extends JobScheduler {
	
	public JobDescription getNext() {
        return this.getJobs().stream()
                .max((j1,j2) -> Double.compare(j1.getPriority(), j2.getPriority()))
                .orElse(null);
	}

}
