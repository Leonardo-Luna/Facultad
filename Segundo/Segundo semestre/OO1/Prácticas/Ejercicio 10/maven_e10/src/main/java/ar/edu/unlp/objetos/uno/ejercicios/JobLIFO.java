package ar.edu.unlp.objetos.uno.ejercicios;

public class JobLIFO extends JobScheduler {
	
	public JobDescription next() {
		
		JobDescription nextJob = null;
		
		nextJob = super.getJobs().get(jobs.size()-1);
        super.unschedule(nextJob);
        return nextJob;
	}

}
