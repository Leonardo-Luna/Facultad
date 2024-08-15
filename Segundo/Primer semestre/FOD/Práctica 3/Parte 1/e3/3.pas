program ejer3;

type
	
	novelas = record
		codigo: integer;
		genero: string;
		nombre: string;
		duracion: integer;
		director: string;
		precio: real;
	end;
	
	archivo = file of novelas;
	
procedure leer(var n: novelas);
begin

	writeln('Ingrese el codigo de novela (cod. > 0)');
	readln(n.codigo);
	
	if(n.codigo > 0) then begin
	
		writeln('Ingrese el genero:');
		readln(n.genero);
		writeln('Ingrese el nombre: ');
		readln(n.nombre);
		writeln('Ingrese la duracion: ');
		readln(n.duracion);
		writeln('Ingrese el director: ');
		readln(n.director);
		writeln('Ingrese el precio: ');
		readln(n.precio);
	
	end;

end;
	
procedure crearArchivo(var a: archivo);
var

	n: novelas;
	
begin

	rewrite(a);
	
	n.codigo:= 0;
	write(a, n);
	
	leer(n);
	
	while(n.codigo > 0) do begin
	
		write(a, n);
		leer(n);
	
	end;
	
	close(a);

end;

procedure altaDatos(var a: archivo);
var

	n, aux, cabecera: novelas;
	
begin

	leer(n);
	reset(a);
	
	if(n.codigo > 0) then begin
	
		read(a, aux);
		cabecera:= aux;
		
		if(cabecera.codigo = 0) then begin
		
			seek(a, filesize(a));
			write(a, n);
			
		end
		else begin
		
			seek(a, cabecera.codigo*-1);
			read(a, aux);
			cabecera:= aux;
			seek(a, filepos(a)-1);
			write(a, n);
			
			seek(a, 0);
			write(a, aux);
		
		end;
		
		writeln('Novela agregada.');
	
	end
	else
		writeln('Codigo de novela invalido.');

end;

procedure modificarNovela(var n: novelas; codigo: integer);
begin

	n.codigo:= codigo;
	writeln('Ingrese el genero:');
	readln(n.genero);
	writeln('Ingrese el nombre: ');
	readln(n.nombre);
	writeln('Ingrese la duracion: ');
	readln(n.duracion);
	writeln('Ingrese el director: ');
	readln(n.director);
	writeln('Ingrese el precio: ');
	readln(n.precio);

end;

procedure modificarDatos(var a: archivo);
var

	codigo: integer;
	n: novelas;
	encontre: boolean;

begin

	reset(a);

	writeln('Ingrese el codigo de la novela a modificar: ');
	readln(codigo);
	encontre:= false;
	
	while(not eof(a)) and (not encontre) do begin
	
		read(a, n);
		
		if(n.codigo = codigo) then begin
			encontre:= true;
			modificarNovela(n, codigo);
			seek(a, filepos(a)-1);
			write(a, n);
		end;
	
	end;
	
	if(encontre) then
		writeln('Novela modificada.')
	else
		writeln('Novela no encontrada.');
		
	close(a);

end;

procedure eliminarDatos(var a: archivo);
var

	codigo, pos: integer;
	aux, cabecera: novelas;
	encontre: boolean;

begin

	reset(a);
	writeln('Ingrese el codigo de novela a borrar: ');
	readln(codigo);
	
	read(a, cabecera);
	encontre:= false;
	
	while(not eof(a)) and (not encontre) do begin
	
		read(a, aux);
		if(aux.codigo = codigo) then begin
			encontre:= true;
			pos:= (filepos(a)-1) * -1;
			seek(a, filepos(a)-1);
			write(a, cabecera);
			cabecera.codigo:= pos;
			seek(a, 0);
			write(a, cabecera);
		end;
	
	end;
	
	if(encontre) then
		writeln('Novela borrada.')
	else
		writeln('Novela no encontrada.');
	
	close(a);

end;

procedure mantenimiento(var a: archivo);
var

	opcion: integer;
	
begin

	writeln('Mantenimiento: ');
	writeln('1 - Dar alta a una novela');
	writeln('2 - Modificar una novela');
	writeln('3 - Eliminar una novela');
	
	readln(opcion);
	
	case (opcion) of
		1: altaDatos(a);
		2: modificarDatos(a);
		3: eliminarDatos(a);
	end;

end;

procedure actualizarBinario(var a: archivo; var aTxt: Text);
var

	n: novelas;
	
begin

	rewrite(a);
	reset(aTxt);
	
	while(not eof(aTxt)) do begin
	
		readln(aTxt, n.codigo);
		readln(aTxt, n.genero);
		readln(aTxt, n.nombre);
		readln(aTxt, n.duracion);
		readln(aTxt, n.director);
		readln(aTxt, n.precio);
		
		write(a, n);
	
	end;
	
	close(a);
	close(aTxt);

end;

procedure exportarTxt(var a: archivo; var aTxt: Text);
var
	
	n: novelas;
	
begin

	reset(a);
	rewrite(aTxt);
	
	while(not eof(a)) do begin
	
		read(a, n);
		writeln(aTxt, n.codigo);
		writeln(aTxt, n.genero);
		writeln(aTxt, n.nombre);
		writeln(aTxt, n.duracion);
		writeln(aTxt, n.director);
		writeln(aTxt, n.precio);
		
	end;
	
	close(a);
	close(aTxt);
	
end;

procedure menu(var a: archivo; var aTxt: Text);
var

	opcion: integer;
	
begin

	writeln('1 - Crear archivo');
	writeln('2 - Mantenimiento del archivo');
	writeln('3 - Exportar a TXT');
	writeln('4 - Actualizar Binario');
	writeln('* - Salir');;
	
	readln(opcion);
	
	while(opcion <= 5) and (opcion > 0) do begin
	
		case (opcion) of
			1: crearArchivo(a);
			2: mantenimiento(a);
			3: exportarTxt(a, aTxt);
			4: actualizarBinario(a, aTxt);
		end;
		
		writeln('1 - Crear archivo');
		writeln('2 - Mantenimiento del archivo');
		writeln('3 - Exportar a TXT');
		writeln('4 - Actualizar Binario');
		writeln('* - Salir');
			
		readln(opcion);
		
	end;

end;

var

	a: archivo;
	aTxt: Text;

begin

	assign(a, 'novelas. dat');
	assign(aTxt, 'novelas.txt');
	
	menu(a, aTxt);

end.
