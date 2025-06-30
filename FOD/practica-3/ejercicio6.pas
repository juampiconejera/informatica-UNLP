program ejercicio6;
type
	prenda = record
		codigo: integer;
		descripcion: string;
		colores: string;
		tipo: string;
		stock: integer;
		precio: real;
	end;
	
	maestro = file of prenda;
	detalle = file of integer;

procedure bajaLogica(var am: maestro, var ad: detalle);
var
	codigoDetalle: integer;
	prendaMaestro: prenda;
begin
	reset(am);
	reset(ad);
	while (not eof(ad)) do begin
		read(ad,codigoDetalle);
		seek(am,0);
		read(am, prendaMaestro);
		while (codigoDetalle <> prendaMaestro.codigo) do
			read(am,prendaMaestro);
		seek(am, filePos(am)-1);
		prendaMaestro.stock := -1;
		write(am,prendaMaestro);
	end;
	close(ad);
	close(am);
end;

procedure compactar(var am, mc: maestro);
var
	infoMaestro: prenda;
begin
	assign(mc, 'archivoAuxiliar');
	rewrite(mc);
	reset(am);
	while (not eof(am)) do begin
		read(am,infoMaestro);
		if (infoMaestro.stock >= 0) then
			write(mc, infoMaestro);
	end;
	close(am);
	close(mc);
	erase(am);
	rename(mc, 'archivoMaestro');
end;

var
	archivoMaestro, maestroCompacto: maestro;
	archivoDetalle: detalle;
begin
	assign(archivoMaestro, 'archivoMaestro');
	assign(archivoDetalle, 'detalle');
	bajaLogica(archivoMaestro, archivoDetalle);
	compactar(archivoMaestro, maestroCompacto);
end.
