package ar.edu.objetos.uno.patrones_1;

import java.util.ArrayList;
import java.util.List;

public class Biblioteca {
	private List<Socio> socios;
	private Exporter exporter;

	public Biblioteca() {
		socios = new ArrayList<>();
	}

	public void agregarSocio(Socio socio) {
		socios.add(socio);
	}

	/**
	 * Retorna la representación JSON de la colección de socios.
	 */
	public String exportarSocios() {
		
		return this.exporter.exportar(this.socios);

	}

	public Exporter getExporter() {
		return exporter;
	}

	public void setExporter(Exporter exporter) {
		this.exporter = exporter;
	}
}
