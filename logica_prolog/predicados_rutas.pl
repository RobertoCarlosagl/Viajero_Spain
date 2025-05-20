
:- use_module(library(lists)).
:- consult('utilidades_prolog.pl').

% ---------------------
% RUTA MÁS CORTA
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

ruta_mas_corta_explicada(Origen, Destino, Ruta, Explicacion) :-
    ruta_mas_corta(Origen, Destino, Ruta, Distancia),
    atomic_list_concat(Ruta, ' → ', RutaBonita),
    format(atom(Explicacion), 'Ruta más corta de ~w a ~w: ~w. Distancia total: ~w km. Es la ruta más corta entre ambas ciudades.', [Origen, Destino, RutaBonita, Distancia]).

% ---------------------
% RUTA SEGURA
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

ruta_segura_explicada(Origen, Destino, Ruta, Explicacion) :-
    ruta_segura(Origen, Destino, Ruta, Calidad),
    atomic_list_concat(Ruta, ' → ', RutaBonita),
    format(atom(Explicacion), 'Ruta más segura de ~w a ~w: ~w. Suma de calidad: ~w. Todos los caminos son de buena calidad.', [Origen, Destino, RutaBonita, Calidad]).

% ---------------------
% RUTA RÁPIDA (basada en tiempo y calidad)
% ---------------------
ruta_rapida(Origen, Destino, Ruta, TiempoTotal) :-
    camino_rapido(Origen, Destino, [Origen], Ruta, TiempoTotal).

camino_rapido(Destino, Destino, Ruta, Ruta, 0).
camino_rapido(Origen, Destino, Visitados, RutaFinal, TiempoTotal) :-
    camino(Origen, Siguiente, _, Tiempo, _, _),
    \+ member(Siguiente, Visitados),
    camino_rapido(Siguiente, Destino, [Siguiente|Visitados], RutaFinal, TiempoRestante),
    TiempoTotal is Tiempo + TiempoRestante.

ruta_rapida_explicada(Origen, Destino, Ruta, Explicacion) :-
    ruta_rapida(Origen, Destino, Ruta, Tiempo),
    calcular_calidad_promedio(Ruta, CalidadProm),
    estimar_trafico(Ruta, Trafico),
    atomic_list_concat(Ruta, ' → ', RutaBonita),
    format(atom(Explicacion), 'Ruta más rápida de ~w a ~w: ~w. Tiempo estimado: ~w hrs. Calidad: ~w. Tráfico: ~w.', [Origen, Destino, RutaBonita, Tiempo, CalidadProm, Trafico]).

% ---------------------
% RUTA CON INTERÉS
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
    ), Lugares).

ruta_con_interes_explicada(Origen, Destino, Ruta, Explicacion) :-
    ruta_con_interes(Origen, Destino, Ruta, Lugares),
    atomic_list_concat(Ruta, ' → ', RutaBonita),
    atomic_list_concat(Lugares, ', ', LugaresTexto),
    format(atom(Explicacion), 'Ruta turística de ~w a ~w: ~w. Lugares de interés encontrados: ~w.', [Origen, Destino, RutaBonita, LugaresTexto]).

% ---------------------
% RUTA PERSONALIZADA (Clima + Interés)
% ---------------------
ruta_personalizada_explicada(Origen, Destino, Ruta, Explicacion) :-
    ruta_con_interes(Origen, Destino, Ruta, Lugares),
    findall(Ciudad, (
        member(Ciudad, Ruta),
        clima(Ciudad, _)
    ), CiudadesClima),
    atomic_list_concat(Ruta, ' → ', RutaBonita),
    atomic_list_concat(CiudadesClima, ', ', ClimasTexto),
    atomic_list_concat(Lugares, ', ', LugaresTexto),
    format(atom(Explicacion), 'Ruta personalizada de ~w a ~w: ~w. Clima ideal en: ~w. Lugares de interés en la ruta: ~w.', [Origen, Destino, RutaBonita, ClimasTexto, LugaresTexto]).
