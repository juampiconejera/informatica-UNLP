program ejercicio1;
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
		vendidos: integer;
	end;
	
	maestro = file of producto;
	detalle = file of venta;

procedure actualizar(var am: maestro; var ad: detalle);
var
	infoMaestro: producto; infoDetalle: venta;
	cantidadVendidos: integer;
begin
	reset(am);
	reset(ad);
	while (not eof(am)) do begin
		cantidadVendidos := 0;
		read(am,infoMaestro);
		while (not eof(ad)) do begin
			read(ad,infoDetalle);
			if (infoDetalle.codigo = infoMaestro.codigo) then
				cantidadVendidos = cantidadVendidos + infoDetalle.codigo;
		end;
		infoMaestro.stockActual := infoMaestro.stockActual - infoDetalle.vendidos;
		seek(am, filePos(am)-1);
		write(am,infoMaestro);
		
		seek(ad,0);
	end;
	close(ad);
	close(am);
end;

var
	am: maestro; ad: detalle;
begin
	assign(am,'archivoMaestro');
	assign(ad,'archivoDetalle');
	actualizar(am,ad);
end;
