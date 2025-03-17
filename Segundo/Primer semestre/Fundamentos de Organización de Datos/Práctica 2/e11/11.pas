program ejer11;

const

	valorAlto = 9999;

type

	f = record
		anio: integer;
		mes: integer;
		dia: integer;
	end;

	regM = record
		fecha: f;
		idUsuario: integer;
		tiempoAcceso: real;
	end;
	
	archM = file of regM;

procedure leerM(var m: archM; var reg: regM);
begin

	if(not eof(m)) then
		read(m, reg)
	else
		reg.fecha.anio:= valorAlto;
	
end;

procedure procesar(var m: archM);
var

	reg, aux: regM;
	tiempoDiaEmpleado, tiempoDia, tiempoMes, tiempoAnio: real;
	anioBusq: integer;
	encontre: boolean;
	
begin

	leerM(m, reg);
	writeln('Ingrese el anio a buscar: ');
	readln(anioBusq);
	encontre:= false;
	
	while(reg.fecha.anio <> valorAlto) or (encontre) do begin
	
		tiempoAnio:= 0;
		
		if(reg.fecha.anio <> valorAlto) and (reg.fecha.anio <> anioBusq) then
			leerM(m, reg);
			
		while(reg.fecha.anio = anioBusq) do begin
		
			encontre:= true;
			aux:= reg;
			tiempoMes:= 0;
			
			while(reg.fecha.anio = anioBusq) and (reg.fecha.mes = aux.fecha.mes) do begin
			
				tiempoDia:= 0;
				
				while(reg.fecha.anio = anioBusq) and (reg.fecha.mes = aux.fecha.mes) and (reg.fecha.dia = aux.fecha.dia) do begin
					
					tiempoDiaEmpleado:= 0;
					
					while(reg.fecha.anio = anioBusq) and (reg.fecha.mes = aux.fecha.mes) and (reg.fecha.dia = aux.fecha.dia) and (reg.idUsuario = aux.idUsuario) do begin
					
					tiempoDiaEmpleado:= tiempoDiaEmpleado + reg.tiempoAcceso;
					tiempoDia:= tiempoDia + reg.tiempoAcceso;
					leerM(m, reg);	
						
					end;
					
					writeln('ID Usuario ', aux.idUsuario, ' - Tiempo total de acceso en el dia ', aux.fecha.dia, ', mes ', aux.fecha.mes);
					writeln('		- ', tiempoDiaEmpleado);
					
				end;
					
				writeln('Tiempo total acceso dia ', aux.fecha.dia, ' mes ', aux.fecha.mes, ': ', tiempoDia);
				tiempoMes:= tiempoMes + tiempoDia;
					
			end;
				
			writeln('Tiempo total de acceso mes ', aux.fecha.mes, ': ', tiempoMes);
				
		end;
			
		writeln('Tiempo total de acceso anio ', aux.fecha.anio, ': ', tiempoAnio);
		
	end;

end;

var

	m: archM;

begin

	assign(m, 'maestro.txt');
	
	procesar(m);

end.
