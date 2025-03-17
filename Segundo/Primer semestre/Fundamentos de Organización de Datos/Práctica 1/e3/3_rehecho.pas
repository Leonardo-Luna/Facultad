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
	readln(opcion);
	
	case (opcion) of
		1: buscar(arch);
		2: imprimirTodo(arch);
		3: proximo(arch);
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
