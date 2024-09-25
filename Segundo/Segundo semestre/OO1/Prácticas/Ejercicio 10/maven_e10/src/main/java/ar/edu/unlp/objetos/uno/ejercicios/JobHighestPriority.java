package ar.edu.unlp.objetos.uno.ejercicios;

public class JobHighestPriority extends JobScheduler {
	
	public JobDescription next() {
		
		JobDescription nextJob = null;
		
        nextJob = super.getJobs().stream()
                .max((j1,j2) -> Double.compare(j1.getPriority(), j2.getPriority()))
                .orElse(null);
        super.unschedule(nextJob);
        return nextJob;
		
	}

}
