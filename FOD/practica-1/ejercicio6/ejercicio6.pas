program ejercicio6;
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
		writeln('Codigo celular: ', codigo, ' - Nombre: ', nombre, ' - Descripcion: ', descripcion, ' - Marca: ', marca, ' - Precio: ', precio:0:2, ' - Stock minimo: ', stockMinimo, ' - Stock actual: ', stock,'.');
	end;
end;
	
	
procedure leerCelular(var cel: celular);
begin
	with cel do begin
		write('Codigo: '); readln(codigo);
		write('Nombre: '); readln(nombre);
		write('Descripcion : '); readln(descripcion);
		write('Marca : '); readln(marca);
		write('Precio : '); readln(precio);
		write('Stock Minimo : '); readln(stockMinimo);
		write('Stock actual : '); readln(stock);
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
			writeln(ac, codigo, ' ', precio:0:2, ' ', marca);
			writeln(ac, stock, ' ', stockMinimo, ' ', descripcion);
			writeln(ac, nombre);
		end;
	end;
	close(al); close(ac);
end;

procedure opcionE(var al: archivo);
var
	nombreArchivo: string[12];
	cel: celular;
	cantidadAgregar, i: integer;
begin
	write('Ingrese nombre del archivo a modificar: '); readln(nombreArchivo);
	assign(al, nombreArchivo);
	reset(al);
	seek(al, fileSize(al));
	
	write('Ingrese cantidad de celulares a agregar: '); readln(cantidadAgregar);
	for i := 1 to cantidadAgregar do begin
		leerCelular(cel);
		write(al, cel);
	end;
	close(al);
end;

procedure opcionF(var al: archivo);
var
	nombreArchivo: string[12];
	stockModificar: integer;
	buscador: string;
	cel: celular;
begin
	write('Ingrese nombre del archivo a modificar: '); readln(nombreArchivo);
	assign(al, nombreArchivo);
	reset(al);
	
	write('Ingrese nombre del celular a modificar: '); readln(buscador);
	write('Ahora la cantidad de stock: '); readln(stockModificar);
	read(al,cel);
	while ( (not eof(al)) and (cel.nombre <> buscador) ) do begin
		read(al, cel);
	end;
	if (cel.nombre = buscador) then begin
		cel.stock := stockModificar;
		seek(al, filePos(al) - 1);
		write(al, cel);
	end else
		writeln('No se encontró el nombre del celular...');
	close(al);
end;

procedure opcionG(var al: archivo);
var
	ae: text; {ae: archivo exportar}
	cel: celular;
	nombreArchivo: string[12];
begin
	assign(ae, 'SinStock.txt');
	rewrite(ae);

	write('Ingrese nombre del archivo a modificar: '); readln(nombreArchivo);
	assign(al, nombreArchivo);
	reset(al);
	
	while (not eof(al)) do begin
		read(al, cel);
		if (cel.stock = 0) then begin
			with cel do begin
				writeln(ae, codigo, ' ', precio:0:2, ' ', marca);
				writeln(ae, stock, ' ', stockMinimo, ' ', descripcion);
				writeln(ae, nombre);
			end;
		end;
	end;
	close(al); close(ae);
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
		writeln('| (1) crear archivo | (2) Listar en pantalla celulares con stock < stock minimo | (3) Listar en pantalla celulares con determinada descripcion |');
		writeln('| (4) Exportar archivo bin a celulares.txt | (5) Añadir uno o mas celulares | (6) Modificar stock | (7) Exportar archivo bin a SinStock.txt');
		writeln('| Ingrese (0) para salir |');
		writeln;
		readln(menu);
		case menu of 
			'1': opcionA(archivoLogico, archivoCarga);
			'2': opcionB(archivoLogico);
			'3': opcionC(archivoLogico);
			'4': opcionD(archivoLogico, archivoCarga);
			'5': opcionE(archivoLogico);
			'6': opcionF(archivoLogico);
			'7': opcionG(archivoLogico);
		end;
	until (menu = '0');
	writeln('Programa cerrado exitosamente.');
end.
{6. Agregar al menú del programa del ejercicio 5, opciones para:
a. Añadir uno o más celulares al final del archivo con sus datos ingresados por
teclado.
b. Modificar el stock de un celular dado.
c. Exportar el contenido del archivo binario a un archivo de texto denominado:”SinStock.txt”, con aquellos celulares que tengan stock 0.

NOTA: Las búsquedas deben realizarse por nombre de celular.}
