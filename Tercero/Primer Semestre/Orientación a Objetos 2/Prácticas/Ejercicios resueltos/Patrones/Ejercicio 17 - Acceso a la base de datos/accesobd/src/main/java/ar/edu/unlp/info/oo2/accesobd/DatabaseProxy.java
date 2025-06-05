package ar.edu.unlp.info.oo2.accesobd;

import java.util.Collection;
import java.util.List;

public class DatabaseProxy implements DatabaseAccess {
	
	private boolean autenticado = false;
	private DatabaseAccess db;
	private String password;
	
	public DatabaseProxy(DatabaseAccess db, String password) {
		this.db = db;
		this.password = password;
	}
	
	public void login(String password) {
		if(this.password.equals(password)) {
			this.autenticado = true;	
		}
	}
	
	public void logout() {
		this.autenticado = false;
	}
	
    public Collection<String> getSearchResults(String queryString) {
    	if(this.autenticado) {
    		return this.db.getSearchResults(queryString);
    	}
    	
    	throw new Error("Accedo denegado");
    }

    public int insertNewRow(List<String> rowData) {
    	if(this.autenticado) {
    		return this.db.insertNewRow(rowData);
    	}
    	
    	throw new Error("Accedo denegado");
    }

}
