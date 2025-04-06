program ejercicio3;
type
	empleado = record
		numeroEmpleado: integer;
		apellido: string;
		nombre: string;
		edad: integer;
		dni: longInt;
	end;
	archivo = file of empleado;
	
procedure leerEmpleado(var e: empleado);
begin
	writeln(' ---------------- NUEVO EMPLEADO ----------------');
	write('apellido: '); readln(e.apellido);
	if (e.apellido <> 'fin') then begin
		write('nombre: '); readln(e.nombre);
		write('numero de empleado: '); readln(e.numeroEmpleado);
		write('edad: '); readln(e.edad);
		write('dni: '); readln(e.dni);
	end;
end;

procedure imprimirEmpleado(e: empleado);
begin
	writeln('numero de empleado: ', e.numeroEmpleado);
	writeln('apellido de empleado: ', e.apellido);
	writeln('nombre de empleado: ', e.nombre);
	writeln('edad de empleado: ', e.edad);
	writeln('dni de empleado: ', e.dni);
end;

procedure opcionA(var archivoLogico: archivo);
var
	emplead: empleado;
begin
	leerEmpleado(emplead);
	while( (emplead.apellido <> 'fin') and (emplead.apellido <> 'FIN') ) do begin
		write(archivoLogico, emplead);
		leerEmpleado(emplead);
	end;
	close(archivoLogico);
end;

procedure opcionB(menu: char; var archivoLogico: archivo);
var
	buscador: string;
	empleadoActual, cargarEmpleado: empleado;
	i, tamanoArchivo, edadCambiar, empleadoBuscar: integer;
begin
	reset(archivoLogico);
	tamanoArchivo := fileSize(archivoLogico);
	if (menu = '1') then begin
		write('nombre o apellido a buscar: '); readln(buscador);
		for i := 1 to tamanoArchivo do begin
			read(archivoLogico, empleadoActual);
			if ( (empleadoActual.apellido = buscador) or (empleadoActual.nombre = buscador) ) then
				imprimirEmpleado(empleadoActual);
		end;
	end else if (menu = '2') then begin
		for i := 1 to tamanoArchivo do begin
			read(archivoLogico, empleadoActual);
			imprimirEmpleado(empleadoActual);
		end;
	end else if (menu = '3') then begin
		for i := 1 to tamanoArchivo do begin
			read(archivoLogico, empleadoActual);
			if (empleadoActual.edad > 70) then
				imprimirEmpleado(empleadoActual);
		end;
	end else if (menu = '4') then begin
		leerEmpleado(cargarEmpleado);
		while ( (cargarEmpleado.apellido <> 'fin') and (cargarEmpleado.apellido <> 'FIN') ) do begin
			seek(archivoLogico, fileSize(archivoLogico));
			write(archivoLogico, cargarEmpleado);
			leerEmpleado(cargarEmpleado);
		end;
	end else if (menu = '5') then begin
		writeln('Numero del empleado a cambiarle la edad: '); readln(empleadoBuscar);
		writeln('Edad a cambiar: '); readln(edadCambiar);
		read(archivoLogico, empleadoActual);
		while ( (not EOF(archivoLogico)) and (empleadoActual.numeroEmpleado <> empleadoBuscar)) do begin
			read(archivoLogico, empleadoActual);
		end;
		if (empleadoActual.numeroEmpleado = empleadoBuscar) then begin
				empleadoActual.edad := edadCambiar;
				seek(archivoLogico, filePos(archivoLogico) - 1);
				write(archivoLogico, empleadoActual);
		end;
	end;
	close(archivoLogico);
end;
	
var
	menu: char;
	archivoLogico: archivo;
	archivoFisico: string[12];
begin
	repeat
		writeln('Ingrese (A) para crear un archivo o (B) para leer un archivo.');
		readln(menu);
		if ( (menu = 'A') or (menu = 'a') ) then begin
			write('Nombre del archivo a crear: '); readln(archivoFisico);
			assign(archivoLogico, archivoFisico + '.dat');
			rewrite(archivoLogico);
			opcionA(archivoLogico);
			menu := 'Z';
		end
		else if ( (menu = 'B') or (menu = 'b') ) then begin
			write('Ingrese el nombre del archivo a abrir: '); readln(archivoFisico);
			assign(archivoLogico, archivoFisico + '.dat');
			repeat
				writeln('Ingrese (1) para listar los datos de empleados determinados, (2) para listar todos los empleados o (3) para listar los empleados mayores de 70');
				readln(menu);
				opcionB(menu, archivoLogico);
			until ( (menu = '1') or (menu = '2') or (menu = '3') );
			menu := 'Z';
		end;
	until ( (menu = 'A') or (menu = 'a') or (menu = 'B') or (menu = 'b') or (menu = 'C') or (menu = 'c') );
end.

