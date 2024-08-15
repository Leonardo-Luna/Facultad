program p2e6;

const

	valorAlto = 9999;
	fechaAlta = 'ZZZ';
	tope = 5;

type

	regD = record
		cod_usuario: integer;
		fecha: string;
		tiempo_sesion: real;
	end;
	
	regM = record
		cod_usuario: integer;
		fecha: string;
		tiempo_total_de_sesiones_abiertas: real;
	end;
	
	archM = file of regM;
	archD = file of regD;
	
	vector = array[1..tope] of archD;
	vector2 = array[1.. tope] of regD;
	
procedure leer(var d: archD; var reg: regD);
begin

	if(not eof(d)) then
		read(d, reg)
	else
		reg.cod_usuario:= valorAlto;

end;

procedure minimo(var v: vector; var v2: vector2; var min: regD);
var

	i, pos: integer;
	
begin

	min.cod_usuario:= valorAlto;
	min.fecha:= fechaAlta;

	for i:= 1 to tope do begin
	
		if(v2[i].cod_usuario < min.cod_usuario) OR ((v2[i].cod_usuario < min.cod_usuario) AND (v2[i].fecha < min.fecha)) then begin
			min:= v2[i];
			pos:= i;
		end;
		
	end;
	
	if(min.cod_usuario <> valorAlto) then
		read(v[pos], v2[pos]);
		
end;
		
	
procedure merge(var v: vector; var m: archM);
var

	reg: regM;
	min: regD;
	v2: vector2;
	i: integer;

begin

	rewrite(m);
	for i:= 1 to tope do begin
		reset(v[i]);
		leer(v[i], v2[i]);
	end;
	
	minimo(v, v2, min);
	
	while(min.cod_usuario <> valorAlto) do begin
	
		reg.cod_usuario:= min.cod_usuario;
	
		while(reg.cod_usuario = min.cod_usuario) do begin
		
			reg.fecha:= min.fecha;
			reg.tiempo_total_de_sesiones_abiertas:= 0;
			
			while(reg.cod_usuario = min.cod_usuario) AND (reg.fecha = min.fecha) do begin
			
				reg.tiempo_total_de_sesiones_abiertas:= reg.tiempo_total_de_sesiones_abiertas + min.tiempo_sesion;
				minimo(v, v2, min);
			//Se me hacía raro q la fehca no se actualice en el minimo, asi que se filtra por 
			//codigo de usuario o codigo de usuario Y fecha por como se hizo el criterio de orden
			end;
			
			write(m, reg);
			
		end;
	
	end;
	
	close(m);
	for i:= 1 to tope do
		close(v[i]);

end;
	
var
	
	v: vector;
	m: archM;
	i: integer;
	aux: string;

begin

	assign(m, 'maestro.dat');
	for i:= 1 to tope do begin
		Str(i, aux);
		assign(v[i], 'det' + aux + '.dat');
	end;
	
	merge(v, m);

end.
