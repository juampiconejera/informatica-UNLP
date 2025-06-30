program ejercicio7;
const
	valorAlto = 999;
type
	ave = record
		codigo: integer;
		tipo: string;
		familia: string;
		descripcion: string;
		zona: string;
	end;
	maestro = file of ave;

procedure bajaLogica(var am: maestro);
var
	cod: integer;
	infoMaestro: ave;
begin
	reset(am);
	write('Codigo de ave a borrar: '); readln(cod);
	while ((not eof(am)) and (cod <> -1)) do begin
		read(am,infoMaestro);
		if (cod = infoMaestro.codigo) then begin
			infoMaestro.codigo := -1;
			seek(am, filePos(am)-1);
			write(am, infoMaestro);
		end;
		seek(am,0);
		write('Codigo de ave a borrar ( (-1) para salir): '); readln(cod);
	end;
	close(am);
end;

procedure leer(var am: maestro; var a: ave);
begin
	if (not eof(am)) then
		read(am, a)
	else
		a.codigo := valorAlto;
end;

procedure compactar(var am: maestro);
var
	infoMaestro: ave;
	pos: integer;
begin
	reset(am);
	leer(am,infoMaestro);
	while (infoMaestro.codigo <> valorAlto) do begin
		if (infoMaestro.codigo < 0) then begin
			pos := filePos(am) - 1;
			seek(am, fileSize(am)-1);
			read(am, infoMaestro);
			seek(am, pos);
			write(am, infoMaestro);
			seek(am, filesize(am)-1);
			truncate(am);
			seek(am, pos);
		end;
		leer(am,infoMaestro);
	end;
	close(am);
end;

procedure compactarB(var am: maestro);
var
	infoMaestro: ave;
	pos, ultPos: integer;
begin
	reset(am);
	leer(am,infoMaestro);
	ultPos := filesize(am)-1;
	while (infoMaestro.codigo <> valorAlto) do begin
		if (infoMaestro.codigo < 0) then begin
			pos := filePos(am) - 1;
			seek(am, ultPos);
			read(am, infoMaestro);
			seek(am, pos);
			write(am, infoMaestro);
			ultPos := ultPos - 1;
		end;
		leer(am,infoMaestro);
	end;
	seek(am, ultPos);
	truncate(am);
	close(am);
end;

var
	archivoMaestro: maestro;
begin
	assign(archivoMaestro, 'maestro');
	bajaLogica(archivoMaestro);
	compactar(archivoMaestro);
end.
