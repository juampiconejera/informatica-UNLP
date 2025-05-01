{5. Dada la estructura planteada en el ejercicio anterior, implemente el siguiente módulo: 
{Abre el archivo y elimina la flor recibida como parámetro manteniendo 
la política descripta anteriormente
procedure eliminarFlor (var a: tArchFlores; flor:reg_flor); }
program ejercicio4;
type
	regFlor = record
		nombre: string[45];
		codigo: integer;
	end;
	tArchFlores = file of regFlor;
	
procedure agregarFlor (var a: tArchFlores; nombre: string; codigo: integer);
var
	f, aux: regFlor;
begin
	f.nombre := nombre; f.codigo := codigo;
	reset(a);
	
	read(a, aux);
	if (aux.codigo = 0) then begin
		seek(a, fileSize(a);
		write(a,f);
	end else begin
		seek(a, aux.codigo * -1);
		read(a, aux);
	
		seek(a, filePos(a)-1);
		write(a,f);
	
		seek(a, 0);
		write(a,aux);
	end;
	close(a);
end;

procedure leerArchivo(var a: tArchFlores);
var
	f: regFlor;
begin
	reset(a);
	seek(a,1);
	while (not eof(a)) do begin
		read(a, f);
		if (f.codigo > 0) then 
			writeln('codigo: ', f.codigo, '. nombre: ', f.nombre);
	end;
	close(a);
end;


procedure eliminarFlor (var a: tArchFlores; flor: regFlor); 
