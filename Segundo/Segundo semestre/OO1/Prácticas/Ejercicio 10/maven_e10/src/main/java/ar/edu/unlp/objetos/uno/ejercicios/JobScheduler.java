package ar.edu.unlp.objetos.uno.ejercicios;

import java.util.ArrayList;
import java.util.List;

public abstract class JobScheduler {
    protected List<JobDescription> jobs;

    public JobScheduler () {
        this.jobs = new ArrayList<>();
    }

    public void schedule(JobDescription job) {
        this.jobs.add(job);
    }

    public void unschedule(JobDescription job) {
        if (job != null) {
            this.jobs.remove(job);
        }
    }

    public List<JobDescription> getJobs(){
        return jobs;
    }

    public JobDescription next() {
    	JobDescription nextJob = this.getNext();
        this.unschedule(nextJob);
        return nextJob;
    }
    
    public abstract JobDescription getNext();

}
