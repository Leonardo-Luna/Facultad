program ejer18;

const

	valorAlto = 9999;
	tope = 50;
	
type

	d = record
		calle: string;
		num: integer;
		piso: integer;
		dpto: char;
		ciudad: string;
	end;

	regM = record
		partida: integer;
		nombre: string;
		apellido: string;
		direccion: d;
		matricula: integer;
		nombreM: string;
		apellidoM: string;
		DNIM: integer;
		nombreP: string;
		apellidoP: string;
		DNIP: integer;
		fallecido: boolean;
		matriculaDeceso: integer;
		fechaD: string;
		horaD: integer;
		lugar: string;
	end;
	
	regNacimientos = record
		partida: integer;
		nombre: string;
		apellido: string;
		direccion: d;
		matricula: integer;
		nombreM: string;
		apellidoM: string;
		DNIM: integer;
		nombreP: string;
		apellidoP: string;
		DNIP: integer;
	end;
	
	regFallecimientos = record
		partida: integer;
		DNI: integer;
		nombre: string;
		apellido: string;
		matriculaD: integer;
		fecha: string;
		hora: integer;
		lugar: string;
	end;
	
	archN = file of regNacimientos;
	vectorN = array[1..tope] of archN;
	vectorRegN = array[1..tope] of regNacimientos;
	
	archF = file of regFallecimientos;
	vectorF = array[1..tope] of archF;
	vectorRegF = array[1..tope] of regFallecimientos;
	
	archM = file of regM;

procedure resetDetalles(var v1: vectorN; var v2: vectorF);
var

	i: integer;
	
begin

	for i:= 1 to tope do begin
	
		reset(v1[i]);
		reset(v2[i]);
		
	end;

end;

procedure closeDetalles(var v1: vectorN; var v2: vectorF);
var

	i: integer;
	
begin

	for i:= 1 to tope do begin
	
		close(v1[i]);
		close(v2[i]);
		
	end;

end;

procedure leerN(var dN: archN; var rN: regNacimientos);
begin

	if(not eof(dN)) then
		read(dN, rN)
	else
		rN.partida:= valorAlto;

end;

procedure leerF(var dF: archF; var rF: regFallecimientos);
begin

	if(not eof(dF)) then
		read(dF, rF)
	else
		rF.partida:= valorAlto;

end;

procedure minimoN(var vN: vectorN; var vRegN: vectorRegN; var minN: regNacimientos);
var

	posMin, i: integer;
	
begin

	minN.partida:= valorAlto;

	for i:= 1 to tope do begin
	
		if(vRegN[i].partida < minN.partida) then begin
		
			posMin:= i;
			minN:= vRegN[i];
			
		end;
	
	end;
	
	if(minN.partida <> valorAlto) then
		leerN(vN[posMin], vRegN[posMin]);

end;

procedure minimoF(var vF: vectorF; var vRegF: vectorRegF; var minF: regFallecimientos);
var

	posMin, i: integer;
	
begin

	minF.partida:= valorAlto;

	for i:= 1 to tope do begin
	
		if(vRegF[i].partida < minF.partida) then begin
		
			posMin:= i;
			minF:= vRegF[i];
			
		end;
	
	end;
	
	if(minF.partida <> valorAlto) then 
		leerF(vF[posMin], vRegF[posMin]);

end;

procedure merge(var m: archM; nacimientos: vectorN; fallecimientos: vectorF);
var

	vRegN: vectorRegN;
	vRegF: vectorRegF;
	reg: regM;
	minN: regNacimientos;
	minF: regFallecimientos;
	i: integer;

begin

	resetDetalles(nacimientos, fallecimientos);
	rewrite(m);
	
	for i:= 1 to tope do begin
	
		leerN(nacimientos[i], vRegN[i]);
		leerF(fallecimientos[i], vRegF[i]);
	
	end;
	
	minimoN(nacimientos, vRegN, minN);
	minimoF(fallecimientos, vRegF, minF);
	
	while(minN.partida <> valorAlto) do begin
	
		reg.partida:= minN.partida;
		reg.nombre:= minN.nombre;
		reg.apellido:= minN.apellido;
		reg.direccion:= minN.direccion;
		reg.matricula:= minN.matricula;
		reg.nombreM:= minN.nombreM;
		reg.apellidoM:= minN.apellidoM;
		reg.DNIM:= minN.DNIM;
		reg.nombreP:= minN.nombreP;
		reg.apellidoP:= minN.apellidoP;
		reg.DNIP:= minN.DNIP;
		reg.fallecido:= false;
	
		if(minN.partida = minF.partida) then begin
			reg.fallecido:= true;
			reg.matriculaDeceso:= minF.matriculaD;
			reg.fechaD:= minF.fecha;
			reg.horaD:= minF.hora;
			reg.lugar:= minF.lugar;
			minimoF(fallecimientos, vRegF, minF);
		end;
		
		minimoN(nacimientos, vRegN, minN);
		write(m, reg);
	
	end;
	
	close(m);
	closeDetalles(nacimientos, fallecimientos);

end;
	
var

	m: archM;
	nacimientos: vectorN;
	fallecimientos: vectorF;
	i: integer;
	aux: string;

begin

	assign(m, 'maestro.dat');
	
	for i:= 1 to tope do begin
	
		Str(i, aux);
		assign(nacimientos[i], 'Nacimientos' + aux + '.dat');
		assign(fallecimientos[i], 'Fallecimientos' + aux + '.dat');
		
	end;
	
	merge(m, nacimientos, fallecimientos);

end.
