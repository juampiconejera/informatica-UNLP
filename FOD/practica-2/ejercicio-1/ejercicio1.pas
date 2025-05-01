{1. Una empresa posee un archivo con información de los ingresos percibidos por diferentes
empleados en concepto de comisión, de cada uno de ellos se conoce: código de empleado,
nombre y monto de la comisión. La información del archivo se encuentra ordenada por
código de empleado y cada empleado puede aparecer más de una vez en el archivo de
comisiones.
Realice un procedimiento que reciba el archivo anteriormente descrito y lo compacte. En
consecuencia, deberá generar un nuevo archivo en el cual, cada empleado aparezca una
única vez con el valor total de sus comisiones.
NOTA: No se conoce a priori la cantidad de empleados. Además, el archivo debe ser
recorrido una única vez.}
program ejercicio1;
const
	valorAlto = -1;
type
	empleado = record
		codigo: integer;
		nombre: string;
		monto: real;
	end;
	
	archivo = file of empleado;

procedure leer(var a: archivo; var dato: empleado);
begin
	if (not(eof(a))) then
		read(a, dato)
	else
		dato.codigo := valorAlto;
end;

procedure actualizarMaestro(var am: archivo; var ac: archivo);
var
	emp, empleadoTotal, aux: empleado;
	total: real;
begin
	reset(ac);
	reset(am);
	leer(ac, emp);
	while (emp.codigo <> valorAlto) do begin
		aux := emp;
		total := 0;
		while (aux.codigo = emp.codigo) do begin
			total := total + emp.monto;
			leer(ac, emp);
		end;
		empleadoTotal := aux;
		empleadoTotal.monto := total;
		write(am, empleadoTotal);
	end;
	close(am);
	close(ac);
end;

procedure imprimirArchivo(var a: archivo);
var
	e: empleado;
begin
	reset(a);
	while (not eof(a)) do begin
		read(a, e);
		writeln(e.codigo, ', ', e.nombre, ' = ', e.monto:0:2);
	end;
end;

var
	archivoComisiones, archivoMaestro: archivo;
	nombre: string;
begin
	assign(archivoComisiones, 'comisionesEmpleados');
	
	write('Nombre del archivo a crear: '); readln(nombre);
	assign(archivoMaestro, nombre);
	rewrite(archivoMaestro);
	
	actualizarMaestro(archivoMaestro, archivoComisiones);
	imprimirArchivo(archivoMaestro);
end.
