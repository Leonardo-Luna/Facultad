package ar.edu.unlp.objetos.uno.ejercicios;
import java.util.*;

public class Farola extends Object {
	
	private boolean status; // true = on ; false = off
	private LinkedList<Farola> neighbors;
	
	public Farola() {
		this.status = false;
		this.neighbors = new LinkedList<Farola>();
	}
	
	public void pairWithNeighbor(Farola f) {
		this.neighbors.add(f);
		f.neighbors.add(this); // O implementar un método que haga esto en caso de que esté mal
	}
	
	public List<Farola> getNeighbors() {
		return this.neighbors;
	}
	
	public void turnOn() {
		if(this.isOff()) {
			this.status = !this.status;
			for(Farola f : this.neighbors) {
				f.turnOn();
			}
		}
	}
	
	public void turnOff() {
		if(this.isOn()) {
			this.status = !this.status;
			for(Farola f : this.neighbors) {
				f.turnOff();
			}
		}
	}
	
	public boolean isOn() {
		return this.status;
	}
	
	public boolean isOff() {
		return !this.status;
	}

}
