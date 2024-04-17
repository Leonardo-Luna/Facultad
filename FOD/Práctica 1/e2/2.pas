Program ejer2;
const
	
	limite = 1500;

type

	archivo = file of integer;
	
var

	arch: archivo;
	num, total, cant, totalNum: integer;
	nombre: string;

begin

	writeln('Ingrese el nombre del archivo: ');
	readln(nombre);
	assign(arch, nombre);
	reset(arch);
	total:= 0; cant:= 0; totalNum:= 0;
	
	writeln('Contenido del archivo "', nombre, '": ');
	
	while(not eof(arch)) do begin
	
		read(arch, num);
		writeln(num);
		total:= total + num;
		totalNum:= totalNum + 1;
		
		if(num < limite) then
		
			cant:= cant + 1;
	
	end; //"El algoritmo deberá listar el contenido del archivo en pantalla" Supongo que todo?
	
	writeln('Promedio de numeros ingresados: ', total/totalNum:0:2);
	writeln('Numeros menores a ', limite, ': ', cant);
	
end.
