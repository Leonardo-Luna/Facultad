Program ejer3;
uses Crt;
const

	mayores = 70;

type

	empleado = record
		num: integer;
		nombre: string;
		apellido: string; //Apellido 'fin' = corte
		edad: integer;
		dni: integer; //"Algunos empleados se ingresan con DNI 00"
	end;
	
	archivo = file of empleado;
	
procedure leer(var e: empleado);
begin
	
		ClrScr;
		writeln('Ingrese el apellido del empleado: ');
		readln(e.apellido);
		if(e.apellido <> 'fin') then begin
			writeln('Ingrese el nombre del empleado: ');
			readln(e.nombre);
			writeln('Ingrese el DNI del empleado: ');
			readln(e.dni);
			writeln('Ingrese la edad del empleado: ');
			readln(e.edad);
			writeln('Ingrese el numero de empleado: ');
			readln(e.num);
		end;
	
end;

procedure cargarEmpleados(var arch: archivo);
var
	
	dato: empleado;

begin

	reset(arch);
	leer(dato);
	
	while(dato.apellido <> 'fin') do begin
	
		write(arch, dato);
		ClrScr;
				
		leer(dato);
		
	end;
	
	close(arch);

end;
	
function cerca70(edad: integer): boolean;
begin

	if(edad > mayores) then begin
	
		cerca70:= true
	
	end
	else begin
		
		cerca70:= false
		
	end;
	
end;

procedure proximo(var arch: archivo);
var
	
	e: empleado;
	
begin

	ClrScr;
	writeln('Empleados proximos a jubilarse: ');
	reset(arch);
	
	while(not eof(arch)) do begin	
		
		read(arch, e);
		if(cerca70(e.edad)) then begin
		
			writeln(e.nombre, ' ', e.apellido, ' | Nro:', e.num);
			
		end;
	
	end;
	close(arch);

end;

procedure buscar(var arch: archivo);
var

	e: empleado;
	criterio: string;
	
begin
	
	reset(arch);
	writeln('Ingrese el nombre o apellido a buscar: ');
	readln(criterio);
	
	ClrScr;
	writeln('Empleados que cumplen el criterio de busqueda (',criterio,'): ');
	
	while(not eof(arch)) do begin
	
		read(arch, e);
		if((e.nombre = criterio) or (e.apellido = criterio)) then begin
	
			writeln(e.nombre, ' ', e.apellido, ' | ', e.edad, ' anios | Nro ', e.num, ' | DNI ', e.dni);
			
		end;
		
	end;
	close(arch);

end;

procedure imprimirTodo(var arch: archivo);
var

	e: empleado;
	
begin

	reset(arch);

	while(not eof(arch)) do begin
	
		read(arch, e);
		writeln(e.nombre, ' ', e.apellido, ' | ', e.edad, ' anios | Nro ', e.num, ' | DNI ', e.dni);
		
	end;
	close(arch);
	
end;

procedure agregarFinal(var arch: archivo);
var

	eNuevo, e: empleado;
	esRepetido: boolean;
	
begin

	ClrScr;
	reset(arch);
	leer(eNuevo);
	
	while(eNuevo.apellido <> 'fin') do begin
	
		seek(arch, 0);
		esRepetido:= false;
		while(not eof(arch) AND (not esRepetido)) do begin
			
			read(arch, e);
			if(e.num = eNuevo.num) then begin
				esRepetido:= true;
				writeln('Numero de empleado repetido')
			end;
			
		end;
		
		if((NOT(esRepetido)))then begin
		
			seek(arch, filesize(arch));
			write(arch, eNuevo);
			
		end;
		
		leer(eNuevo);
		
	end;
		
	close(arch);
	
end;

function pude(var arch: archivo; num, edad: integer): boolean;
var

	seguir: boolean;
	e: empleado;
	
begin

	reset(arch);
	seguir:= true;
	while((not eof(arch)) AND (seguir)) do begin
	
		read(arch, e);
		if(e.num = num) then begin
		
			e.edad:= edad;
			seek(arch, filepos(arch)-1);
			write(arch, e);
			seguir:= false;
		
		end;
		
	end;
	close(arch);
	if(seguir) then
		pude:= false
	else
		pude:= true;

end;

procedure modificarEdad(var arch: archivo);
var

	num, edad: integer;
	
begin
	
	ClrScr;
	writeln('Ingrese el numero de empleado: ');
	readln(num);
	writeln('Ingrese la nueva edad: ');
	readln(edad);

	writeln('Edad modificada ', pude(arch, num, edad));

end;

procedure exportarTodo(var arch: archivo);
var

	txt: Text;
	e:empleado;
	
begin

	reset(arch);
	assign(txt, 'Ejercicio4.txt');
	rewrite(txt);
	
	while(not eof(arch)) do begin
	
		read(arch, e);
		writeln(txt, e.nombre, ' ', e.apellido, ' > Edad: ', e.edad, ' - DNI: ', e.DNI, ' | Empleado N.', e.num);
	
	end;
	
	close(arch);
	close(txt);

end;

procedure exportarSinDNI(var arch: archivo);
var

	txt: Text;
	e:empleado;
	
begin

	reset(arch);
	assign(txt, 'Ejercicio4SinDNI.txt');
	rewrite(txt);
	
	while(not eof(arch)) do begin
	
		read(arch, e);
		if(e.DNI = 00) then 
			writeln(txt, e.nombre, ' ', e.apellido, ' > Edad: ', e.edad, ' - DNI: ', e.DNI, ' | Empleado N.', e.num);
	
	end;
	
	close(arch);
	close(txt);

end;

procedure crearArchivo(var arch: archivo; nomArch:string);
begin

	rewrite(arch);
	writeln('Archivo creado [',nomArch,']');
	cargarEmpleados(arch);
end;

procedure abrirArchivo(var arch: archivo; nomArch: string);
var

	opcion: integer;
	
begin

	writeln('Archivo abierto [',nomarch,']');
	writeln('1 - Buscar por nombre o apellido');
	writeln('2 - Listas los empleados de a uno por linea');
	writeln('3 - Listar en pantalla los empleados mayores a 70 años');
	writeln('4 - Agregar empleados al final');
	writeln('5 - Modificar edad de un empleado');
	writeln('6 - Exportar empleados a txt');
	writeln('7 - Exportar empleados sin DNI a txt');
	readln(opcion);
	
	case (opcion) of
		1: buscar(arch);
		2: imprimirTodo(arch);
		3: proximo(arch);
		4: agregarFinal(arch);
		5: modificarEdad(arch);
		6: exportarTodo(arch);
		7: exportarSinDNI(arch);
	end;

end;
	
var

	arch: archivo;
	nomArch: string;
	opcion: char;

begin

	writeln('1 - Crear archivo');
	writeln('2 - Abrir archivo');
	writeln('* - Imprimir todo'); //No es parte de la consigna
	readln(opcion);
	
	writeln('Ingrese el nombre del archivo: ');
	readln(nomArch);
	assign(arch, nomArch);
	ClrScr;
	
	case (opcion) of
		'1': crearArchivo(arch, nomArch);
		'2': abrirArchivo(arch, nomArch);
		else imprimirTodo(arch);
	end;

end.
