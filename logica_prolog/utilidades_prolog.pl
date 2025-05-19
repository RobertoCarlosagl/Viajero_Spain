:- consult('base_conocimiento.pl').
:- consult('predicados_rutas.pl').

% ---------------------------------------------
% Filtro: evitar peajes en la ruta
% ---------------------------------------------

ruta_sin_peaje(Inicio, Fin, Ruta) :-
    ruta(Inicio, Fin, Ruta, _),
    sin_peaje(Ruta).

sin_peaje([_]).
sin_peaje([A,B|T]) :-
    camino(A, B, _, _, _, _, _, _, Peaje),
    Peaje == no,
    sin_peaje([B|T]).

% ---------------------------------------------
% Filtro: evitar mal clima en el camino
% ---------------------------------------------

ruta_buen_clima(Inicio, Fin, Ruta) :-
    ruta(Inicio, Fin, Ruta, _),
    sin_clima_malo(Ruta).

% Consideramos "lluvia" y "viento" como climas malos
clima_malo(lluvia).
clima_malo(viento).

sin_clima_malo([_]).
sin_clima_malo([A,B|T]) :-
    camino(A, B, _, _, _, _, _, Clima, _),
    \+ clima_malo(Clima),
    sin_clima_malo([B|T]).

% ---------------------------------------------
% Filtro: usar solo tipo de carretera específica
% ---------------------------------------------

ruta_tipo_carretera(Inicio, Fin, TipoDeseado, Ruta) :-
    ruta(Inicio, Fin, Ruta, _),
    solo_tipo_carretera(Ruta, TipoDeseado).

solo_tipo_carretera([_], _).
solo_tipo_carretera([A,B|T], Tipo) :-
    camino(A, B, _, _, _, _, Tipo, _, _),
    solo_tipo_carretera([B|T], Tipo).

% ---------------------------------------------
% Ruta que tenga al menos un atractivo turístico
% ---------------------------------------------

ruta_con_alguna_atraccion(Inicio, Fin, Ruta, Lugar) :-
    ruta(Inicio, Fin, Ruta, _),
    tiene_algun_atractivo(Ruta, Lugar).

tiene_algun_atractivo([_], _) :- false.
tiene_algun_atractivo([A,B|T], Lugar) :-
    camino(A, B, _, _, _, Lista, _, _, _),
    member(Lugar, Lista);
    tiene_algun_atractivo([B|T], Lugar).

