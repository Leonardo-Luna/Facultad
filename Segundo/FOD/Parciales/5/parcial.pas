program parcial;

const

	valorAlto = 9999;

type

	regM = record
		cod: integer;
		nombre: string;
		anio: integer;
		codTorneo: integer;
		codRival: integer;
		golesFavor: integer;
		golesContra: integer;
		puntos: integer;
	end;
	
	archM = file of regM;

procedure leer(var a: archM; var reg: regM);
begin

	if(not eof(a)) then
		read(a, reg)
	else
		reg.anio:= valorAlto;

end;
	
procedure procesar(var m: archM);
var

	reg, act, acumulador, campeon: regM;
	ganados, perdidos, empatados: integer;

begin
	
	reset(m);
	leer(m, reg);
	
	writeln('Informa resumen por equipo de fútbol argentino');
	
	while(reg.anio <> valorAlto) do begin
	
		act.anio:= reg.anio;
		writeln('Año ', act.anio);
		
		while(reg.anio = act.anio) do begin
		
			act.codTorneo:= reg.codTorneo;
			campeon.puntos:= -1;
			writeln('cod_torneo ', act.codTorneo);
			
			while(reg.anio = act.anio) and (act.codTorneo = reg.codTorneo) do begin
			
				act.cod:= reg.cod;
				writeln('cod_equipo ', act.cod, ' nombre equipo ', act.nombre);
				
				ganados:= 0;
				perdidos:= 0;
				empatados:= 0;
				acumulador.golesFavor:= 0;
				acumulador.golesContra:= 0;
				acumulador.puntos:= 0;
				
				while(reg.anio = act.anio) and (act.codTorneo = reg.codTorneo) and (act.cod = reg.cod) do begin
				
					acumulador.golesFavor:= acumulador.golesFavor + reg.golesFavor;
					acumulador.golesContra:= acumulador.golesContra + reg.golesContra;
					acumulador.puntos:= acumulador.puntos + reg.puntos;
				
					if(reg.puntos = 0) then
						perdidos:= perdidos + 1
					else if(reg.puntos = 1) then
						ganados:= ganados + 1
					else if(reg.puntos = 3) then
						empatados:= empatados + 1;
				
					leer(m, reg);
					
				end;
				
				writeln('Cantidad total de goles a favor equipo ', act.cod, ': ', acumulador.golesFavor);
				writeln('Cantidad total de goles en contra equipo ', act.cod, ': ', acumulador.golesContra);
				writeln('Diferencia de gol equipo ', act.cod, ': ', (acumulador.golesFavor - acumulador.golesContra));
				writeln('Cantidad de partidos ganados equipo ', act.cod, ': ', ganados);
				writeln('Cantidad de partidos perdidos equipo ', act.cod, ': ', perdidos);
				writeln('Cantidad de partidos empatados equipo ', act.cod, ': ', empatados);
				writeln('Cantidad total de puntos en el torneo equipo ', act.cod, ': ', acumulador.puntos);
				
				writeln('-------------------------------');
				
				if(acumulador.puntos > campeon.puntos) then
					campeon:= act;
				
			end;
			
			writeln('El equipo "', campeon.nombre, '" fue campeón del torneo código de torneo ', campeon.codTorneo, ' del año ', campeon.anio);
			writeln('--------------------------------------------------------------');
			
		end;
		
		writeln('---------------------------------------------------------------------------------------------');
		
	end;
	
	close(m);
	
end;

var

	m: archM;
	
begin

	assign(m, 'maestro.dat');
	procesar(m);

end.
