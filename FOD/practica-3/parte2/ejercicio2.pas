program ejercicio2;
type
	localidad = record
		codigoLocalidad: integer;
		numeroMesa: integer;
		cantidadVotos: integer;
	end;
	archivo = file of localidad;
	
procedure contabilizar(var am, aux: archivo);
var
	corte: boolean;
	infoMaestro, infoAux: localidad;
begin
	rewrite(aux);
	reset(am);
	while (not eof(am)) do begin
		read(am,infoMaestro);
		corte := true;
		while ( (not eof (aux)) and corte) do begin
			read(aux,infoAux);
			if (infoAux.codigoLocalidad = infoMaestro.codigoLocalidad) then
				corte := false;
		end;
		
		if (corte) then
			write(aux,infoAux)
		else begin
			infoAux.cantidadVotos := infoAux.cantidadVotos + infoMaestro.cantidadVotos;
			seek(aux, filepos(aux)-1);
			write(aux,infoAux);
		end;
		seek(aux,0);
	end;
	close(am);
	close(aux);
end;

procedure imprimir(var aux: archivo);
var
	infoAux: localidad;
	total: integer;
begin
	reset(aux);
	total := 0;
	writeln('codigo de localidad			Total de votos')
	while (not eof (aux)) do begin
		read(aux,infoAux);
		writeln(infoAux.codigoLocalidad, '				', infoAux.cantidadVotos);
		total := total + infoAux.cantidadVotos;
	end;
	writeln('Total general de votos:		', total);
	close(aux);
end;

var
	am,aux: archivo;
begin
	assign(am, 'archivoMaestro');
	assign(aux, 'archivoAuxiliar');
	contabilizar(am,aux);
	imprimir(aux);
end;
