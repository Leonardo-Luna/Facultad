program p2e5;

const

	valorAlto = 9999;
	tope = 30;

type	

	regM = record
		cod: integer;
		nombre: string;
		descripcion: string;
		stockD: integer;
		stockM: integer;
		precio: real;
	end;
	
	archM = file of regM;
	
	regD = record
		cod: integer;
		ventas: integer;
	end;
	
	archD = file of regD;
	
	vector = array[1..tope] of archD;
	vector2 = array[1..tope] of regD;
	
procedure leer(var d: archD; var reg: regD);
begin

	if(not eof(d)) then
		read(d, reg)
	else
		reg.cod:= valorAlto;

end;

procedure minimo(var v: vector; var v2: vector2; var min: regD);
var

	i, pos: integer;

begin
	
	min.cod:= valorAlto;

	for i:= 1 to tope do begin
	
		if(v2[i].cod < valorAlto) then begin
			min:= v2[i];
			pos:= i;
		end;
		
	end;
	
	if(min.cod <> valorAlto) then
		leer(v[pos], v2[pos]);

end;

procedure listar(reg: regM; var listado: Text);
begin

	writeln(listado, reg.nombre, ' ', reg.descripcion, ' ', reg.stockD, ' ', reg.precio);

end;

procedure actualizarM(var m: archM; var v: vector);
var

	v2: vector2;
	reg: regM;
	min: regD;
	listado: Text;
	i: integer;

begin

	reset(m);
	for i:= 1 to tope do begin
		reset(v[i]);
		leer(v[i], v2[i]);
	end;
	rewrite(listado);
	
	minimo(v, v2, min);
	
	while(min.cod <> valorAlto) do begin
	
		read(m, reg);
		while(reg.cod <> min.cod) do
			read(m, reg);
			
		while(min <> valorAlto) AND (reg.cod = min.cod) do begin
		//En este caso, min puede ser igual a valor alto por la forma en la que se hizo el módulo que lo calcula
			reg.stockD:= reg.stockD - min.ventas;
			
			minimo(v, v2, min);
		
		end;
		
		seek(m, filepos(m)-1);
		write(m, reg);
		
		if(reg.stockD < reg.stockM) then
			listar(reg, listado);
	
	end;
	
	close(m);
	for i:= 1 to tope do
		close(v[i]);
	close(listado);

end;

var

	v: vector;
	m: archM;
	i: integer;
	aux: string;
	
begin
	
	for i:= 1 to tope do begin
		Str(i, aux);
		assign(v[i], 'det' + aux + '.dat');
	end;
	
	assign(m, 'maestro.dat');
	
	actualizarM(m, v);

end.
