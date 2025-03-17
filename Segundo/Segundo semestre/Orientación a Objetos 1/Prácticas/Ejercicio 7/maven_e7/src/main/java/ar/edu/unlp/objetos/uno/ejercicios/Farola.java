package ar.edu.unlp.objetos.uno.ejercicios;
import java.util.*;

public class Farola extends Object {
	
	private boolean status; // true = on ; false = off
	private List<Farola> neighbors;
	
	public Farola() {
		this.status = false;
		this.neighbors = new ArrayList<Farola>();
	}
	
	public void pairWithNeighbor(Farola f) {
		this.neighbors.add(f);
		f.agregarFarola(this);
	}
	
	public void agregarFarola(Farola f) {
		this.neighbors.add(f);
	}
	
	public List<Farola> getNeighbors() {
		return new ArrayList<Farola>(this.neighbors);
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
