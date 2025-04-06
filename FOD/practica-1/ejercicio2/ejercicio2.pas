program ejercicio2;
type
    archivo = file of integer;
var
    archivoLogico : archivo;
    cantidadLineas, numeroActual, numerosMenores, sumaTotal, i : integer;
    archivoFisico : string[12];
begin
	numerosMenores := 0;
	sumaTotal := 0;

    writeln('Nombre del archivo: ');
    readln(archivoFisico);
    assign(archivoLogico, archivoFisico + '.dat');
    reset(archivoLogico);
    cantidadLineas := fileSize(archivoLogico);
    for i := 1 to cantidadLineas do begin
		read(archivoLogico, numeroActual);
		if (numeroActual < 1500) then
			numerosMenores := numerosMenores + 1;
		sumaTotal := sumaTotal + numeroActual;
    end;
    writeln('Hay ', numerosMenores, ' numeros menores a 1500.');
    writeln('El promedio de numeros es: ', (sumaTotal/numeroActual):2:2);
    
    close(archivoLogico);
end.
