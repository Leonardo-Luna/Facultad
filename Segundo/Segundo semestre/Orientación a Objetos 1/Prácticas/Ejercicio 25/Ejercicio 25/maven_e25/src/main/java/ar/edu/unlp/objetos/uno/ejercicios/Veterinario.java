package ar.edu.unlp.objetos.uno.ejercicios;

import java.time.LocalDate;

public class Veterinario {
    
    private String nombre;
    private LocalDate fechaIngreso;
    private double honorarios;

    public Veterinario(String nombre, LocalDate ingreso, double honorarios) {
        this.nombre = nombre;
        this.fechaIngreso = ingreso;
        this.honorarios = honorarios;
    }

    public double getHonorarios() {
        return this.honorarios;
    }

    public int getAntiguedadAnios() {
        return LocalDate.now().getYear() - this.fechaIngreso.getYear();
    }

}