package ar.edu.objetos.uno.patrones_1;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class JSONSimpleExporter implements Exporter {
	
	private JSONArray exporter;
	
	public JSONSimpleExporter() {
		this.exporter = new JSONArray();
	}
	
	@Override
	public String exportar(List<Socio> socios) {	
		
		socios.stream().forEach(socio -> this.crearSocio(socio));
		
		return this.exporter.toJSONString();
	}
	
	private void crearSocio(Socio socioActual) {
		JSONObject JSONSocio;
		JSONSocio = new JSONObject();
		JSONSocio.put("Nombre", socioActual.getNombre());
		JSONSocio.put("Email", socioActual.getEmail());
		JSONSocio.put("Legajo", socioActual.getLegajo());
		this.exporter.add(JSONSocio);
	}

}
