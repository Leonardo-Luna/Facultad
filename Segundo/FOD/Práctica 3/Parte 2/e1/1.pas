program ej1_2;

type

	regM = record
		cod: integer;
		nombre: string;
		precio: real;
		stockActual: integer;
		stockMinimo: integer;
	end;
	
	regD = record
		cod: integer;
		cantVentas: integer;
	end;
	
	archM = file of regM;
	archD = file of regD;
	
procedure actualizarMaestro(var m: archM; var d: archD);
var

	reg: regM;
	det: regD;
	ventas: integer;

begin

	reset(m);
	reset(d);
	
	while(not eof(m)) do begin
	
		read(m, reg);
		ventas:= 0;
		
		while(not eof(d)) do begin
		
			read(d, det);
			if(det.cod = reg.cod) then
				ventas:= ventas + det.cantVentas;
		
		end;
		
		seek(m, filepos(m)-1),
		reg.stockActual:= reg.stockActual - ventas;
		write(m, reg);
		seek(d, 0);
	
	end;
	
	close(m);
	close(d);

end;
	
var

	m: archM;
	d: archD;

begin

	assign(m, 'maestro.dat');
	assign(d, 'detalle.dat');
	
	actualizarMaestro(m, d);
	// b) Cortar el while al encontrar la aparicion del codigo :D

end.
