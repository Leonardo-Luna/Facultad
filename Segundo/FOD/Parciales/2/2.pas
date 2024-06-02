program parcial2;

type

	profesional = record
		DNI: integer;
		nombre: string;
		apellido: string;
		sueldo: real;
	end;
	
	tArchivo = file of profesional;

procedure crear(var arch: tArchivo; var info: Text);
var

	p: profesional;
	
begin

	reset(info);
	rewrite(arch);

	while(not eof(info)) do begin
	
		with p do begin
		
			readln(info, DNI);
			readln(info, nombre);
			readln(info, apellido);
			readln(info, sueldo);
		
		end;
		
		write(arch, p);
	
	end;
	
	close(info);
	close(arch);

end;

procedure agregar(var arch: tArchivo; p: profesional);
var

	cabecera: profesional;

begin

	read(arch, cabecera);
	
	if(cabecera.DNI = 0) then begin
		seek(arch, filesize(arch));
		write(arch, p);
	end
	else begin
		seek(arch, (cabecera.dni*-1));
		read(arch, cabecera);
		seek(arch, filepos(arch)-1);
		write(arch, p);
		
		seek(arch, 0);
		write(a, cabecera);
	end;
	
	close(arch);

end;

procedure eliminar(var arch: tArchivo; DNI: integer; var bajas: Text);
var

	pos: integer;
	encontre: boolean;
	p, cabecera: profesional;

begin

	reset(arch);
	reset(bajas);
	
	encontre:= false;
	read(arch, cabecera);
	
	while(not eof(arch)) and (not encontre) do begin
	
		read(arch, p);
		
		if(p.DNI = DNI) then begin
		
			encontre:= true;
			writeln(bajas, p.DNI, p.nombre, p.apellido, p.sueldo);
			
			seek(arch, filepos(arch)-1);
			write(arch, cabecera);
			
			cabecera.DNI:= ((filepos(arch)-1)*-1);
			seek(arch, 0);
			write(arch, cabecera);
		
		end;
	
	end;
	
	close(arch);
	close(bajas);

end;

var

	arch: tArchivo;
	info, bajas: Text;
	dni: integer;
	p: profesional;
	
begin

	assign(arch, 'archivoProfesionales.dat');
	assign(info, 'archivoTexto.txt');
	assign(bajas, 'archivoBajas.txt');
	
	//No pide hacer el programa principal, tampoco tiene condición de corte en la lectura asi que no hice módulo de nada
	
	crear(arch, info);
	agregar(arch, p);
	eliminar(arch, dni, bajas);

end.
