Program e1;

type

	ingresos = record
		codigo: integer;
		nombre: string;
		monto: real;
	end;
	
	archivo = file of ingresos;
		
	lista = ^nodo;
	
	nodo = record
		dato: ingresos;
		sig: lista;
	end;
	
procedure crearBinario(var detalle: archivo; var txt: Text);
var

	ing: ingresos;

begin

	rewrite(detalle);
	reset(txt);
	
	while(not eof(txt)) do begin
		
		readln(txt, ing.codigo);
		readln(txt, ing.monto, ing.nombre);
		write(detalle, ing);
	
	end;

	close(detalle);
	close(txt);

end;

function actualizar(reg: ingresos; L: lista): boolean;
var
	
	seguir: boolean;
	
begin

	seguir:= true;

	while((L <> nil) and (seguir)) do begin
	
		if(L^.dato.codigo = reg.codigo) then begin
		
			L^.dato.monto := L^.dato.monto + reg.monto;
			seguir:= false;
		
		end
		else begin
		
			L:= L^.sig;
			
		end;
		
	end;
	
	if(seguir) then
		actualizar:= true
	else
		actualizar:= false;

end;
	
procedure agregarAtras(reg: ingresos; var L, ult: lista);
var

	nuevo: lista;
	

begin
	
	new(nuevo);
	nuevo^.dato:= reg;
	nuevo^.sig:= nil;
	
	if(L = nil) then begin
	
		L:= nuevo;
		ult:= nuevo;
			
	end
	else begin
	
		if(actualizar(reg, L)) then begin
	
			ult^.sig:= nuevo;
			ult:= nuevo;
			
		end;
		
	end;

end;
	
procedure cargarLista(var detalle: archivo; var L, ult: lista);
var

	reg: ingresos;

begin

	reset(detalle);

	while(not eof(detalle)) do begin
	
		read(detalle, reg);
		agregarAtras(reg, L, ult);
	
	end;
	
	close(detalle);

end;

procedure crearMaestro(var maestro: archivo; L: lista);
var

	reg: ingresos;
	
begin

	rewrite(maestro);

	while(L <> nil) do begin
	
		reg:= L^.dato;
		write(maestro, reg);
		L:= L^.sig;
	
	end;
	
	close(maestro);

end;
	
procedure exportar(var arch: archivo; var txt: Text);
var

	ing: ingresos;
	
begin

	reset(arch);
	rewrite(txt);
	
	while(not eof(arch)) do begin
		
		read(arch, ing);
		writeln(txt, ing.codigo);
		writeln(txt, ing.monto:0:2, ing.nombre);
	
	end;
	
	close(arch);
	close(txt);

end;

var
	
	maestro, detalle: archivo;
	txt, maestroTxt: Text;
	L, ult: lista;

begin

	L:= nil; ult:= nil;

	assign(detalle, 'detalle.dat');
	assign(maestro, 'maestro.dat');
	assign(txt, 'detalle.txt');
	assign(maestroTxt, 'maestro.txt');
	
	crearBinario(detalle, txt);
	cargarLista(detalle, L, ult);
	crearMaestro(maestro, L);
	exportar(maestro, maestroTxt);
	
	//						Explicación breve de la fumada que me mandé:
	//Supuse que teníamos todos los datos en un archivo binario, pero como no tenía ganas de leer de teclado,
	//hice un archivo de texto, lo pasé a binario y recién ahí empecé a trabajar con eso.
	//Tampoco pide que se exporte el maestro a txt, pero lo hice para corroborar que esté bien.
	//Pensé en usar una lista ordenada, pero siendo que el archivo ya estaba ordenado, solo era necesario
	//un agregar atrás y actualizar en caso de que se repita el código, entonces hice eso :D
	

end.
