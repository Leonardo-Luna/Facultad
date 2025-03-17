Program ejer5;
uses Crt;

type

	celular = record
		codigo: integer;
		nombre: string;
		descripcion: string;
		marca: string;
		precio: real;
		stockMin: integer;
		stockDisp: integer;
	end;
	
	archivo = file of celular;
	
procedure leer(var c: celular);
begin

	writeln('Ingrese el codigo de celular: ');
	readln(c.codigo);
	if(c.codigo > 0) then begin
	
		writeln('Ingrese el nombre: ');
		readln(c.nombre);
		writeln('Ingrese la descripcion: ');
		readln(c.descripcion);
		writeln('Ingrese la marca: ');
		readln(c.marca);
		writeln('Ingrese el precio: ');
		readln(c.precio);
		writeln('Ingrese el stock minimo: ');
		readln(c.stockMin);
		writeln('Ingrese el stock disponible: ');
		readln(c.stockDisp);
	end;
	
	ClrScr;
	
end;
	
procedure crearArchivo(var arch: archivo; var cel: Text);
var

	c: celular;

begin

	rewrite(arch);
	reset(cel);

	while(not eof(cel)) do begin
	
		readln(cel, c.codigo, c.precio, c.marca);
		readln(cel, c.stockDisp, c.stockMin, c.descripcion);
		readln(cel, c.nombre);
		write(arch, c);
		
	end;
	
	close(arch);
	close(cel);
	ClrScr;
	writeln('Archivo binario creado');
	
end;

procedure listarMenor(var arch: archivo);
var

	c: celular;
	
begin

	reset(arch);
	ClrScr;
	
	while(not eof(arch)) do begin
	
		read(arch, c);
		if(c.stockDisp < c.stockMin) then begin
		
			writeln(c.marca, ' ', c.nombre, ' - $ ', c.precio:0:2);
			writeln(c.descripcion);
			writeln('');
		
		end;
	
	end;
	
	close(arch);

end;

procedure listarDescripcion(var arch: archivo);
var

	cadena: string;
	c: celular;
	
begin
	
	ClrScr;
	writeln('Ingrese la cadena a buscar: ');
	readln(cadena);
	cadena:= ' ' + cadena;
	writeln('');
	
	reset(arch);
	
	while(not eof(arch)) do begin
	
		read(arch, c);
		if(c.descripcion = cadena) then begin
		
			writeln(c.marca, ' ', c.nombre, ' - $ ', c.precio:0:2);
			writeln(c.descripcion);
			writeln('');
			
		end;
		
	end;
	
	close(arch);

end;

procedure exportar(var arch: archivo; var cel: Text);
var

	c: celular;
	
begin

	reset(arch);
	rewrite(cel);
	
	while(not eof(arch)) do begin
	
		read(arch, c);
		writeln(cel, c.codigo, ' ', c.precio:0:2, ' ', c.marca);
		writeln(cel, c.stockDisp, ' ', c.stockMin, ' ', c.descripcion);
		writeln(cel, c.nombre);
	
	end;
	
	close(arch);
	close(cel);
	ClrScr;
	writeln('Exportado a [celulares.txt]');

end;

procedure agregar(var arch: archivo);
var

	c: celular;
	
begin

	reset(arch);
	seek(arch, filesize(arch));
	leer(c);
	
	while(c.codigo > 0) do begin
	
		write(arch, c);
		leer(c);
	
	end;
	
	close(arch);

end;

procedure modificarStock(var arch: archivo);
var

	nombre: string;
	stock: integer;
	c: celular;
	
begin

	writeln('Ingrese el nombre del telefono a modificar stock: ');
	readln(nombre);
	writeln('Ingrese el nuevo stock disponible: ');
	readln(stock);
	
	reset(arch); c.nombre:= '';
	
	while(not eof(arch) AND (c.nombre <> nombre)) do begin
	
		read(arch, c);
		if(c.nombre = nombre) then begin
		
			c.stockDisp:= stock;
			seek(arch, filepos(arch)-1);
			write(arch, c);
			writeln('Stock modificado correctamente');
			
		end;
		
	end;
	
end;

procedure exportarSinStock(var arch: archivo);
var

	c: celular;
	sinStock: Text;
	
begin

	reset(arch);
	assign(sinStock, 'SinStock.txt');
	rewrite(sinStock);
	
	while(not eof(arch)) do begin
	
		read(arch, c);
		if(c.stockDisp = 0) then
		
			writeln(sinStock, c.marca, ' ', c.nombre, ' [FUERA DE STOCK]');
	
	end;
	
	close(arch);
	close(sinStock);
	writeln('[SinStock.txt] creado');

end;

procedure imprimirTodo(var arch: archivo);
var

	c: celular;

begin

	reset(arch);
	
	while(not eof(arch)) do begin
	
		read(arch, c);
		writeln(c.marca, ' ', c.nombre, ' - $ ', c.precio:0:2);
		writeln(c.descripcion);
		writeln('');
		
	end;
	
	close(arch);

end;

procedure menu(var opcion: integer);
	begin
	
		writeln('');
		writeln('1 - Crear un archivo');
		writeln('2 - Listar en pantalla productos con stock menor al minimo');
		writeln('3 - Listar en pantalla con filtro de descripcion');
		writeln('4 - Exportar a .txt');
		writeln('5 - Agregar al final del listado');
		writeln('6 - Modificar stock');
		writeln('7 - Exportar sin stock');
		writeln('8 - Listar en pantalla todo');
		writeln('');
		writeln('Presiona 0 para salir');
		readln(opcion);
		
	end;
	
var

	arch: archivo;
	cel: Text;
	opcion: integer;
	nombre: string;

begin

	writeln('Ingrese el nombre del archivo (binario): ');
	readln(nombre);
	assign(arch, nombre);
	assign(cel, 'celulares.txt');
	ClrScr;
	writeln('Trabajando sobre [', nombre, ']');
	
	menu(opcion);

	while(opcion <> 0) do begin
		
		ClrScr;
		case (opcion) of
			1: crearArchivo(arch, cel);
			2: listarMenor(arch);
			3: listarDescripcion(arch);
			4: exportar(arch, cel);
			5: agregar(arch);
			6: modificarStock(arch);
			7: exportarSinStock(arch);
			8: imprimirTodo(arch);
		end;
		
		menu(opcion);
	
	end;
	
end.
