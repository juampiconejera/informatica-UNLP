{3. A partir de información sobre la alfabetización en la Argentina, se necesita actualizar un 
archivo que contiene los siguientes datos: nombre de provincia, cantidad de personas 
alfabetizadas y total de encuestados. Se reciben dos archivos detalle provenientes de dos 
agencias de censo diferentes, dichos archivos contienen: nombre de la provincia, código de 
localidad, cantidad de alfabetizados y cantidad de encuestados. Se pide realizar los módulos 
necesarios para actualizar el archivo maestro a partir de los dos archivos detalle. 
NOTA: Los archivos están ordenados por nombre de provincia y en los archivos detalle      
pueden venir 0, 1 ó más registros por cada provincia. }
program ejercicio3;
const
	valorAlto = 'ZZZ';
type
	infoMaestro = record
		provincia: string;
		cantidad: integer;
		total: integer;
	end;
	
	infoDetalle = record
		provincia: string;
		localidad: integer;
		cantidad: integer;
		total: integer;
	end;
	
	maestro = file of infoMaestro;
	detalle = file of infoDetalle;

procedure leer(var d: detalle; var dato: infoDetalle);
begin
	if (not eof(d)) then
		read(d, dato)
	else
		dato.provincia := valorAlto;
end;

procedure minimo(var adu, add: detalle; var r1, r2, min: infoDetalle);
begin
	if (r1.provincia <= r2.provincia) then begin
		min := r1;
		leer(adu, r1);
	end else begin
		min := r2;
		leer(add, r2);
	end;
end;

procedure actualizarMaestro(var am: maestro; var adu: detalle; var add: detalle); {adu = Archivo detalle uno, add = Archivo detalle dos}
var
	infoDU, infoDD, min: infoDetalle;
	infoM: infoMaestro;
begin
	reset(am);
	reset(adu);
	reset(add);
	leer(adu, infoDU);
	leer(add, infoDD);
	minimo(adu, add, infoDU, infoDD, min);
	while (min.provincia <> valorAlto) do begin
		read(am, infoM);
		while (infoM.provincia <> min.provincia) do
			read(am, infoM);
		while (infoM.provincia = min.provincia) do begin
			infoM.cantidad := infoM.cantidad + min.cantidad;
			infoM.total := infoM.total + min.total;
			minimo(adu,add,infoDU,infoDD,min);
		end;
		seek(am, filePos(am) - 1);
		write(am, infoM);
	end;
	close(am);
	close(adu);
	close(add);
end;

var
	archivoMaestro: maestro;
	archivoDetalleUno, archivoDetalleDos: detalle;
	nombre: string;
begin
	write('Nombre del archivo maestro: '); readln(nombre); assign(archivoMaestro, nombre);
	write('Nombre del archivo detalle uno: '); readln(nombre); assign(archivoDetalleUno, nombre);
	write('Nombre del archivo detalle dos: '); readln(nombre); assign(archivoDetalleDos, nombre);
	actualizarMaestro(archivoMaestro, archivoDetalleUno, archivoDetalleDos);
end.
