program ejer4_5;

uses Crt;

type

	reg_flor = record
		nombre: string[45];
		codigo: integer;
	end;
	
	tArchFlores = file of reg_flor;
	
procedure agregarFlor(var a: tArchFlores; nombre: string; codigo: integer);
var

	aux,cabecera: reg_flor;

begin

	reset(a);
	
	aux.nombre:= nombre;
	aux.codigo:= codigo;
	
	read(a, cabecera);
	
	if(cabecera.codigo = 0) then begin
	
		seek(a, filesize(a));
		write(a, aux);
	
	end
	else begin
		
		seek(a, cabecera.codigo*-1);
		read(a, cabecera);
		seek(a, filepos(a)-1);
		write(a, aux);
		
		seek(a, 0);
		write(a, cabecera);
	
	end;
	
	close(a);

end;

procedure eliminarFlor(var a: tArchFlores; flor: reg_flor);
var

	cabecera, aux: reg_flor;
	encontre: boolean;
	
begin

	reset(a);
	encontre:= false;
	
	read(a, cabecera);
	
	while(not eof(a)) and (not encontre) do begin
	
		read(a, aux);
		
		if(aux.codigo = flor.codigo) then begin
		
			encontre:= true;			
			seek(a, filepos(a)-1);
			write(a, cabecera);
			cabecera.codigo:= (filepos(a)-1)*-1;
			seek(a, 0);
			write(a, cabecera);
		
		end;
	
	end;
	
	close(a);

end;

procedure exportarTxt(var a: tArchFlores);
var

	t: Text;
	aux: reg_flor;
	
begin

	reset(a);
	assign(t, 'flores.txt');
	rewrite(t);
	
	while(not eof(a)) do begin
	
		read(a, aux);
		
		if(aux.codigo > 0) then begin
		
			writeln(t, aux.nombre);
			writeln(t, aux.codigo);
		
		end;
	
	end;
	
	close(a);
	close(t);
	
end;

var

	a: tArchFlores;
	flor: reg_flor;
	c: char;

begin

	assign(a, 'flores.dat');
	
	agregarFlor(a, 'rosa', 3);
	exportarTxt(a);
	
	c:= ReadKey;
	
	flor.nombre:= 'rosa';
	flor.codigo:= 3;
	
	eliminarFlor(a, flor);
	exportarTxt(a);

end.
