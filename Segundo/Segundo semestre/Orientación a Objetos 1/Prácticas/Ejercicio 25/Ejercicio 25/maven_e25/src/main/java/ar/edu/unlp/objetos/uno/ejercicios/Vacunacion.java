package ar.edu.unlp.objetos.uno.ejercicios;

import java.time.LocalDate;

public class Vacunacion extends ConMedico {

    private String vacuna;
    private double costo;

    public Vacunacion(Mascota m, LocalDate f, Veterinario v, String vacuna, double costo) {
        super(m, f, v);
        this.vacuna = vacuna;
        this.costo = costo;
    }

    public double getDescartables() {
        return 500;
    }

    public double getExtra() {
        return this.costo;
    }

}