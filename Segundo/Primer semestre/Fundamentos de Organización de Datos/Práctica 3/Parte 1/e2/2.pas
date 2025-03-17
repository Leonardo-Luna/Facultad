program ejer2;

type

	archReg = record
		nro: integer;
		apellido: string;
		nombre: string;
		email: string;
		telefono: integer;
		dni: integer;
	end;
	
	arch = file of archReg;
	
procedure leer(var reg: archReg);
begin

	writeln('Nro de asistente: ');
	readln(reg.nro);
	
	if(reg.nro <> -1) then begin
	
		writeln('Apellido: ');
		readln(reg.apellido);
		writeln('Nombre: ');
		readln(reg.nombre);
		writeln('Email: ');
		readln(reg.email);
		writeln('Telefono: ');
		readln(reg.telefono);
		writeln('DNI: ');
		readln(reg.dni);
		
	end;

end;

procedure crearArchivo(var m: arch);
var

	reg: archReg;
	
begin
	
	rewrite(m);
	leer(reg);
	
	while(reg.nro <> -1) do begin
	
		write(m, reg);
		leer(reg);
	
	end;

	close(m);

end;

procedure borradoLogico(var m: arch);
var

	reg: archReg;

begin

	reset(m);
	
	while(not eof(m)) do begin
	
		read(m, reg);
		
		if(reg.nro < 1000) then begin
		
			reg.apellido:= '@' + reg.apellido;
			seek(m, filepos(m)-1);
			write(m, reg);
		
		end;
	
	end;
	
	close(m);

end;

procedure imprimirTodo(var m: arch);
var

	reg: archReg;
	
begin
	
	reset(m);
	
	while(not eof(m)) do begin
	
		read(m, reg);
		writeln(reg.nro, ' | ', reg.apellido, ', ', reg.nombre);
	
	end;
	
	close(m);

end;
	
var

	m: arch;

begin

	assign(m, 'Ejercicio2.archivo');
	
	crearArchivo(m);
	imprimirTodo(m); //Todo un antes
	
	writeln;
	
	borradoLogico(m);
	imprimirTodo(m); //Completamente un después (Va a borrar un solo dato (espero))

end.
