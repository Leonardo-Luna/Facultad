package ar.edu.unlp.objetos.uno.ejercicios;

import java.time.LocalDate;

public class Guarderia extends ServicioMedico {

    private int dias;

    public Guarderia(Mascota m, LocalDate f, int dias) {
        super(m, f);
        this.dias = dias;
    }

    public boolean aplicaDescuento() {
        return this.getServicios() > 5;
    }

    public double calcularCosto() {
        double total = this.dias * 500;
        if(this.aplicaDescuento()) {
            total -= total * 10;
        }

        return total;
    }

}