program p2e1;

const

	valorAlto = 9999;

type

	regM = record
		cod: integer;
		nombre: string;
		monto: real;
	end;
	
	arch = regM;
	
procedure leer(a: arch; var reg: regM);
begin

	if(not eof(a)) then
		read(a, reg)
	else
		reg.cod:= valorAlto;

end;
	
procedure compactarArchivo(var a, c: arch);
var

	reg, act, acumular: regM;
	
begin

	reset(a);
	rewrite(c);
	
	leer(a, reg);
	
	while(reg.cod <> valorAlto) do begin
	
		act = reg;
		acumular.monto = 0;
		
		while(reg.cod = aux.cod) do begin
		
			acumular.monto = acumular.monto + reg.monto;
			leer(a, reg);
		
		end;
		
		write(c, reg);
	
	end;
	
	close(a);
	close(c);

end;

var

	a: arch;
	c: arch;

begin

	assign(a, 'original.dat');
	assign(c, 'compactado.dat');
	
	compactarArchivo(a, c);

end.
