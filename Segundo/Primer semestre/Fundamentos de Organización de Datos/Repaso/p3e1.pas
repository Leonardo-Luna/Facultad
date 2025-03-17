program p3e1;

begin

	//el ejercicio depende de otro que es muy largo, me ahorro todo eso y solo
	//hago la lógica del truncate :p
	
	writeln('Ingrese el nro de empleado a eliminar: ');
	readln(nro);
	
	while(not eof(m)) AND (ok) do begin
	
		read(m, reg); //Busco lo que debo borrar
		
		if(reg.nro = nro) then begin
		
			ok:= false;
			pos:= filepos(m)-1; //Me guardo la posición
			seek(m, filesize(m)-1);
			read(m, reg); //Guardo el último
			seek(m, filesize(m)-1);
			truncate(m); //Trunco
			seek(m, pos); //Vuelvo a la posición guardada
			write(m, reg); //Reemplazo
		
		end;
	
	end;

end.
