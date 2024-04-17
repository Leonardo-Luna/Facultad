Program ejer2;

const

valorAlto = 9999;

type

	alumno = record
		codigo: integer;
		apellido: string;
		nombre: string;
		cantCursadas: integer;
		cantFinales: integer;
	end;
	
	alumno2 = record
		codigo: integer;
		materia: integer;
	end;
	
	archivoMaestro = file of alumno;
	archivoDetalle = file of alumno2;
	
procedure crearBinarioM(var arch: archivoMaestro; var txt: Text);
var

	reg: alumno;
	
begin

	reset(txt);
	rewrite(arch);

	while(not eof(txt)) do begin
	
		readln(txt, reg.codigo);
		readln(txt, reg.cantCursadas, reg.cantFinales);
		readln(txt, reg.nombre, reg.apellido);
		write(arch, reg);
	
	end;

end;

procedure crearBinarioD(var arch: archivoDetalle; var txt: Text);
var

	reg: alumno2;
	
begin

	reset(txt);
	rewrite(arch);

	while(not eof(txt)) do begin
	
		readln(txt, reg.codigo);
		readln(txt, reg.materia);
		write(arch, reg);
	
	end;

end;

procedure leer(var det: archivoDetalle; var dato: alumno2);
begin

	if(not eof(det)) then
		read(det, dato)
	else
		dato.codigo:= valorAlto;
		
end;

procedure actualizarMaterias(var maestro: archivoMaestro; var detalle: archivoDetalle);
var

	m: alumno;
	d: alumno2;

begin

	reset(maestro);
	reset(detalle);
	
	leer(detalle, d);
	
	while(not eof(maestro)) do begin
	
		read(maestro, m);
		seek(maestro, filepos(maestro)-1);

		while((d.codigo <> 9999) and (d.codigo = m.codigo)) do begin
		
			if(d.materia = 1) then
				m.cantCursadas:= m.cantCursadas +1
			else begin
				m.cantCursadas:= m.cantCursadas -1;
				m.cantFinales:= m.cantFinales +1;
			end;
			
			leer(detalle, d);
		
		end;
		
		write(maestro, m);
	
	end;
	
	if(d.materia = 1) then
		m.cantCursadas:= m.cantCursadas +1
	else begin
		m.cantCursadas:= m.cantCursadas -1;
		m.cantFinales:= m.cantFinales +1;
	end;
	
	seek(maestro, filepos(maestro)-1);
	write(maestro, m);
	
	close(maestro);
	close(detalle);

end;	

procedure exportarM(var arch: archivoMaestro; var txt: Text);
var

	reg: alumno;
	
begin

	reset(arch);
	rewrite(txt);

	while(not eof(arch)) do begin
	
		read(arch, reg);
		writeln(txt, reg.codigo);
		writeln(txt, reg.cantCursadas, ' ', reg.cantFinales);
		writeln(txt, reg.nombre, ' ', reg.apellido);
	
	end;
	
	close(arch);
	close(txt);

end;

procedure listarAlumnos(var maestro: archivoMaestro);
var

	reg: alumno;
	aux: Text;
	
begin

	assign(aux, 'listado.txt');
	rewrite(aux);
	reset(maestro);

	while(not eof(maestro)) do begin
	
		read(maestro, reg);
		if(reg.cantFinales > reg.cantCursadas) then begin
		
			writeln(aux, reg.nombre, ' ', reg.apellido, ' | Cod ', reg.codigo, ' | Cursadas ', reg.cantCursadas, ' | Finales ', reg.cantFinales);
		
		end;
		
	end;
	
	close(aux);
	close(maestro);

end;

var

	maestro: archivoMaestro;
	detalle: archivoDetalle;
	maestroTxt, detalleTxt: Text;

begin

	assign(maestro, 'maestro.dat');
	assign(detalle, 'detalle.dat');
	assign(maestroTxt, 'maestro.txt');
	assign(detalleTxt, 'detalle.txt');
	
	crearBinarioM(maestro, maestroTxt);
	crearBinarioD(detalle, detalleTxt);
	writeln('Creado');
	actualizarMaterias(maestro, detalle);
	writeln('Actualizado');
	exportarM(maestro, maestroTxt);
	writeln('Exportado');
	listarAlumnos(maestro);
	writeln('Listado exportado');
	
end.
