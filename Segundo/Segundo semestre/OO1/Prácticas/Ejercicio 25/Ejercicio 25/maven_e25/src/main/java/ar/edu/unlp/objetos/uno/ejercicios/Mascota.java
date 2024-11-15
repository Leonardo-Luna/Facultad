package ar.edu.unlp.objetos.uno.ejercicios;

import java.time.LocalDate;
import java.util.*;

public class Mascota {

    private LocalDate fechaNacimiento;
    private String nombre;
    private String especie;
    private List<ServicioMedico> servicios;

    public Mascota(LocalDate fn, String nombre, String especie) {
        this.fechaNacimiento = fn;
        this.nombre = nombre;
        this.especie = especie;
        this.servicios = new ArrayList<ServicioMedico>();
    }

    public Consulta altaConsulta(Veterinario v) {
        Consulta c = new Consulta(this, LocalDate.now(), v);
        this.servicios.add(c);
        return c;
    }

    public Vacunacion altaVacunacion(Veterinario vet, String nombre, double costo) {
        Vacunacion v = new Vacunacion(this, LocalDate.now(), vet, nombre, costo);
        this.servicios.add(v);
        return v;
    }

    public Guarderia altaGuarderia(int dias) {
        Guarderia g = new Guarderia(this, LocalDate.now(), dias);
        this.servicios.add(g);
        return g;
    }

    public int getCantidadServicios() {
        return this.servicios.size();
    }

    public double getTotalEnFecha(LocalDate fecha) {
        return this.servicios.stream()
            .filter(s -> s.getFecha().equals(fecha)         )
            .mapToDouble(s -> s.calcularCosto())
            .sum();
    }

}