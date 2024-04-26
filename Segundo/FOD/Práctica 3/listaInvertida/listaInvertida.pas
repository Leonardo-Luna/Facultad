program listaInvertida;

type

	archivo = file of integer;
	
procedure crearBinario(var a: archivo; var aTxt: Text);
var

	int: integer;
	
begin

	reset(aTxt);
	rewrite(a);
	
	while(not eof(aTxt)) do begin
	
		readln(aTxt, int);
		write(a, int);
	
	end;
	
	close(aTxt);
	close(a);

end;

procedure borrarDatos(var a: archivo);
var

	num, dato, pos, cabecera: integer;
	encontre: boolean;

begin

	writeln('Ingresar numero (<> 0)');
	readln(num);
	reset(a);

	while(num > 0) do begin
	
		encontre:= false;
		
		seek(a, 0);
		read(a, cabecera);
	
		while(not eof(a)) and (not encontre) do begin
		
			read(a, dato);
			if(dato = num) then begin
				encontre:= true;
				
				seek(a, filepos(a)-1);
				write(a, cabecera);
				
				pos:= (filepos(a)-1) * -1;
				seek(a, 0);
				write(a, pos);
			end;
		
		end;
		
		if(encontre) then
			writeln('Dato borrado')
		else
			writeln('No encontrado');
		
		readln(num);
	
	end;

	close(a);

end;

procedure exportarTxt(var a: archivo; var aTxt: Text);
var

	dato: integer;
	
begin

	rewrite(aTxt);
	reset(a);
	
	while(not eof(a)) do begin
	
		read(a, dato);
		writeln(aTxt, dato);
	
	end;
	
	close(aTxt);
	close(a);

end;

procedure altaDatos(var a: archivo);
var

	num, cabecera: integer;

begin

	reset(a);
	
	writeln('Ingresar numero (num > 0)');
	readln(num);
	
	while(num > 0) do begin
	
		seek(a, 0);
		read(a, cabecera);
		
		if(cabecera = 0) then begin
		
			seek(a, filesize(a));
			write(a, num);
			
		end
		else begin
		
			seek(a, (cabecera*-1));
			read(a, cabecera);
			seek(a, filepos(a)-1);
			write(a, num);
			
			seek(a, 0);
			write(a, cabecera);
		
		end;
		
		writeln('Ingresar numero (num > 0)');
		readln(num);
	
	end;
	
	close(a);

end;

var

	a: archivo;
	aTxt: Text;

begin

	assign(a, 'listaInvertida.dat');
	assign(aTxt, 'listaInvertida.txt');
	
	crearBinario(a, aTxt);
	
	borrarDatos(a);
	exportarTxt(a, aTxt);
	altaDatos(a);
	exportarTxt(a, aTxt);

end.
