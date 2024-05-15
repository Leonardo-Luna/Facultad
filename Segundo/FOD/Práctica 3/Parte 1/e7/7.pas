program ej7;

type

	ave = record
		codigo: integer;
		nombre: string;
		familia: string;
		descripcion: string;
		zona: string;
	end;
	
	archM = file of ave;
	
procedure bajaLogica(var m: archM);
var

	cod: integer;
	regM: ave;
	
begin

	reset(m);
	
	readln(cod);
	while(not eof(m)) and (cod <> 5000) do begin
	
		read(m, regM);
		
		while(not eof(m)) and (regM.codigo <> cod) do begin
		
			read(m, regM);
		
		end;
		
		if(regM.codigo = cod) then begin
		
			regM.codigo:= -1;
			seek(m, filepos(m)-1);
			write(m, regM);
		
		end;
		
		readln(cod);
	
	end;
	
	close(m);

end;

procedure compactarArchivo(var m: archM);
var

	regM, aux: ave;
	pos: integer;

begin

	reset(m);
	
	while(not eof(m)) do begin
	
		read(m, regM);
		
		while(not eof(m)) and (regM.codigo >= 0) do
			read(m, regM);
			
		if(regM.codigo < 0) then begin
		
			pos:= filepos(m)-1;
		
			seek(m, filesize(m)-1);
			
			read(m, aux);
			
			while(aux.codigo < 0) do begin
				seek(m, filesize(m)-1);
				truncate(m);
				seek(m, filesize(m)-1);
				read(m, aux);
			end;
			
			seek(m, filepos(m)-1);
			truncate(m);
			seek(m, pos);
			write(m, aux);
		
		end;
		
	
	end;
	
	close(m);

end;
	
var

	m: archM;

begin

	assign(m, 'maestro.dat');
	bajaLogica(m);
	compactarArchivo(m);

end.
