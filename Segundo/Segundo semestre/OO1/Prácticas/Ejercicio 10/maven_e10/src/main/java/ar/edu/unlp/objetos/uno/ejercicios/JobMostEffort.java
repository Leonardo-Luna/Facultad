package ar.edu.unlp.objetos.uno.ejercicios;

public class JobMostEffort extends JobScheduler {
	
	public JobDescription next() {

		JobDescription nextJob = null;

        nextJob = super.getJobs().stream()
            .max((j1,j2) -> Double.compare(j1.getEffort(), j2.getEffort()))
            .orElse(null);
        super.unschedule(nextJob);
        return nextJob;
	}

}
