program parcial3;

const

	tope = 20;
	valorAlto = 9999;

type

	producto = record
		cod: integer;
		nombre: string;
		precio: real;
		stockActual: integer;
		stockMinimo: integer;
	end;
	
	det = record
		cod: integer;
		ventas: integer;
	end;
	
	archM = file of producto;
	archD = file of det;

	vector = array[1..tope] of archD;
	vecReg = array[1..tope] of det;
	
procedure leer(var v: vector; var regD: vecReg);
var

	i: integer;
	
begin

	for i:= 1 to tope do begin
		
		if(not eof(v[i])) then
			read(v[i], regD[i])
		else
			regD[i].cod:= valorAlto;
			
	end;

end;

procedure minimo(var v: vector; var regD: vecReg; var min: det);
var

	pos, i: integer;
	
begin

	for i:= 1 to tope do begin
	
		if(regD[i].cod < min.cod) then begin
			min:= regD[i];
			pos:= i;
		end;
		
	end;
	
	if(pos <> valorAlto) then
		read(v[pos], regD[pos]);

end;

procedure escribirSupera(var reg: producto; var supera: Text);
begin

	with reg do begin
	
		writeln(supera, cod);
		writeln(supera, nombre);
		writeln(supera, precio);
		writeln(supera, stockActual);
		writeln(supera, stockMinimo);
	
	end;

end;

procedure procesarArchivos(var m: archM; var v: vector; var supera: Text);
var

	regD: vecReg;
	regM: producto;
	min: det;
	total: real;
	i: integer;
	
begin

	reset(m);
	reset(supera);
	
	for i:= 1 to tope do
		reset(v[i]);
	
	min.cod:= valorAlto;
		
	leer(v, regD);
	minimo(v, regD, min);
	
	while(min.cod <> valorAlto) do begin
	
		read(m, regM);
		total:= 0;
		
		while(regM.cod <> min.cod) do
			read(m, regM);
			
		while(regM.cod = min.cod) do begin
		
			regM.stockActual:= regM.stockActual - min.ventas;
			total:= total + min.ventas*regM.precio;
			
			minimo(v, regD, min);
			
		end;
		
		seek(m, filepos(m)-1);
		write(m, regM);
		
		if(total > 10000) then
			escribirSupera(regM, supera);
	
	
	end;
	
	close(m);
	close(supera);
	
	for i:= 1 to tope do
		close(v[i]);

end;
	
var

	m: archM;
	v: vector;
	i: integer;
	aux: string;
	supera: text;

begin

	assign(m, 'maestro.dat');
	assign(supera, 'superan10000.txt');
	
	for i:= 1 to tope do begin
	
		Str(i, aux);
		assign(v[i], 'det' + aux + '.dat');
	
	end;
	
	procesarArchivos(m, v, supera);

end.
