program ej6;

const

	valorAlto = 9999;

type

	regM = record
		cod_prenda: integer;
		descripcion: string;
		colores: string;
		tipo_prenda: string;
		stock: integer;
		precio_unitario: real;
	end;
	
	archM = file of regM;
	
	archD = file of integer;
	
procedure leerM(var m: archM; var reg: regM);
begin

	if(not eof(m)) then
		read(m, reg)
	else
		reg.cod_prenda:= valorAlto;
	
end;
	
procedure bajaLogica(var m: archM; var d: archD);
var

	reg: regM;
	cod: integer;

begin

	reset(m);
	reset(d);
	
	while(not eof(d)) do begin
	
		read(d, cod);
		
		seek(m, 0);
		leerM(m, reg);
		
		while(reg.cod_prenda <> cod) do
			leerM(m, reg);
			
		if(reg.cod_prenda = cod) then begin
		
			reg.stock:= reg.stock * -1;
			seek(m, filepos(m)-1);
			write(m, reg);
			
		end;
	
	end;

	close(m);
	close(d);

end;

procedure convertirDetalle(var txt: Text; var d: archD);
var

	c: integer;
	
begin

	reset(txt);
	rewrite(d);
	
	while(not eof(txt)) do begin
		readln(txt, c);
		write(d, c);
	end;

	close(txt);
	close(d);

end;

procedure compactarMaestro(var m, aux: archM);
var

	reg: regM;
	
begin

	reset(m);
	rewrite(aux);
	
	while(not eof(m)) do begin
	
		read(m, reg);
		
		if(reg.stock > 0) then
			write(aux, reg);
	
	end;
	
	close(m);
	close(aux);

end;

var

	m, aux: archM;
	d: archD;
	txt: Text;

begin

	assign(m, 'maestro.txt');
	assign(d, 'detalle.txt');
	assign(aux, 'aux.txt');
	assign(txt, 'd.txt');
	
	convertirDetalle(txt, d);
	
	bajaLogica(m, d);
	
	erase(m);
	rename(aux, 'maestro.txt');

end.
