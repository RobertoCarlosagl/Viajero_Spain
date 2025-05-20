
% ============================
% Base de conocimiento: MADRID
% ============================

% ---- RUTAS DESDE MADRID ----

camino(madrid, barcelona, 620, 6, 4, 1).      % A-2
camino(madrid, valencia, 350, 3.5, 3, 0).     % A-3
camino(madrid, bilbao, 400, 4, 3, 0).         % A-1
camino(madrid, sevilla, 530, 5.5, 4, 1).      % A-4

% ---- RUTAS HACIA MADRID ----

camino(barcelona, madrid, 620, 6, 4, 1).
camino(valencia, madrid, 350, 3.5, 3, 0).
camino(bilbao, madrid, 400, 4, 3, 0).
camino(sevilla, madrid, 530, 5.5, 4, 1).

% ---- LUGARES DE INTERÉS EN DESTINOS ----

interes(barcelona, 'Camp Nou').
interes(barcelona, 'Sagrada Familia').
interes(valencia, 'Ciudad de las Artes y las Ciencias').
interes(bilbao, 'Museo Guggenheim').
interes(sevilla, 'Plaza de Sevilla').

% ---- LUGARES INTERMEDIOS ENTRE RUTAS ----

interes_intermedio(madrid, barcelona, 'Monasterio de Piedra (Zaragoza)').
interes_intermedio(madrid, valencia, 'Parque Natural de las Hoces del Cabriel').
interes_intermedio(madrid, bilbao, 'Sierra de la Demanda').
interes_intermedio(madrid, sevilla, 'Parque Natural de Despeñaperros').

% ---- CLIMA ----

clima(madrid, 23).
clima(barcelona, 26).
clima(valencia, 28).
clima(bilbao, 21).
clima(sevilla, 30).
