program ejer3;

const
valorAlto = 9999;

type
	
	regM = record
		codigo: integer;
		nombre: string;
		precio: real;
		stockActual: integer;
		stockMinimo: integer;
	end;
	
	archM = file of regM;
	
procedure cargarMaestro(var arch: archM; var archTxt: Text);
var

	reg: regM;
	separador: string;
	
begin

	rewrite(arch);
	reset(archTxt);

	while(not eof(archTxt)) do begin
	
		readln(archTxt, reg.codigo);
		readln(archTxt, reg.nombre);
		readln(archTxt, reg.precio);
		readln(archTxt, reg.stockActual);
		readln(archTxt, reg.stockMinimo);
		readln(archTxt, separador);
		
		write(arch, reg);
	
	end;
	
	close(arch);
	close(archTxt);

end;

procedure leerM(var archM: archM; var reg: regM);
begin

	if(not eof(archM)) then
		read(archM, reg)
	else
		reg.codigo:= valorAlto;

end;

procedure leerD(var det: Text; var codigo, ventas: integer);
begin

	if(not eof(det)) then begin
	
		readln(det, codigo);
		readln(det, ventas);
	
	end
	else
		codigo:= valorAlto;

end;

procedure actualizarMaestro(var mae: archM; var det: Text);
var
	
	codigo: integer;
	ventas: integer;
	reg: regM;

begin

	reset(mae);
	reset(det);
	
	leerD(det, codigo, ventas);
	
	while(codigo <> valorAlto) do begin
	
		read(mae, reg);
		
		if(reg.codigo = codigo) then begin
			reg.stockActual:= reg.stockActual - ventas;
			leerD(det, codigo, ventas);
			seek(mae, filepos(mae)-1);
			write(mae, reg);
		end;
	
	end;
	
	close(mae);
	close(det);

end;

procedure exportarMaestro(var archM: archM; var maestroTxt: Text);
var
	reg: regM;
	
begin

	rewrite(maestroTxt);
	reset(archM);
	
	leerM(archM, reg);
	
	while(reg.codigo <> valorAlto) do begin
	
		writeln(maestroTxt, reg.codigo);
		writeln(maestroTxt, reg.nombre);
		writeln(maestroTxt, reg.precio:0:2);
		writeln(maestroTxt, reg.stockActual);
		writeln(maestroTxt, reg.stockMinimo);
		writeln(maestroTxt, '-------');
		
		leerM(archM, reg);
		
	end;
	
	close(archM);
	close(maestroTxt);

end;

procedure exportarStockMinimo(var m: archM; var s: Text);
var

	reg: regM;
	
begin

	reset(m);
	rewrite(s);
	
	leerM(m, reg);
	while(reg.codigo <> valorAlto) do begin
	
		if(reg.stockActual < reg.stockMinimo) then begin
			writeln(s, reg.codigo);
			writeln(s, reg.nombre);
			writeln(s, reg.precio:0:2);
			writeln(s, reg.stockActual);
			writeln(s, reg.stockMinimo);
			writeln(s, '-------');
		end;
		
		leerM(m, reg);
	
	end;
	
	close(m);
	close(s);

end;

var

	maestro: archM;
	det, maestroTxt, stockMin: Text;

begin

	assign(maestro, 'maestro.dat');
	assign(det, 'detalle.txt');
	assign(maestroTxt, 'maestroT.txt');
	assign(stockMin, 'stock_minimo.txt');
	
	cargarMaestro(maestro, maestroTxt);
	actualizarMaestro(maestro, det);
	exportarMaestro(maestro, maestroTxt);
	exportarStockMinimo(maestro, stockMin);

end.
