program ejer6;

const

	valorAlto = 9999;
	tope = 5;

type

	regD = record
		cod_usuario: integer;
		fecha: string;
		tiempo_sesion: real;
	end;
	
	archD = file of regD;
	
	regM = record
		cod_usuario: integer;
		fecha: string;
		tiempo_total_de_sesiones_abiertas: real;
	end;
	
	archM = file of regM;
	
	vector = array[1..tope] of archD;
	vector2 = array[1..tope] of regD;
	
procedure resetearD(var v: vector);
var

	i: integer;
	
begin

	for i:= 1 to tope do begin
	
		reset(v[i]);
	
	end;

end;

procedure cerrarD(var v: vector);
var

	i: integer;
	
begin

	for i:= 1 to tope do begin
	
		close(v[i]);
	
	end;

end;

procedure leerD(var d: archD; var r: regD);
begin

	if(not eof(d)) then
		read(d, r)
	else
		r.cod_usuario:= valorAlto;

end;

procedure minimo(var v: vector; var v2: vector2; var min: regD);
var

	posMin, i: integer;
	
begin

	min.cod_usuario:= valorAlto;

	for i:= 1 to tope do begin
	
		if(v2[i].cod_usuario <= min.cod_usuario) then begin
		
			min:= v2[i];
			posMin:= i;
		
		end;
	
	end;
	
	if(min.cod_usuario <> valorAlto) then
		leerD(v[posMin], v2[posMin]);

end;
	
procedure mergear(var m: archM; var v: vector);
var

	regMae: regM;
	min: regD;
	i: integer;
	vecDet: vector2;

begin

	rewrite(m);
	resetearD(v);
	
	for i:= 1 to tope do
		leerD(v[i], vecDet[i]);
		
	minimo(v, vecDet, min);
	
	while(min.cod_usuario <> valorAlto) do begin
	
		regMae.cod_usuario:= min.cod_usuario;
		regMae.fecha:= min.fecha;
		regMae.tiempo_total_de_sesiones_abiertas:= 0;
		
		if(regMae.cod_usuario = min.cod_usuario) then begin
		
			while(regMae.cod_usuario = min.cod_usuario) do begin
		
				regMae.tiempo_total_de_sesiones_abiertas:= regMae.tiempo_total_de_sesiones_abiertas + min.tiempo_sesion;
				minimo(v, vecDet, min);
				
			end
			
		end
		else
		
			regMae.tiempo_total_de_sesiones_abiertas:= min.tiempo_sesion;
			
		write(m, regMae);
	
	end;
		
	close(m);
	cerrarD(v);

end;

var

	maestro: archM;
	v: vector;
	i: integer;
	aux: string;

begin

	assign(maestro, '.\var\log\maestro.txt');
	
	for i:= 1 to tope do begin
	
		Str(i, aux);
		assign(v[i], 'maquina' + aux + '.txt');
	
	end;
	
	mergear(maestro, v);

end.
