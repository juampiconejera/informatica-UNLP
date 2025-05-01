{4. Dada la siguiente estructura:
type 
reg_flor = record 
nombre: String[45]; 
codigo: integer; 
end; 
tArchFlores = file of reg_flor; 
{Las bajas se realizan apilando registros borrados y las altas reutilizando registros 
borrados. El registro 0 se usa como cabecera de la pila de registros borrados: el 
número 0 en el campo código implica que no hay registros borrados y -N indica que el 
próximo registro a reutilizar es el N, siendo éste un número relativo de registro válido.  
a. Implemente el siguiente módulo: 

{Abre el archivo y agrega una flor, recibida como parámetro 
manteniendo la política descrita anteriormente
procedure agregarFlor (var a: tArchFlores ; nombre: string; codigo:integer);
{b. Liste el contenido del archivo omitiendo las flores eliminadas. Modifique lo que 
considere necesario para obtener el listado.}
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

