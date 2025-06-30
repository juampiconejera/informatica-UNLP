program ejercicio8;
type
	distribucion = record
		nombre: string;
		ano: integer;
		version: integer;
		desarrolladores: integeR;
		descripcion: string;
	end;
	archivo = file of distribucion;
	
function buscarDistribucion(var a: archivo; nombre: string) : integer;
var
	pos: integer;
	infoArchivo: distribucion;
begin
	pos := -1;
	reset(a);
	while ( (not eof(a)) and (pos = -1) ) do begin
		read(a,infoArchivo);
		if (infoArchivo.nombre = nombre) then
			pos := filePos(a) - 1;
	end;
	close(a);
	return pos;
end;
	
procedure leerDistribucion(var d: distribucion);
begin
	write('nombre '); readln(d.nombre); write('anio '); readln(d.ano); write('version '); readln(d.version); write('desarrolladores '); readln(d.desarrolladores); write('descripcion '); readln(d.descripcion);
end;
	
	
procedure altaDistribucion(var a: archivo; d: distribucion);
var
	aux: distribucion;
begin
	if (buscarDistribucion(a, d.nombre) <> -1) then begin
		reset(a);
		read(a, aux);
		if (aux.cant = 0) then begin
			seek(a, filesize(a));
			write(a,d);
		end else begin
			aux.cant := aux.cant * -1;
			seek(a, aux.cant);
			read(a, aux);
			seek(a, filepos(a)-1);
			write(a,d);
			seek(a,0);
			write(a,aux);
		end;
		close(a);
	end else writeln('ya existe la distribución.');
end;
	
procedure bajaDistribucion(var a: archivo; nombre: string);
var
	aux, d: distribucion;
begin
	if (existeDistribucion(a) <> -1) then begin
		reset(a);
		read(a, aux);
		read(a, d);
		while (d.nombre <> nombre) do
			read(a,d);
		seek(a, filepos(a) - 1);
		write(a, aux);
		aux.cant := (filepos(a)-1) * -1;
		seek(a, 0);
		write(a,aux);
		close(a);
	end else writeln('Distribución no existente')
end;
	
var
	a: archivo;
	nombre: string;
	nuevaDistribucion: distribucion;
begin
	assign(a, 'archivo');
	write('Nombre de la distribucion: '); readln(nombre);
	writeln(existeDistribucion(a, nombre));
	leerDistribucion(nuevaDistribucion);
	altaDistribucion(a,nuevaDistribucion);
end.
