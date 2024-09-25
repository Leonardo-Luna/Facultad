package ar.edu.unlp.objetos.uno.ejercicios;

public class JobFIFO extends JobScheduler {
	
	public JobDescription next() {
		
		JobDescription nextJob = null; // Que sea variable de JobScheduler y acceder con getter/setter?
		
		nextJob = super.getJobs().get(0);
        super.unschedule(nextJob);
        return nextJob;
	}

}
