Program ejer7;

type

	novela = record
		nombre: string;
		genero: string;
		precio: real;
		codigo: integer;
	end;
	
	archivo = file of novela;

procedure crearB(var arch: archivo; var txt: Text);
var
	
	nov: novela;
	
begin

	rewrite(arch);
	reset(txt);
	
	while(not eof(txt)) do begin
	
		readln(txt, nov.codigo, nov.precio, nov.genero);
		readln(txt, nov.nombre);
		write(arch, nov);
	
	end;
	
	close(arch);
	close(txt);

end;

procedure leer(var nov: novela);
begin

	writeln('Ingrese el nombre: ');
	readln(nov.nombre);
	writeln('Ingrese el codigo: ');
	readln(nov.codigo);
	writeln('Ingrese el genero: ');
	readln(nov.genero);
	writeln('Ingrese el precio: ');
	readln(nov.precio);

end;

procedure agregar(var arch: archivo);
var

	nov: novela;
	
begin

	reset(arch);
	leer(nov);
	seek(arch, filesize(arch));
	write(arch, nov);
	close(arch);

end;

procedure exportar(var arch: archivo; var txt2: Text);
var

	nov: novela;
	
begin

	reset(arch);
	rewrite(txt2);
	
	while(not eof(arch)) do begin
	
		read(arch, nov);
		writeln(txt2, nov.codigo, ' ', nov.precio:0:2, ' ', nov.genero);
		writeln(txt2, nov.nombre);
	
	end;
	
	close(arch);
	close(txt2);

end;

procedure actualizar(var arch: archivo);
var

	nov, novAux: novela;
	encontrado: boolean;
	
begin

	writeln('Ingrese los datos de la novela a modificar (filtrado por nombre)');
	leer(nov);
	encontrado:= false;
	
	reset(arch);
	while(not eof(arch) and not(encontrado)) do begin
	
		read(arch, novAux);
		if(novAux.nombre = nov.nombre) then begin
		
			encontrado:= true;
			seek(arch, filepos(arch)-1);
			write(arch, nov);
			writeln('Actualizado');
		
		end;

	end;
	
	if(not (encontrado)) then
		writeln('Novela no encontrada');
	
	close(arch);

end;

var

	arch: archivo;
	txt: Text;
	txt2: Text;
	
begin

	assign(arch, 'novelas.dat');
	assign(txt, 'novelas.txt');
	assign(txt2, 'novelas2.txt');
	
	writeln('Creado');
	crearB(arch, txt);
	writeln('Exportado');
	exportar(arch, txt2);
	writeln('Agregar...');
	agregar(arch);
	writeln('Exportado (x2)');
	exportar(arch, txt2);
	
	writeln('Modificar...');
	actualizar(arch);
	writeln('Exportado (x3)');
	exportar(arch, txt2);

end.
