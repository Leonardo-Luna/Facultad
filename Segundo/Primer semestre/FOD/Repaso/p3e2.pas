program p3e2;

type

	reg = record
		numero: integer;
		apellido: string;
		nombre: string;
		email: string;
		telefono: string;
		dni: string;
	end;
	
	arch = file of reg;
	
procedure leer(var d: reg);
begin

	readln(reg.dni);
	
	if(reg.dni <> -1) then begin
	
		readln(reg.numero);
		readln(reg.nombre);
		readln(reg.apellido);
		readln(reg.email);
		readln(reg.telefono);
	
	end;

end;

procedure cargar(var m: arch);
var

	dato: reg;

begin
	
	leer(dato);
	
	while(dato.dni <> -1) do begin
	
		write(m, dato),
		leer(dato); //No especifica corte, asumo DNI -1
	
	end;

end;

procedure baja(var m: arch);
var

	dato: reg;

begin

	while(not eof(m)) do begin
	
		read(m, reg);
		
		if(reg.numero < 1000) then begin
			reg.email:= '@' + reg.email;
			seek(m, filepos(m)-1);
			write(m, reg);
		end;
	
	end;

end;

begin

	assign(m, 'm.dat');

	cargar(m);
	baja(m);

end.
