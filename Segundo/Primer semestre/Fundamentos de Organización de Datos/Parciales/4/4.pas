program parcial4;

type

	prenda = record
		cod_prenda: integer;
		descripcion: string;
		colores: string;
		tipo_prenda: string;
		stock: integer;
		precio_unitario: real;
	end;
	
	archM = file of prenda;
	
	archD = file of integer;
	
procedure bajaLogica(var m: archM; var d: archD);
var
	
	reg: prenda;
	cod: integer;

begin

	reset(m);
	reset(d);

	while(not eof(d)) do begin
	
		read(d, cod);
		seek(m, 0);
		read(m, reg);
		
		while(reg.cod_prenda <> cod) do
			read(m, reg);
			
		seek(m, filepos(m)-1);
		reg.stock:= reg.stock*-1;
		write(m, reg);
	
	end;
	
	close(m);
	close(d);

end;

procedure bajaFisica(var m: archM);
var

	reg, aux: prenda;
	pos, posCambio: integer;

begin

	reset(m);
	pos:= filesize(m)-1;
	
	while(not eof(m)) do begin
	
		read(m, reg);
		posCambio:= filepos(m)-1; //Esto podría ir dentro del IF para ser más eficiente
		
		if(reg.stock < 0) then begin
		
			seek(m, pos);
			read(m, aux);
			
			while(aux.stock < 0) do begin
				pos:= pos -1;
				seek(m, pos);
				read(m, aux);
			end;
			
			seek(m, filepos(m)-1);
			write(m, reg);
			seek(m, posCambio);
			write(m, aux);
			
		end;
	
	end;
	
	seek(m, pos);
	truncate(m);
	
	close(m);

end;

procedure bajaFisicaAlternativa(var m: archM);
var

	reg, aux: prenda;
	pos: integer;
	
begin

	reset(m);
	
	while(not eof(m)) do begin
	
		read(m, reg);
		
		if(reg.stock < 0) then begin
		
			pos:= filepos(m)-1);
			seek(m, filesize(m)-1);
			read(m, aux);
			
			while(aux.stock < 0) do begin
			
				seek(m, filepos(m)-1);
				truncate(m);
				seek(m, filepos(m)-1);
				read(m, aux);
				
			end;
			
			seek(m, pos);
			write(m, aux);
			seek(m, filesize(m)-1);
			truncate(m);
			seek(m, pos);
			
		end;
		
	end;
	
	close(m);

end;		
	
var

	m: archM;
	d: archD;

begin

	assign(m, 'maestro.dat');
	assign(d, 'detalle.dat');
	
	bajaLogica(m, d);
	bajaFisica(m); //Me mandé una fumada, pero parecería estar bien?
	bajaFisicaAlternativa(m);

end.
