program ejer9;

const

	valorAlto = 9999;

type

	regM = record
		codP: integer;
		codL: integer;
		num: integer;
		cant: integer;
	end;
	
	archM = file of regM;

procedure leerM(var m: archM; var reg: regM);
begin

	if(not eof(m)) then
		read(m, reg)
	else
		reg.codP:= valorAlto;

end;
	
procedure procesarVotos(var m: archM);
var

	reg, aux: regM;
	votosLoc, votosProv, votosTotal: integer;
	
begin

	reset(m);
	read(m, reg);
	votosTotal:= 0;
	
	while(reg.codP <> valorAlto) do begin
	
		aux:= reg;
		votosProv:= 0;
	
		while(aux.codP = reg.codP) do begin
		
			votosLoc:= 0;
			writeln('Código de provincia: ', aux.codP);
			writeln('Código de localidad: ', aux.codL);
		
			while((aux.codP = reg.codP) and (aux.codL = reg.codL)) do begin
			
				votosLoc:= votosLoc + reg.cant;
				leerM(m, reg);
			
			end;
			
			write('				', votosLoc);
			votosProv:= votosProv + votosLoc;
		
		end;
		
		writeln('Total de votos en la provincia: ', votosProv);
		votosTotal:= votosTotal + votosProv;
	
	end;
	
	writeln('Total general de votos: ', votosTotal);
	close(m);

end;
	
var

	m: archM;

begin

	assign(m, 'maestro.txt');
	
	procesarVotos(m);

end.
