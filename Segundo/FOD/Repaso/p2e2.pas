program p2e2;

const

	valorAlto = 9999;

type

	regM = record
		cod: integer;
		apellido: string;
		nombre: string;
		cantCursadas: integer;
		cantFinal: integer;
	end;
	
	regD = record
		cod: integer;
		estado: integer;
	end;
	
	archM = file of regM;
	archD = file of regD;

procedure leerD(var d: archD; var reg: regD);
begin

	if(not eof(d)) then
		read(d, reg)
	else
		reg.cod:= valorAlto;

end;

procedure listar(var listado: Text; var reg: regM);
begin

	writeln(listado, reg.cod, ' ', reg.nombre, ' ', reg.cantCursadas, ' ', reg.cantFinal);
	
end;
	
procedure actualizarM(var m: archM; var d: archD);
var
	
	listado: Text;
	reg: regM;
	regEstado: regD; //0 = cursada sin final || 1 = cursada con final
	
begin

	reset(m);
	reset(d);
	assign(listado, 'listado.txt');
	rewrite(listado);

	leerD(d, regEstado);
	
	while(regEstado.cod <> valorAlto) do begin
		
		read(m, reg);
		while(reg.cod <> regEstado.cod) do
			read(m, reg);
		
		while(reg.cod = regEstado.cod) do begin
		
			if(regEstado.estado = 0) then
				reg.cantCursadas:= reg.cantCursadas +1;
				
			if(regEstado.estado = 1) then begin
				reg.cantFinal:= reg.cantFinal + 1;
				reg.cantCursadas:= reg.cantCursadas - 1;
			end;
			
			leerD(d, regEstado);
			
		end;
		
		seek(m, filepos(m)-1);
		write(m, reg);
		
		//if(reg.cantFinal > reg.cantCursadas) then
			//listar(listado, reg);
		
	end;
	
	close(m);
	close(d);
	close(listado);

end;
	
var

	m: archM;
	d: archD;

begin

	assign(m, 'maestro.dat');
	assign(d, 'detalle.dat');
	
	actualizarM(m, d);

end.
