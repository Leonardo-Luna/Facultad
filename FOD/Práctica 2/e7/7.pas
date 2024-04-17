program ejer7;

const

	valorAlto = 9999;
	tope = 10;

type

	regD = record
		localidad: integer;
		cepa: integer;
		cantActivos: integer;
		cantNuevos: integer;
		cantRecuperados: integer;
		cantFallecidos: integer;
	end;
	
	archD = file of regD;
	
	regM = record
		localidad: integer;
		nombreLoc: string;
		cepa: integer;
		cantActivos: integer;
		cantNuevos: integer;
		cantRecuperados: integer;
		cantFallecidos: integer;
	end;
	
	archM = file of regM;
	
	vector = array[1..tope] of archD;
	vector2 = array[1..tope] of regD;
	
procedure resetearD(var v: vector);
var

	i: integer;
	
begin

	for i:= 1 to tope do
		reset(v[i]);
		
end;

procedure cerrarD(var v: vector);
var

	i: integer;
	
begin

	for i:= 1 to tope do
		reset(v[i]);
		
end;

procedure leerM(var m: archM; var reg: regM);
begin

	if(not eof(m)) then
		read(m, reg)
	else
		reg.localidad:= valorAlto;
		
end;

procedure leerD(var d: archD; var r: regD);
begin

	if(not eof(d)) then
		read(d, r)
	else
		r.localidad:= valorAlto;
		
end;

procedure minimo(var v: vector; var v2: vector2; var min: regD);
var

	i, posMin: integer;
	
begin

	min.localidad:= valorAlto;

	for i:= 1 to tope do begin
	
		if(v2[i].localidad <= min.localidad) then begin
			min:= v2[i];
			posMin:= i;
		end
		
	end;
	
	if(min.localidad <> valorAlto) then
		leerD(v[posMin], v2[posMin]);
		
end;
		
procedure actualizarMaestro(var m: archM; var v: vector);
var

	vecDet: vector2;
	aux, min: regD;
	regMae: regM;
	i: integer;

begin

	resetearD(v);
	reset(m);
	
	for i:= 1 to tope do
		leerD(v[i], vecDet[i]);
		
	minimo(v, vecDet, min);
	
	while(min.localidad <> valorAlto) do begin
	
		leerM(m, regMae);
		
		while(regMae.localidad <> min.localidad) do
			leerM(m, regMae);
			
		while(regMae.localidad = min.localidad) do begin
		
			aux.cantActivos:= 0;
			aux.cantNuevos:= 0;
		
			while((regMae.localidad = min.localidad) and (regMae.cepa = min.cepa)) do begin
			
				aux.cantActivos:= aux.cantActivos + min.cantActivos;
				aux.cantNuevos:= aux.cantNuevos + min.cantNuevos;
				regMae.cantFallecidos:= regMae.cantFallecidos + min.cantFallecidos;
				regMae.cantRecuperados:= regMae.cantRecuperados + min.cantRecuperados;
				
				minimo(v, vecDet, min);
				
			end;
			
			regMae.cantActivos:= aux.cantActivos;
			regMae.cantNuevos:= aux.cantNuevos;
			
			seek(m, filepos(m)-1);
			write(m, regMae);
			
		end;
	
	end;
	
	cerrarD(v);
	close(m);

end;
		
var
		
	i: integer;
	maestro: archM;
	v: vector;
	aux: string;
		
begin

	assign(maestro, 'maestro.txt');
	
	for i:= 1 to tope do begin
	
		Str(i, aux);
		assign(v[i], aux + '.txt');
	
	end;

end.
