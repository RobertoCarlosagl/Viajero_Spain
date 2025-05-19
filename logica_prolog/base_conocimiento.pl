% -------------------------
% Conexiones entre ciudades
% -------------------------
% camino(Ciudad1, Ciudad2, DistanciaKm, Tiempo, Calidad, Peaje).

camino(madrid, barcelona, 620, 6, 4, 1).
camino(barcelona, madrid, 620, 6, 4, 1).

camino(madrid, valencia, 350, 3, 3, 0).
camino(valencia, madrid, 350, 3, 3, 0).

camino(barcelona, valencia, 350, 3, 4, 0).
camino(valencia, barcelona, 350, 3, 4, 0).

camino(valencia, sevilla, 650, 7, 2, 1).
camino(sevilla, valencia, 650, 7, 2, 1).

camino(madrid, bilbao, 400, 4, 3, 0).
camino(bilbao, madrid, 400, 4, 3, 0).

camino(sevilla, bilbao, 900, 9, 2, 1).
camino(bilbao, sevilla, 900, 9, 2, 1).

camino(bilbao, barcelona, 600, 6, 4, 1).
camino(barcelona, bilbao, 600, 6, 4, 1).

camino(valencia, bilbao, 750, 8, 3, 1).
camino(bilbao, valencia, 750, 8, 3, 1).

% -------------------------
% Lugares de interés turístico
% -------------------------

% Ya tenías estos
interes(madrid, 'bernabeu').
interes(madrid, 'oso_madrono').
interes(madrid, 'plaza_mayor').
interes(barcelona, 'camp_nou').
interes(barcelona, 'sagrada_familia').
interes(valencia, 'playa_valencia').

% Nuevos agregados que pediste (mejor forma escrita)
interes(sevilla, 'Plaza de Sevilla').
interes(bilbao, 'Museo Guggenheim').
interes(valencia, 'Ciudad de las Artes y las Ciencias').
