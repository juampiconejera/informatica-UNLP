{5. Suponga que trabaja en una oficina donde está montada una  LAN (red local). La misma fue 
construida sobre una topología de red que conecta 5 máquinas entre sí y todas las 
máquinas se conectan con un servidor central. Semanalmente cada máquina genera un 
archivo de logs informando las sesiones abiertas por cada usuario en cada terminal y por 
cuánto tiempo estuvo abierta. Cada archivo detalle contiene los siguientes campos: 
cod_usuario, fecha, tiempo_sesion. Debe realizar un procedimiento que reciba los archivos 
detalle y genere un archivo maestro con los siguientes datos: cod_usuario, fecha, 
tiempo_total_de_sesiones_abiertas. 
Notas: 
● Cada archivo detalle está ordenado por cod_usuario y fecha. 
● Un usuario puede iniciar más de una sesión el mismo día en la misma máquina, o 
inclusive, en diferentes máquinas.  
● El archivo maestro debe crearse en la siguiente ubicación física:  /var/log. }
program ejercicio5;
const
	dimF = 5;
	valorAlto = 999;
type
	informacion = record
		codigo: integer;
		fecha: string;
		tiempo: integer;
	end;
	archivo = file of informacion;
	vectorDetalles = array[1..dimF] of archivo;
	vectorInfo = array[1..dimF] of informacion;
	
procedure leer(var a: archivo; var info: informacion);
begin
	if (not eof(a)) then
		read(a,info)
	else
		info.codigo := valorAlto;
end;
	
procedure minimo(var v: vectorDetalles; var vi: vectorInfo; var min: informacion);
var
	i, pos: 1..dimF;
begin
	min.codigo := valorAlto;
	min.fecha := 'ZZZ';
	for i := 1 to dimF do begin
		if ((vi[i].codigo < min.codigo) or ((vi[i].codigo = min.codigo) and (vi[i].fecha < min.fecha))) then begin
			min := vi[i];
			pos := i;
		end;
		if (min.codigo <> valorAlto) then
			leer(v[pos], vi[pos]);
	end;
end;
	
procedure crearArchivoMaestro(var am: archivo; var v: vectorDetalles);
var
	min, aux: informacion;
	vi: vectorInfo;
	i: 1..dimF;
begin
	for i := 1 to dimF do begin
		reset(v[i]);
		read(v[i],vi[i]);
	end;
	minimo(v, vi, min);
	while (min.codigo <> valorAlto) do begin
		aux.codigo := min.codigo;
		while (aux.codigo = min.codigo) do begin
			aux.fecha := min.fecha;
			aux.tiempo := 0;
			while ((aux.codigo = min.codigo) and (aux.fecha = min.fecha)) do begin
				aux.tiempo := aux.tiempo + min.tiempo;
				minimo(v, vi, min);
			end;
			write(am,aux);
		end;
	end;
	close(am);
	for i := 1 to dimF do
		close(v[i]);
end;
	
var
	vd: vectorDetalles;
	archivoMaestro: archivo;
	nombre: string;
	i: integer;
begin
	for i := 1 to 5 do begin
		write('Nombre del archivo', i);readln(nombre);
		assign(vd[i], nombre);
	end;
	assign(archivoMaestro, '/var/log/archivoMaestro');
	rewrite(archivoMaestro);
	crearArchivoMaestro(archivoMaestro, vd);
end.
