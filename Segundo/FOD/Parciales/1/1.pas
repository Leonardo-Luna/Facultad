program parcial1;

const

	tope = 3;
	valorAlto = 9999;

type

	productos = record
		cod: integer;
		nombre: string;
		descripcion: string;
		codigoBarras: string;
		categoria: string;
		stockActual: integer;
		stockMinimo: integer;
	end;
	
	archM = file of productos;
	
	mail = record
		cod: integer;
		cantidad: integer;
		descripcion: string;
	end;
	
	archD = file of mail;
	
	vector = array[1..tope] of archD;
	vecReg = array[1..tope] of mail;
	
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

procedure minimo(var v: vector; var regD: vecReg; var min: mail);
var

	pos, i: integer;
	
begin

	for i:= 1 to tope do begin
	
		if(regD[i].cod < min.cod) then begin
			min:= regD[i];
			pos:= i;
		end;
	
	end;
	
	if(min.cod <> valorAlto) then
		read(v[pos], regD[pos]);

end;
	
procedure actualizarMaestro(var m: archM; var v: vector); //Paso el vector por referencia porque los archivos siempre pide pasarlos así?
var
	
	regM: productos;
	min: mail;
	i: integer;
	regD: vecReg;
	
begin

	reset(m);
	
	for i:= 1 to tope do
		reset(v[i]);
		
	min.cod := valorAlto;
		
	read(m, regM);
	leer(v, regD);
	minimo(v, regD, min);
		
	while(not eof(m)) do begin
		
		while(regM.cod <> min.cod) do
			read(m, regM);
			
		seek(m, filepos(m)-1);
		
		while(min.cod <> valorAlto) and (min.cod = regM.cod) do begin
		
			if(regM.stockActual > 0) then begin
			
				if(min.cantidad > regM.stockActual) then begin
					writeln('No se pudo satisfacer por completo la cantidad pedida del producto ', min.cod);
					writeln('Diferencia de ', min.cantidad-regM.stockActual, ' unidades.');
					regM.stockActual:= 0;
				end
				else
					regM.stockActual:= regM.stockActual - min.cantidad;
					
			end;
			
			write(m, regM);
			minimo(v, regD, min);
			
			if(regM.stockActual < regM.stockMinimo) then
				writeln('El producto ', regM.cod, ' quedó con Stock Actual por debajo del Mínimo');
		
		end;
		
		read(m, regM);
	
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
		assign(v[i], 'det' + aux);
	end;
	
	actualizarMaestro(m, v);

end.
