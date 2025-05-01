{6. Se desea modelar la información necesaria para un sistema de recuentos de casos de covid 
para el ministerio de salud de la provincia de buenos aires. 
Diariamente se reciben archivos provenientes de los distintos municipios, la información 
contenida en los mismos es la siguiente: código de localidad, código cepa, cantidad de 
casos activos, cantidad de casos nuevos, cantidad de casos recuperados, cantidad de casos 
fallecidos. 
El ministerio cuenta con un archivo maestro con la siguiente información: código localidad, 
nombre localidad, código cepa, nombre cepa, cantidad de casos activos, cantidad de casos 
nuevos, cantidad de recuperados y cantidad de fallecidos. 
Se debe realizar el procedimiento que permita actualizar el maestro con los detalles 
recibidos, se reciben 10 detalles. Todos los archivos están ordenados por código de 
localidad y código de cepa.  
Para la actualización se debe proceder de la siguiente manera:  
1. Al número de fallecidos se le suman el valor de fallecidos recibido del detalle. 
2. Idem anterior para los recuperados. 
3. Los casos activos se actualizan con el valor recibido en el detalle. 
4. Idem anterior para los casos nuevos hallados. 
Realice las declaraciones necesarias, el programa principal y los procedimientos que 
requiera para la actualización solicitada e informe cantidad de localidades con más de 50 
casos activos (las localidades pueden o no haber sido actualizadas).}
program ejercicio6;
const
	dimF = 10;
	valorAlto = 999;
type
	municipio = record
		codigoLocalidad: integer;
		codigoCepa: integer;
		cantidadActivos: integer;
		cantidadNuevos: integer;
		cantidadRecuperados: integer;
		cantidadFallecidos: integer;
	end;
	ministerio = record
		codigoLocalidad: integer;
		codigoCepa: integer;
		cantidadActivos: integer;
		cantidadNuevos: integer;
		cantidadRecuperados: integer;
		cantidadFallecidos: integer;
		nombreLocalidad: string;
		nombreCepa: string;
	end;
	
	maestro = file of ministerio;
	detalle = file of municipio;
	
	vectorDetalles = array[1..dimF] of detalle;
	vectorMunicipio = array[1..dimF] of municipio;
	
procedure leer(var a: detalle; var dato: municipio);
begin
	if (not eof(a)) then
		read(a,dato)
	else
		dato.codigoLocalidad := valorAlto;
end;
	
procedure minimo(var v: vectorDetalles; var vm: vectorMunicipio; var min: municipio);
var
	i, pos: integer;
begin
	min.codigoLocalidad := valorAlto;
	min.codigoCepa := valorAlto;
	for i := 1 to dimF do begin
		if (vm[i].codigoLocalidad < min.codigoLocalidad) or ((vm[i].codigoLocalidad = min.codigoLocalidad) and (vm[i].codigoCepa < min.codigoCepa)) then begin
			min := vm[i];
			pos := i;
		end;
	end;
	
	if (min.codigoLocalidad <> valorAlto) then
		leer(v[pos], vm[pos]);
end;
	
procedure actualizarMaestro(var am: maestro; var v: vectorDetalles);
var
	min: municipio;
	infoMinisterio: ministerio;
	vm: vectorMunicipio;
	i: integer;
	totalLocalidades, contadorCasos: integer;
begin
	reset(am);
	for i := 1 to dimF do begin
		reset(v[i]);
		leer(v[i], vm[i]);
	end;
	
	totalLocalidades := 0;
	minimo(v, vm, min);
	read(am, infoMinisterio);
	
	while (min.codigoLocalidad <> valorAlto) do begin
		contadorCasos := 0;
		while (infoMinisterio.codigoLocalidad <> min.codigoLocalidad) do
			read(am, infoMinisterio);
		while (infoMinisterio.codigoLocalidad = min.codigoLocalidad) do begin
			while (infoMinisterio.codigoCepa <> min.codigoCepa) do
				read(am, infoMinisterio);
			
			while ( (infoMinisterio.codigoLocalidad = min.codigoLocalidad) and (infoMinisterio.codigoCepa = min.codigoCepa)) do begin
				infoMinisterio.cantidadFallecidos := infoMinisterio.cantidadFallecidos + min.cantidadFallecidos;
				infoMinisterio.cantidadRecuperados := infoMinisterio.cantidadRecuperados + min.cantidadRecuperados;
				infoMinisterio.cantidadActivos := min.cantidadActivos;
				infoMinisterio.cantidadNuevos := min.cantidadNuevos;
				contadorCasos := contadorCasos + min.cantidadActivos;
			end;
			seek(am, filePos(am) - 1);
			write(am,infoMinisterio);
		end;
		
		if (contadorCasos > 50) then
			totalLocalidades := totalLocalidades + 1;
	end;
	close(am);
	for i := 1 to dimF do
		close(v[i]);
	writeln(totalLocalidades);
end;
	
var
	archivoMaestro: maestro;
	v: vectorDetalles;
	i: integer;
	nombre: string;
begin
	for i := 1 to dimF do begin
		write('Nombre de archivo ', i,': '); readln(nombre);
		assign(v[i], nombre);
	end;
	assign(archivoMaestro, 'archivoMaestro');
	rewrite(archivoMaestro);
	actualizarMaestro(archivoMaestro, v);
end.
		
