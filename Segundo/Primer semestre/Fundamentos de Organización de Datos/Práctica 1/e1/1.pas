Program ejer1;

type
	
	archivo = file of integer;
	
var

	arch: archivo;
	nombre: string;
	num: integer;
	
begin

	writeln('Ingrese el nombre del archivo ');
	readln(nombre);
	
	assign(arch, nombre);
	rewrite(arch);
	
	writeln('Ingrese numeros: ');
	readln(num);
	
	while(num <> 30000) do begin
	
		write(arch, num);
		readln(num)
		
	end;
	
	seek(arch, 0);
	while(not eof(arch)) do begin
	
		read(arch, num);
		writeln(num)
	
	end; //Todo este while es para comprobar el funcionamiento :)
	
	close(arch);

end.
