program ejer8;

type

	regFecha = record
		anio: integer;
		mes: integer;
		dia: integer;
	end;

	regM = record
		codigo: integer;
		nombre: string;
		apellido: string;
		fecha: regFecha;
		monto: real;
	end;
	
	archM = file of regM;
	
procedure informar(var m: archM);
var

	reg, aux: regM;
	total, totalMes, totalAnio: real;
	
begin

	reset(m);
	total:= 0;
	read(m, reg);
	
	while(not eof(m)) do begin
		
		aux.fecha.mes:= reg.fecha.mes;
		aux.codigo:= reg.codigo;
		
		writeln('Codigo: ', reg.codigo, ' | ', reg.nombre, ' ', reg.apellido);
		
		while(not eof(m)) and (reg.codigo = aux.codigo) do begin
		
			totalAnio:= 0;
		
			while(not eof(m)) and (reg.codigo = aux.codigo) and (reg.fecha.anio = aux.fecha.anio) do begin
			
				totalMes:= 0;
		
				while((not eof(m)) AND (reg.codigo = aux.codigo) AND (reg.fecha.anio = aux.fecha.anio) AND (reg.fecha.mes = aux.fecha.mes)) do begin
				
					totalMes:= totalMes + reg.monto;
					read(m, reg);
				
				end;
				
				writeln('Total vendido en el mes: ', totalMes);
				total:= total + totalMes;
				totalAnio:= totalAnio + totalMes;
		
			end;
			
			writeln('Total vendido en el anio: ', totalAnio);	
	
		end;
		
	end;
	
	writeln;
	writeln('Total vendido por la empresa: ', total);
	
	close(m);

end;
		
var

	maestro: archM;
	
begin

	assign(maestro, 'maestro.txt');
	
	informar(maestro);

end.
