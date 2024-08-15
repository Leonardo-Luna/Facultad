program ejer4;

const
	valorAlto = '9999';

type

	regM = record
		provincia: string;
		habitantes: integer;
		encuestados: integer;
	end;
	
	archM = file of regM;
	
	regD = record
		provincia: string;
		localidad: integer;
		habitantes: integer;
		encuestados: integer;
	end;

procedure crearBinario(var m: archM; var mTxt: Text);
var

	reg: regM;
	
begin

	rewrite(m);
	reset(mTxt);
	
	while(not eof(mTxt)) do begin
	
		readln(mTxt, reg.provincia);
		readln(mTxt, reg.habitantes);
		readln(mTxt, reg.encuestados);
		write(m, reg);
	
	end;
	
	close(m);
	close(mTxt);

end;

procedure leerD(var det: Text; var aux: regD);
begin

	if(not eof(det)) then begin
	
		readln(det, aux.provincia);
		readln(det, aux.localidad);
		readln(det, aux.habitantes);
		readln(det, aux.encuestados);
		
	end
	else
		aux.provincia:= valorAlto;

end;

procedure leerM(var m: archM; var reg: regM);
begin

	if(not eof(m)) then
		read(m, reg)
	else
		reg.provincia:= valorAlto;
		
	writeln(reg.provincia);
		
end;

procedure minimo(var det1, det2: Text; var reg1, reg2, min: regD);
begin

	if(reg1.provincia <= reg2.provincia) then begin
		min:= reg1;
		leerD(det1, reg1);
	end
	else begin
		min:= reg2;
		leerD(det2, reg2);
	end;

end;

procedure actualizarMaestro(var m: archM; var det1, det2: Text);
var

	reg: regM;
	regD1, regD2, min: regD;
	
begin

	reset(m);
	reset(det1);
	reset(det2);
	
	leerM(m, reg);
	leerD(det1, regD1);
	leerD(det2, regD2);
	minimo(det1, det2, regD1, regD2, min);
	
	while((min.provincia <> valorAlto) AND (reg.provincia <> valorAlto)) do begin

		//writeln(min.provincia, ' | ', reg.provincia);

		while(min.provincia = reg.provincia) do begin
				
			reg.habitantes:= reg.habitantes + min.habitantes;
			reg.encuestados:= reg.encuestados + min.encuestados;
			seek(m, filepos(m)-1);
			write(m, reg);
			minimo(det1, det2, regD1, regD2, min);
				
		end;
	
		leerM(m, reg);
		
	end;
	
	close(m);
	close(det1);
	close(det2);

end;

procedure exportarMaestro(var m: archM; var mT: Text);
var

	reg: regM;
	
begin

	reset(m);
	rewrite(mT);
	
	read(m, reg);
	while(not eof(m)) do begin
	
		writeln(mT, reg.provincia);
		writeln(mT, reg.habitantes);
		writeln(mT, reg.encuestados);
		read(m, reg);
		
	end;
	
	close(m);
	close(mT);

end;
	
var

	maestro: archM;
	mTxt: Text;
	det1, det2: Text;
	
begin

	assign(maestro, 'maestro.dat');
	assign(mTxt, 'maestro.txt');
	assign(det1, 'detalle1.txt');
	assign(det2, 'detalle2.txt');
	
	crearBinario(maestro, mTxt);
	actualizarMaestro(maestro, det1, det2);
	exportarMaestro(maestro, mTxt);

end.
