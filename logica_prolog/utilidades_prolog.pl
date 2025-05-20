
% ====================================
% utilidades_prolog.pl
% Funciones auxiliares para predicados
% ====================================

% Calcular calidad promedio en la ruta
calcular_calidad_promedio([], 0).
calcular_calidad_promedio([_], 0).
calcular_calidad_promedio([A, B|T], Prom) :-
    findall(C, camino(A, B, _, _, C, _), Calidades),
    sum_list(Calidades, Suma),
    length(Calidades, N),
    N > 0,
    Media is Suma / N,
    calcular_calidad_promedio([B|T], PromRest),
    Prom is (Media + PromRest) / 2.

% Estimar tráfico basado en longitud de ruta
estimar_trafico(Ruta, 'Bajo') :- length(Ruta, L), L < 4.
estimar_trafico(Ruta, 'Medio') :- length(Ruta, L), L >= 4, L =< 6.
estimar_trafico(Ruta, 'Alto') :- length(Ruta, L), L > 6.
