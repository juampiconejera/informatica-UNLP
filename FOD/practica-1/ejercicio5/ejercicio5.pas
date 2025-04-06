program ejercicio5;
type
	celular = record
		codigo: integer;
		nombre: string;
		descripcion: string;
		marca: string;
		precio: real;
		stockMinimo: integer;
		stock: integer;
	end;
	archivo = file of celular;
	
procedure imprimirCelular(cel: celular);
begin
	with cel do begin
		writeln('Codigo celular: ', codigo, ' - Nombre: ', nombre, ' - Descripcion: ', descripcion, ' - Marca: ', marca, ' - Precio: ', precio:2:0, ' - Stock minimo: ', stockMinimo, ' - Stock actual: ', stock,'.');
	end;
end;
	
procedure opcionA(var al: archivo; var ac: Text); {al: archivo logico, ac: archivoCarga}
var
	cel: celular;
	nombreArchivo: string[12];
begin
	write('Nombre del archivo a crear:'); readln(nombreArchivo);
	assign(al, nombreArchivo);
	reset(ac);
	rewrite(al);
	while (not eof(ac)) do begin
		with cel do begin
			readln(ac, codigo, precio, marca);
			readln(ac, stock, stockMinimo, descripcion);
			readln(ac, nombre);
			write(al, cel);
		end;
	end;
	writeln('|||| ARCHIVO CARGADO ||||');
	close(al); close(ac);
end;

procedure opcionB(var al: archivo);
var
	cel: celular;
	nombreArchivo: string[12];
begin
	write('Nombre del archivo a listar:'); readln(nombreArchivo);
	assign(al, nombreArchivo);
	reset(al);
	while (not eof(al)) do begin
		read(al, cel);
		if (cel.stock < cel.stockMinimo) then
			imprimirCelular(cel);
	end;
	close(al);
end;

procedure opcionC(var al: archivo);
var
	cel: celular;
	nombreArchivo: string[12];
	descripcionBuscar: string;
begin
	write('Nombre del archivo a listar:'); readln(nombreArchivo);
	assign(al, nombreArchivo);
	reset(al);
	writeln;
	write('Ingrese descripcion a buscar: '); readln(descripcionBuscar);
	writeln;
	while (not eof(al)) do begin
		read(al, cel);
		if (descripcionBuscar = cel.descripcion) then
			imprimirCelular(cel);
	end;
	close(al);
end;

procedure opcionD(var al: archivo; var ac: text);
var
	cel: celular;
	nombreArchivo: string[12];
begin
	write('Nombre del archivo a exportar:'); readln(nombreArchivo);
	assign(al, nombreArchivo);
	reset(al);
	rewrite(ac);
	while (not eof(al)) do begin
		read(al, cel);
		with cel do begin
			writeln(ac, codigo, ' ', precio, ' ', marca);
			writeln(ac, stock, ' ', stockMinimo, ' ', descripcion);
			writeln(ac, nombre);
		end;
	end;
	close(al); close(ac);
end;

var
	menu: char;
	archivoCarga: Text;
	archivoLogico: archivo;
begin
	{asigno el nombre de archivo .txt}
	assign(archivoCarga, 'celulares.txt');
	{menu de opciones}
	repeat 
		writeln;
		writeln('| (1) crear archivo | (2) Listar en pantalla celulares con stock < stock minimo | (3) Listar en pantalla celulares con determinada descripcion | (4) Exportar el archivo creado en (A) a celulares.txt |');
		writeln('| Ingrese (5) para salir |');
		writeln;
		readln(menu);
		case menu of 
			'1': opcionA(archivoLogico, archivoCarga);
			'2': opcionB(archivoLogico);
			'3': opcionC(archivoLogico);
			'4': opcionD(archivoLogico, archivoCarga);
		end;
	until (menu = '5');
	writeln('Programa cerrado exitosamente.');
end.
{5. Realizar un programa para una tienda de celulares, que presente un menú con
opciones para:
a. Crear un archivo de registros no ordenados de celulares y cargarlo con datos
ingresados desde un archivo de texto denominado “celulares.txt”. Los registros
correspondientes a los celulares deben contener: código de celular, nombre,
descripción, marca, precio, stock mínimo y stock disponible.
b. Listar en pantalla los datos de aquellos celulares que tengan un stock menor al
stock mínimo.
c. Listar en pantalla los celulares del archivo cuya descripción contenga una
cadena de caracteres proporcionada por el usuario.
d. Exportar el archivo creado en el inciso a) a un archivo de texto denominado
“celulares.txt” con todos los celulares del mismo. El archivo de texto generado
podría ser utilizado en un futuro como archivo de carga (ver inciso a), por lo que
debería respetar el formato dado para este tipo de archivos en la NOTA 2.

NOTA 1: El nombre del archivo binario de celulares debe ser proporcionado por el
usuario.
NOTA 2: El archivo de carga debe editarse de manera que cada celular se especifique
en tres líneas consecutivas. En la primera se especifica: código de celular, el precio y
marca, en la segunda el stock disponible, stock mínimo y la descripción y en la tercera
nombre en ese orden. Cada celular se carga leyendo tres líneas del archivo
“celulares.txt”.}
