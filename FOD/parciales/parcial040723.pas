program parcial040723;
type
    partido = record
        codigoEquipo: integer;
        nombreEquipo: string;
        anio: integer;
        codigoTorneo: integer;
        codigoRival: integer;
        golesFavor: integer;
        golesContra: integer;
        puntos: integer;
    end;
    archivo = file of partido;

procedure imprimir(var a: archivo);
var
    infoPartido: partido;
    nombreMax,nombreEquipo: string;
    maxPuntos,anio,golesFavor,golesContra,puntos,ganados,empatados,perdidos: integer;
begin
    reset(a);
    read(a,infoPartido);
    while (not eof(a)) do begin
        anio := infoPartido.anio;
        writeln('anio ', anio);
        while (not eof(a) && infoPartido.anio == anio) then begin
            codigoTorneo := infoPartido.codigoTorneo;
            writeln('codigo torneo ', codigoTorneo);
            while (not eof(a) && infoPartido.codigoTorneo == codigoTorneo) do begin
                golesFavor := 0; golesContra := 0; puntos := 0; ganados := 0; empatados := 0; perdidos := 0;

                while (not eof(a) && infoPartido.codigoEquipo == codigoEquipo) do begin
                    golesFavor := infoPartido.golesFavor; golesContra := infoPartido.golesContra;
                    if (infoPartido.puntos == 0) then
                        perdidos := perdidos + 1
                    else
                        if (infoPartido.puntos == 1) then
                            empatados := empatados + 1
                        else
                            ganados := ganados + 1;
                    puntos := puntos + infoPartido.puntos;
                    read(a,infoPartido);
                end;

                writeln('cod_equipo ', codigoEquipo, 'nombre equipo ', nombreEquipo);
                writeln('cantidad total goles a favor ', golesFavor);
                writeln('cantidad total goles en contra ', golesContra);
                writeln('diferencia de gol ', golesFavor-golesContra);
                writeln('cantidad de partidos ganados ', ganados);
                writeln('cantidad de partidos empatados ', empatados);
                writeln('cantidad de partidos perdidos ', perdidos);
                writeln('cantidad total de puntos en el torneo ', puntos);
                if (puntos > maxPuntos) then begin
                    maxPuntos := puntos;
                    nombreMax := nombreEquipo;
                end;
            end;
            writeln('El equipo ', nombreMax, ' fue campeon del torneo ', codigoTorneo, ' del anio ', anio);
        end;
    end;
    close(a);
end;

var
    a: archivo;
begin
    assing(a,'archivoPartidos');
    imprimir(a);
end.