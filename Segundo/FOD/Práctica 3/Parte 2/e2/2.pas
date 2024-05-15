program ej2_2;

type

	mesa = record
		localidad: string;
		numero: integer;
		cantVotos: integer;
	end;
	
	archM = file of mesa;
	
procedure cargarAuxiliar(var m, aux: archM);
var

	reg, regAux: mesa;
	
begin

	reset(m);
	rewrite(aux);
	
	while(not eof(m)) do begin
	
		read(m, reg);
		
		if(not eof(aux)) then
			read(aux, regAux);
		
		while(not eof(aux)) and (regAux.localidad <> reg.localidad) do begin
		
			read(aux, regAux);
		
		end;
		
		if(regAux.localidad = reg.localidad) then begin
			regAux.cantVotos:= regAux.cantVotos + reg.cantVotos;
			seek(aux, filepos(aux)-1);
			write(aux, regAux);
		end
		else
			write(aux, reg);
	
	end;
	
	close(m);
	close(aux);

end;

procedure imprimirVotos(var aux: archM);
var

	reg: mesa;
	total: integer;
	
begin

	reset(aux);
	total:= 0;
	writeln('Codigo de localidad				Total de votos');
	
	while(not eof(aux)) do begin
	
		read(aux, reg);
		writeln(reg.localidad, '						', reg.cantVotos);
		total:= total + reg.cantVotos;
	
	end;
	
	writeln('Total general de votos: ', total);
	
	close(aux);

end;

var

	m, aux: archM;

begin

	assign(m, 'maestro.txt');
	assign(aux, 'aux.txt');
	cargarAuxiliar(m, aux);

end.
