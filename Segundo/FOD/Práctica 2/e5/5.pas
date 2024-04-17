program ej5;

const

	valorAlto = 9999;

type

	regM = record
		codigo: integer;
		nombre: string;
		descripcion: string;
		stockDisponible: integer;
		stockMinimo: integer;
		precio: real;
	end;
	
	archM = file of regM;
	
	regD = record
		codigo: integer;
		cantVentas: integer;
	end;
	
	archD = file of regD;
	
	vector = array[1..30] of archD;
	vector2 = array[1..30] of regD;
	
procedure leerM(var m: archM; var reg: regM);
begin
	
	if(not eof(m)) then
		read(m, reg)
	else
		reg.codigo:= valorAlto;

end;

procedure leerD(var d: archD; var reg: regD);
begin

	if(not eof(d)) then
		read(d, reg)
	else
		reg.codigo:= valorAlto;

end;

procedure minimo(var v: vector; var v2: vector2; var min: regD);
var

	posMin, i: integer;

begin

	min.codigo:= valorAlto;

	for i:= 0 to 30 do begin
	
		if(v2[i].codigo <= min.codigo) then begin
		
			min:= v2[i];
			posMin:= i;
		
		end;
	
	end;
	
	if(min.codigo <> valorAlto) then
		leerD(v[posMin], v2[posMin]);

end;

procedure resetearD(var v: vector);
var

i: integer;

begin

	for i:= 1 to 30 do begin
	
		reset(v[i]);
	
	end;

end;

procedure cerrarD(var v: vector);
var

	i: integer;

begin

	for i:= 1 to 30 do begin
	
		close(v[i]);
	
	end;

end;

procedure actualizarMaestro(var m: archM; var v: vector);
var
		
	regMae: regM;
	min: regD;
	vecDet: vector2;
	i: integer;
		
begin

	resetearD(v);
	reset(m);

	for i:= 0 to 30 do begin
	
		leerD(v[i], vecDet[i]);
	
	end;
	
	minimo(v, vecDet, min);
	
	while(min.codigo <> valorAlto) do begin
		
		leerM(m, regMae);
		
		while(regMae.codigo <> min.codigo) do
			leerM(m, regMae);
	
		while(min.codigo = regMae.codigo) do begin
		
			regMae.stockDisponible:= regMae.stockDisponible - min.cantVentas;
			minimo(v, vecDet, min);
		
		end;
		
		seek(m, filepos(m)-1);
		write(m, regMae);
		
	end;
	
	cerrarD(v);
	close(m);

end;

procedure crearText(var m: archM);
var

	txt: Text;
	regMae: regM;
	
begin

	rewrite(txt);
	reset(m);

	while(not eof(m)) do begin
	
		read(m, regMae);
		
		if(regMae.stockDisponible < regMae.stockMinimo) then begin
		
			with regMae do begin
			
				writeln(txt, nombre);
				writeln(txt, descripcion);
				writeln(txt, stockDisponible);
				writeln(txt, precio);
				
			end;
			
		end;
	
	end;
	
	close(txt);
	close(m);

end;
	
var

	maestro: archM;
	v: vector;
	aux: string;
	i: integer;
	
begin

	assign(maestro, 'maestro.txt');
	
	for i:= 1 to 30 do begin
	
		Str(i, aux);
		assign(v[i], aux + '.txt');
	
	end;
	
	actualizarMaestro(maestro, v);
	crearText(m);
 
end.
