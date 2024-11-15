package ar.edu.unlp.objetos.uno.ejercicios;

import java.time.LocalDate;

public abstract class ServicioMedico {

    private Mascota mascota;
    private LocalDate fecha;

    public ServicioMedico(Mascota m, LocalDate fecha) {
        this.mascota = m;
        this.fecha = fecha;
    }

    public LocalDate getFecha() {
        return this.fecha;
    }

    public int getServicios() {
        return this.mascota.getCantidadServicios();
    }

    public abstract double calcularCosto();

}