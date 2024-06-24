program p2e3;

const

	valorAlto = 9999;

type

	regM = record
		cod: integer;
		nombre: string;
		precio: real;
		stockA: integer;
		stockM: integer;
	end;
	
	regD = record
		cod: integer;
		ventas: integer;
	end;
	
	archD = file of regD;
	archM = file of regM;
	
procedure leerD(var d: archD; var reg: regD);
begin

	if(not eof(d)) then
		read(d, reg)
	else
		reg.cod:= valorAlto;
		
end;

procedure listar(var listado: Text; reg: regM);
begin

	writeln(listado, reg.cod, ' ', reg.nombre, ' ', reg.stockA);
	
end;
	
procedure actualizarM(var m: archM; var d: archD);
var

	reg: regM;
	regDet: regD;
	listado: Text;

begin

	reset(m);
	reset(d);
	rewrite(listado);
	
	leerD(d, regDet);
	
	while(regDet.cod <> valorAlto) do begin
	
		read(m, reg);
		while(reg.cod <> regDet.cod) do
			read(m, reg);
			
		while(reg.cod = regDet.cod) do begin
		
			reg.stockA:= reg.stockA - regDet.ventas;
			leerD(d, regDet);
		
		end;
		
		seek(m, filepos(m)-1);
		write(m, reg);
		
		if(reg.stockA < reg.stockM) then
			listar(listado, reg);
	
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
