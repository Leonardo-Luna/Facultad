program ejer13;

const
	
	valorAlto = '9999';
	tope = 2;

type

	regM = record
		destino: string;
		fecha: string;
		hora: integer;
		cantAsientos: integer;
	end;
	
	regD = record
		destino: string;
		fecha: string;
		hora: integer;
		cantComprados: integer;
	end;
	
	archM = file of regM;
	archD = file of regD;
	
	vector = array[1..tope] of archD;
	vector2 = array[1..tope] of regD;
	
	listaReg = record
		destino: string;
		fecha: string;
		hora: integer;
	end;
	
	lista = ^nodo;
	
	nodo = record
		dato: listaReg;
		sig: lista;
	end;
	
procedure leerM(var m: archM; var reg: regM);
begin

	if(not eof(m)) then
		read(m, reg)
	else
		reg.destino:= valorAlto;
		
end;

procedure leerD(var d: archD; var r: regD);
begin

	if(not eof(d)) then
		read(d, r)
	else
		r.destino:= valorAlto;
			
end;

procedure minimo(var v: vector; var v2: vector2; var min: regD);
var
	
	posMin, i: integer;

begin

	min.destino:= valorAlto;

	for i:= 1 to tope do begin
	
		if(v2[i].destino > min.destino) then begin
			min:= v2[i];
			posMin:= i;
		end;
		
	end;
	
	if(min.destino <> valorAlto) then
		leerD(v[posMin], v2[posMin]);

end;

procedure resetDetalles(var v: vector);
var

	i: integer;
	
begin

	for i:= 1 to tope do
	
		reset(v[i]);

end;

procedure closeDetalles(var v: vector);
var

	i: integer;
	
begin

	for i:= 1 to tope do
	
		close(v[i]);

end;

procedure agregarLista(var L, ult: lista; reg: regM; cant: integer);
var

	n: lista;
	
begin

	if(reg.cantAsientos < cant) then begin
	
		new(n);
		n^.dato.destino:= reg.destino;
		n^.dato.fecha:= reg.fecha;
		n^.dato.hora:= reg.hora;
		n^.sig:= nil;
	
		if(L = nil) then
			L:= n
		else
			ult^.sig:= n;
			
		ult:= n;
		
	end;

end;

procedure exportarLista(L: lista);
var

	t: Text;
	r: listaReg;
	
begin

	assign(t, 'ListaVuelos.txt');
	rewrite(t);
	
	while(L <> nil) do begin
	
		r:= L^.dato;
		L:= L^.sig;
		
		writeln(t, r.destino);
		writeln(t, r.fecha);
		writeln(t, r.hora);
		
	end;
	
	close(t);
	
end;
	
procedure actualizarMaestro(var m: archM; var v: vector);
var

	reg: regM;
	v2: vector2;
	min: regD;
	L, ult: lista;
	cant, i: integer;

begin

	L:= nil; ult:= nil;
	reset(m);
	resetDetalles(v);
	
	writeln('Ingrese la cantidad de asientos minima para la lista de vuelos: ');
	readln(cant);
	
	for i:= 1 to tope do
		
		leerD(v[i], v2[i]);
		
	minimo(v, v2, min);
	
	while(min.destino <> valorAlto) do begin
	
		leerM(m, reg);
		
		while(reg.destino <> min.destino) do
			leerM(m, reg);
			
		while(min.destino = reg.destino) do begin
		
			while(reg.fecha <> min.fecha) do
				leerM(m, reg);
		
			while(min.destino = reg.destino) and (min.fecha = reg.fecha) do begin
			
				while(reg.hora <> min.hora) do
					leerM(m, reg);
			
				while(min.destino = reg.destino) and (min.fecha = reg.fecha) and (min.hora = reg.hora) do begin
				
					if(reg.cantAsientos >= min.cantComprados) then
						reg.cantAsientos:= reg.cantAsientos - min.cantComprados;
					minimo(v, v2, min);
				
				end;
				
				agregarLista(L, ult, reg, cant);
				seek(m, filepos(m)-1);
				write(m, reg);
				leerM(m, reg);
				
			end;
			
		end;
		
	end;
	
	exportarLista(L);
	
	closeDetalles(v);
	close(m);

end;

var

	m: archM;
	v: vector;
	i: integer;
	aux: string;
	
begin

	assign(m, 'maestro.dat');
	
	for i:= 1 to tope do begin
	
		Str(i, aux);
		assign(v[i], aux + '.dat');
		
	end;
	
	actualizarMaestro(m, v);

end.
