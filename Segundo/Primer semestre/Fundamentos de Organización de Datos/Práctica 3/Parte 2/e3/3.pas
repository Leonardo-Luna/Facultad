program ej3_2;

type

	regM = record
		cod_usuario: integer;
		fecha: string;
		tiempo_total_de_sesiones_abiertas: real;
	end;
	
	regD = record
		cod_usuario: integer;
		fecha: string;
		tiempo_sesion: real;
	end;
	
	archM = file of regM;
	archD = file of regD;
	vector = array[1..5] of archD;
	
procedure mergear(var m: archM; v: vector);
var

	reg: regM;
	det: regD;
	i: integer;
	
begin

	rewrite(m);
	for i:= 1 to 5 do
		reset(v[i]);
		
	for i:= 1 to 5 do begin
	
		while(not eof(v[i])) do begin
		
			read(v[i], det);
			seek(m, 0);
			
			if(not eof(m)) then
				read(m, reg);
				
			while(not eof(m)) and (reg.cod_usuario <> det.cod_usuario) do
				read(m, reg);
			
			if(reg.cod_usuario = det.cod_usuario) and (reg.fecha = det.fecha) then
				reg.tiempo_total_de_sesiones_abiertas:= reg.tiempo_total_de_sesiones_abiertas + det.tiempo_sesion;
			else begin //Esto solo es en caso de que tenga que almacenarse por fecha, si no es necesario, solo borro el else
				reg.cod_usuario:= det.cod_usuario;
				reg.fecha:= det.fecha;
				reg.tiempo_total_de_sesiones_abiertas:= det.tiempo_sesion;;
			end;
		
			seek(m, filepos(m)-1);
			write(m, reg);
		
		end;
	
	end;
		
	close(m);
	for i:= 1 to 5 do
		close(v[i]);
end;

var

	m: archM;
	v: vector;
	i: integer;
	aux: string;

begin

	assign(m, 'maestro.txt');
	for i:= 1 to 5 do begin
		Str(i, aux);
		assign(v[i], 'det'+aux);
	end;

end.
