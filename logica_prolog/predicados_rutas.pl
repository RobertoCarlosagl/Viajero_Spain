% ---------------------------------------------
% Cargar los hechos desde base_conocimiento.pl
% ---------------------------------------------
:- consult('base_conocimiento.pl').

% ---------------------------------------------
% Buscar rutas posibles entre dos ciudades
% ---------------------------------------------

ruta(CiudadA, CiudadB, Ruta, DistanciaTotal) :-
    ruta_aux(CiudadA, CiudadB, [CiudadA], RutaInvertida, 0, DistanciaTotal),
    reverse(RutaInvertida, Ruta).

ruta_aux(Ciudad, Ciudad, Ruta, Ruta, Dist, Dist).
ruta_aux(Actual, Destino, Visitadas, RutaFinal, DistAcumulada, DistFinal) :-
    camino(Actual, Siguiente, Dist, _, _, _, _, _, _),
    \+ member(Siguiente, Visitadas),
    NuevaDistancia is DistAcumulada + Dist,
    ruta_aux(Siguiente, Destino, [Siguiente|Visitadas], RutaFinal, NuevaDistancia, DistFinal).

% ---------------------------------------------
% Ruta más corta
% ---------------------------------------------

ruta_mas_corta(Inicio, Fin, RutaOptima, DistanciaOptima) :-
    findall([R,D], ruta(Inicio, Fin, R, D), Rutas),
    minimo_distancia(Rutas, [RutaOptima, DistanciaOptima]).

minimo_distancia([Ruta], Ruta).
minimo_distancia([[R1,D1],[_,D2]|T], Resultado) :-
    D1 =< D2,
    minimo_distancia([[R1,D1]|T], Resultado).
minimo_distancia([[_,D1],[R2,D2]|T], Resultado) :-
    D1 > D2,
    minimo_distancia([[R2,D2]|T], Resultado).

% ---------------------------------------------
% Ruta más segura (mejor calidad promedio)
% ---------------------------------------------

valor_calidad(buena, 3).
valor_calidad(media, 2).
valor_calidad(mala, 1).

ruta_segura(Inicio, Fin, RutaOptima, CalidadProm) :-
    findall([R,C], ruta_con_calidad(Inicio, Fin, R, C), Rutas),
    maximo_calidad(Rutas, [RutaOptima, CalidadProm]).

ruta_con_calidad(Inicio, Fin, Ruta, CalidadProm) :-
    ruta(Inicio, Fin, Ruta, _),
    calidad_total(Ruta, Total, Count),
    CalidadProm is Total / Count.

calidad_total([_], 0, 0).
calidad_total([A,B|T], Total, Count) :-
    camino(A, B, _, Calidad, _, _, _, _, _),
    valor_calidad(Calidad, Valor),
    calidad_total([B|T], TotalRestante, CRestante),
    Total is Valor + TotalRestante,
    Count is 1 + CRestante.

maximo_calidad([Ruta], Ruta).
maximo_calidad([[R1,C1],[_,C2]|T], Resultado) :-
    C1 >= C2,
    maximo_calidad([[R1,C1]|T], Resultado).
maximo_calidad([[_,C1],[R2,C2]|T], Resultado) :-
    C1 < C2,
    maximo_calidad([[R2,C2]|T], Resultado).

% ---------------------------------------------
% Ruta que pase por lugar de interés
% ---------------------------------------------

ruta_con_interes(Inicio, Fin, Interes, Ruta) :-
    ruta(Inicio, Fin, Ruta, _),
    incluye_interes(Ruta, Interes).

incluye_interes([_], _) :- false.
incluye_interes([A,B|T], Interes) :-
    camino(A, B, _, _, _, Lista, _, _, _),
    member(Interes, Lista);
    incluye_interes([B|T], Interes).
