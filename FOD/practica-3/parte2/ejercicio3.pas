program ejercicio3;
const
	dimF = 5;
type
	log = record
		codigo: integer;
		fecha: string;
		tiempoSesion: integer;
	end;
	archivo = file of log;
	vectorDetalles = array[1..dimF] of archivo;
	
procedure contabilizar(var am:archivo; var v: vectorDetalles);
var
	infoMaestro, infoDetalle: log;
	corte: boolean;
	i: integer;
begin
	rewrite(am);
	for i:=1 to dimF do begin
		reset(v[i]);
		while (not eof(v[i])) do begin
			corte := true;
			read(v[i], infoDetalle);
			while (not eof(am) and corte) do begin
				read(am,infoMaestro);
				if (infoMaestro.codigo = infoDetalle.codigo) then
					corte := false;
			end;
			
			if (corte) then
				write(am,infoDetalle)
			else begin
				infoDetalle.tiempoSesion := infoDetalle.tiempoSesion + infoMaestro.tiempoSesion;
				seek(am, filepos(am)-1);
				write(am,infoDetalle);
			end;
			seek(am, 0);
		end;
		close(v[i]);
	end;
	close(am);
end;

var
	v: vectorDetalles;
	am: archivo;
begin
	assign(am, 'archivoMaestro');
	assign(v[1], '1');
	assign(v[2], '2');
	assign(v[3], '3');
	assign(v[4], '4');
	assign(v[5], '5');
	contabilizar(am,v);
end;
	
