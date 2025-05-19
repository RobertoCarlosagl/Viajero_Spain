:- use_module(library(lists)).
:- consult('base_conocimiento.pl').

% ---------------------
% RUTA MÁS CORTA (DISTANCIA)
% ---------------------
ruta_mas_corta(Origen, Destino, Ruta, Distancia) :-
    setof([R, D], ruta_con_distancia(Origen, Destino, R, D), [[Ruta, Distancia]|_]).

ruta_con_distancia(Origen, Destino, Ruta, Distancia) :-
    camino_minimo(Origen, Destino, [Origen], Ruta, Distancia).

camino_minimo(Destino, Destino, Ruta, Ruta, 0).
camino_minimo(Origen, Destino, Visitados, RutaFinal, DistanciaTotal) :-
    camino(Origen, Siguiente, Dist, _, _, _),
    \+ member(Siguiente, Visitados),
    camino_minimo(Siguiente, Destino, [Siguiente|Visitados], RutaFinal, DistanciaRestante),
    DistanciaTotal is Dist + DistanciaRestante.

% ---------------------
% RUTA SEGURA (CALIDAD MÁXIMA)
% ---------------------
ruta_segura(Origen, Destino, Ruta, CalidadTotal) :-
    setof([R, C], ruta_con_calidad(Origen, Destino, R, C), [[Ruta, CalidadTotal]|_]).

ruta_con_calidad(Origen, Destino, Ruta, Calidad) :-
    camino_seguro(Origen, Destino, [Origen], Ruta, Calidad).

camino_seguro(Destino, Destino, Ruta, Ruta, 0).
camino_seguro(Origen, Destino, Visitados, RutaFinal, CalidadTotal) :-
    camino(Origen, Siguiente, _, _, Cal, _),
    \+ member(Siguiente, Visitados),
    camino_seguro(Siguiente, Destino, [Siguiente|Visitados], RutaFinal, CalidadRestante),
    CalidadTotal is Cal + CalidadRestante.

% ---------------------
% RUTA SIN PEAJE
% ---------------------
ruta_sin_peaje(Origen, Destino, Ruta) :-
    camino_sin_peaje(Origen, Destino, [Origen], Ruta).

camino_sin_peaje(Destino, Destino, Ruta, Ruta).
camino_sin_peaje(Origen, Destino, Visitados, RutaFinal) :-
    camino(Origen, Siguiente, _, _, _, 0),
    \+ member(Siguiente, Visitados),
    camino_sin_peaje(Siguiente, Destino, [Siguiente|Visitados], RutaFinal).

% ---------------------
% RUTA CON BUEN CLIMA (usamos lista estática de ciudades)
% ---------------------
ciudad_clima_ideal(madrid).
ciudad_clima_ideal(valencia).
ciudad_clima_ideal(sevilla).

ruta_buen_clima(Origen, Destino, Ruta) :-
    camino_clima_bueno(Origen, Destino, [Origen], Ruta).

camino_clima_bueno(Destino, Destino, Ruta, Ruta).
camino_clima_bueno(Origen, Destino, Visitados, RutaFinal) :-
    camino(Origen, Siguiente, _, _, _, _),
    ciudad_clima_ideal(Siguiente),
    \+ member(Siguiente, Visitados),
    camino_clima_bueno(Siguiente, Destino, [Siguiente|Visitados], RutaFinal).

% ---------------------
% RUTA QUE PASE POR LUGAR DE INTERÉS
% ---------------------

ruta_con_interes(Origen, Destino, Ruta, Lugares) :-
    camino_con_interes(Origen, Destino, [Origen], Ruta),
    contiene_interes(Ruta, Lugares).

camino_con_interes(Destino, Destino, Ruta, Ruta).
camino_con_interes(Origen, Destino, Visitados, RutaFinal) :-
    camino(Origen, Siguiente, _, _, _, _),
    \+ member(Siguiente, Visitados),
    camino_con_interes(Siguiente, Destino, [Siguiente|Visitados], RutaFinal).

contiene_interes(Ruta, Lugares) :-
    findall(Lugar, (
        member(Ciudad, Ruta),
        interes(Ciudad, Lugar)
    ), Lugares),
    Lugares \= [].
