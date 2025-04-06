program ejercicio1;
type
    archivo = file of integer;
var
    archivoLogico : archivo;
    numero : integer;
    archivoFisico : string[12];
begin
    writeln('Nombre del archivo: ');
    readln(archivoFisico);
    assign(archivoLogico, archivoFisico + '.dat');
    rewrite(archivoLogico);
    read(numero);
    while (numero <> 30000) do begin
        write(archivoLogico, numero);
        read(numero);
    end;
    close(archivoLogico);
end.
