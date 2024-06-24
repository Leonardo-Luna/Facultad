program p3e4;

type

	reg_flor = record
		nombre: String[45];
		codigo: integer;
	end;
	
	tArchFlores = file of reg_flor;

procedute agregarFlor(var a: tArchFlores; nombre: string; codigo: integer);
var

	dato, aux: reg_flor;
	
begin

	dato.nombre:= nombre;
	dato.codigo:= codigo;

	read(a, aux);
	
	if(aux.cod = 0) then begin	
		seek(a, filesize(a));
		write(a, dato);
	end
	else begin
		seek(a, (aux.codigo*-1));
		read(a, aux);
		seek(a, filepos(a)-1);
		write(a, dato);
		seek(a, 0);
		write(a, aux);
	end;

end;

procedure bajaFlor(var a: tArchFlores; flor: reg_flor);
var

	dato, aux: reg_flor;
	ok: boolean;

begin

	read(a, aux);
	ok:= true;
	
	while(not eof(a) and (ok)) do begin
	
		read(a, dato);
		
		if(dato.codigo = flor.cod) then begin
		
			ok:= false;
			seek(a, filepos(a)-1);
			write(a, aux);
			aux.codigo:= (filepos(a)-1)*-1;
			seek(a, 0);
			write(a, aux);
			
		end;
		
	end;

end;

begin


end.
