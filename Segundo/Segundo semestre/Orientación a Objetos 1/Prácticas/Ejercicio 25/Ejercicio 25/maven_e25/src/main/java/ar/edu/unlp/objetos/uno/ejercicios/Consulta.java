package ar.edu.unlp.objetos.uno.ejercicios;

import java.time.LocalDate;

public class Consulta extends ConMedico {

    public Consulta(Mascota m, LocalDate f, Veterinario v) {
        super(m, f, v);
    }

    public double getDescartables() {
        return 300;
    }

    public double getExtra() {
        return this.costoPorAnio();
    }

}