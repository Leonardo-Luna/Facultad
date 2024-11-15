package ar.edu.unlp.objetos.uno.ejercicios;

import java.time.DayOfWeek;
import java.time.LocalDate;

public abstract class ConMedico extends ServicioMedico {

    private Veterinario veterinario;

    public ConMedico(Mascota m, LocalDate f, Veterinario v) {
        super(m, f);
        this.veterinario = v;
    }

    public abstract double getDescartables();
    public abstract double getExtra();

    public double costoPorAnio() {
        return this.veterinario.getAntiguedadAnios() * 100;
    }

    public double costoDomingo() {
        return (this.getFecha().getDayOfWeek() == DayOfWeek.SUNDAY) ? 200 : 0;
    }

    public double calcularCosto() {
        return this.getDescartables() + this.veterinario.getHonorarios() + this.costoDomingo() + this.getExtra();
    }

}