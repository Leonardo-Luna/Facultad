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

procedure cargarEmpleados(var arch: archivo);
var
	
	dato: empleado;

begin

	writeln('Ingrese el apellido del empleado: ');
	readln(dato.apellido);
	
	while(dato.apellido <> 'fin') do begin
	
		writeln('Ingrese el nombre del empleado: ');
		readln(dato.nombre);
		writeln('Ingrese el DNI del empleado: ');
		readln(dato.dni);
		writeln('Ingrese la edad del empleado: ');
		readln(dato.edad);
		writeln('Ingrese el numero de empleado: ');
		readln(dato.num);
	
		write(arch, dato);
		ClrScr;
				
		writeln('Ingrese el apellido del empleado: ');
		readln(dato.apellido);
		
	end;
	
	close(arch);

end;
	
function imprimir(dato: empleado; criterio: string; opcion: char): boolean;
begin

	if(opcion = '1') then begin
	
		if(criterio = dato.nombre) then begin
		
			imprimir:= true
		
		end
		else begin
		
			imprimir:= false
			
		end
		
	end
	else if(opcion = '2') then begin
	
		if(criterio = dato.apellido) then begin
		
			imprimir:= true
		
		end
		else begin
		
			imprimir:= false
	
		end;
		
	end;

end;

function proximo(edad: integer): boolean;
begin

	if(edad > mayores) then begin
	
		proximo:= true
	
	end
	else begin
		
		proximo:= false
		
	end;

end;

procedure procesar(var arch: archivo; criterio: string; opcion: char);
var

	e: empleado;
	
begin

	reset(arch);
	writeln('Empleados que cumplen el criterio de busqueda (',criterio,'): ');
	while(not eof(arch)) do begin
	
		read(arch, e);
		if(imprimir(e, criterio, opcion)) then begin
	
			writeln(e.nombre, ' ', e.apellido, ' | ', e.edad, ' anios | Nro ', e.num, ' | DNI ', e.dni);
			
		end;
		
	end;
	
	writeln('------------------------------------------');
		
	seek(arch, 0);
	while(not eof(arch)) do begin	
		
		read(arch, e);
		write(e.nombre, ' ', e.apellido, ' | ', e.edad, ' anios | Nro ', e.num, ' | DNI ', e.dni);
		writeln('');
		
	end;
	
	writeln('------------------------------------------');
	writeln('Proximos a jubilarse: ');

	seek(arch, 0);
	while(not eof(arch)) do begin	
		
		read(arch, e);
		if(proximo(e.edad)) then begin
		
			writeln(e.nombre, ' ', e.apellido, ' | Nro:', e.num);
			
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
		writeln(e.apellido);
		
	end;
	
	close(arch);
	
end;
	
var

	arch: archivo;
	nomArch, criterio: string;
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
	
	if(opcion = '1') then begin
	
		writeln('Archivo creado [',nomArch,']');
		rewrite(arch);
		cargarEmpleados(arch)
		
	end
	else if(opcion = '2') then begin
		
		writeln('Archivo abierto [',nomarch,']');
		writeln('1 - Buscar por nombre');
		writeln('2 - Buscar por apellido');
		readln(opcion);
		
		if(opcion = '1') then begin
		
			writeln('Ingrese el nombre: ')
		
		end
		else if(opcion = '2') then begin
			
			writeln('Ingrese el apellido: ')
			
		end;
			
		readln(criterio);
		
		procesar(arch, criterio, opcion);
		
	end
	else
	
		imprimirTodo(arch);
		

end.
