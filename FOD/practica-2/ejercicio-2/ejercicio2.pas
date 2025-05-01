{2. El encargado de ventas de un negocio de productos de limpieza desea administrar el stock 
de los productos que vende. Para ello, genera un archivo maestro donde figuran todos los 
productos que comercializa. De cada producto se maneja la siguiente información: código de 
producto, nombre comercial, precio de venta, stock actual y stock mínimo. Diariamente se 
genera un archivo detalle donde se registran todas las ventas de productos realizadas. De 
cada venta se registran: código de producto y cantidad de unidades vendidas. Se pide 
realizar un programa con opciones para: 
a. Actualizar el archivo maestro con el archivo detalle, sabiendo que: 
● Ambos archivos están ordenados por código de producto. 
● Cada registro del maestro puede ser actualizado por 0, 1 ó más registros del 
archivo detalle. 
● El archivo detalle sólo contiene registros que están en el archivo maestro. 
b. Listar en un archivo de texto llamado “stock_minimo.txt” aquellos productos cuyo 
stock actual esté por debajo del stock mínimo permitido. }
program ejercicio2;
const
	valorAlto = 9999;
type
	producto = record
		codigo: integer;
		nombre: string;
		precio: real;
		stockActual: integer;
		stockMinimo: integer;
	end;

	venta = record
		codigo: integer;
		cantidad: integer;
	end;

	maestro = file of producto;
	detalle = file of venta;

procedure leer(var a: detalle; var v: venta);
begin
	if ( not eof(a)) then
		read(a,v)
	else
		v.codigo := valorAlto;
end;

procedure actualizarMaestro(var am: maestro; var ad: detalle);
var
	v: venta;
	p: producto;
begin
	reset(am);
	reset(ad);
	leer(ad, v);
	while (v.codigo <> valorAlto) do begin
		read(am, p);
		while (p.codigo <> v.codigo) do
			read(am,p);
		while (p.codigo = v.codigo) do begin
			if (v.cantidad >= p.stockActual) then
				p.stockActual := 0
			else
				p.stockActual := p.stockActual - v.cantidad;
			leer(ad, v);
		end;
		seek(am, filePos(am) - 1);
		write(am,p);
	end;
	close(am); close(ad);
end;

procedure imprimirMaestro(var am: maestro);
var
	p: producto;
begin
	reset(am);
	while (not eof(am)) do begin
		read(am, p);
		with p do
			writeln(codigo, ' ,', nombre, '. Precio: $', precio, '. Stock Actual: ', stockActual, '. Stock minimo: ', stockMinimo);
	end;
	close(am);
end;

procedure exportarArchivo(var am: maestro);
var
	txt: text;
	p: producto;
begin
	assign(txt, 'stock_minimo.txt');
	rewrite(txt);
	reset(am);
	while (not eof(am)) do begin
		read(am, p);
		if (p.stockActual < p.stockMinimo) then 
			with p do
				writeln(txt, codigo, ',', nombre, ',', precio:0:2, ',', stockActual, ',', stockMinimo);
	end;
	close(am); close(txt);
end;

var
	menu: char;
	nombre: string;
	archivoMaestro: maestro;
	archivoDetalle: detalle;
begin
	repeat
		writeln('1. para actualizar archivo maestro. | 2. para exportar a txt | 3. para salir');
		readln(menu); writeln; writeln;
		case menu of
			'1': begin
				Write('Ingrese nombre del archivo maestro: '); readln(nombre);
				assign(archivoMaestro, nombre);
				Write('Ingrese nombre del archivo detalle: '); readln(nombre);
				assign(archivoDetalle, nombre);
				actualizarMaestro(archivoMaestro, archivoDetalle);
				writeln('Archivo maestro actualizado.');
				imprimirMaestro(archivoMaestro);
			end;
			'2': exportarArchivo(archivoMaestro);
		end;
	until menu = '3';
end.
