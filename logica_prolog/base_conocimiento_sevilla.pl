
% ================================
% Base de conocimiento: SEVILLA
% ================================

% ---- RUTAS DESDE SEVILLA ----

camino(sevilla, madrid, 530, 5.5, 4, 1).               % A-4
camino(sevilla, barcelona, 1000, 10, 3, 1).            % A-4 + AP-7
camino(sevilla, valencia, 660, 7, 3, 1).               % A-4 + A-3
camino(sevilla, bilbao, 900, 9, 2, 1).                 % A-4 + AP-68

% ---- RUTAS HACIA SEVILLA ----

camino(madrid, sevilla, 530, 5.5, 4, 1).
camino(barcelona, sevilla, 1000, 10, 3, 1).
camino(valencia, sevilla, 660, 7, 3, 1).
camino(bilbao, sevilla, 900, 9, 2, 1).

% ---- LUGARES DE INTERÉS EN DESTINOS ----

interes(madrid, 'Plaza Mayor').
interes(barcelona, 'Sagrada Familia').
interes(valencia, 'Ciudad de las Artes y las Ciencias').
interes(bilbao, 'Museo Guggenheim').

% ---- LUGARES INTERMEDIOS ENTRE RUTAS ----

interes_intermedio(sevilla, madrid, 'Parque Natural de Despeñaperros').
interes_intermedio(sevilla, barcelona, 'Alhambra de Granada (vía A-92)').
interes_intermedio(sevilla, valencia, 'Almagro (Ciudad Real)').
interes_intermedio(sevilla, bilbao, 'Medina Azahara (Córdoba)').

% ---- CLIMA ----

clima(sevilla, 30).
clima(madrid, 23).
clima(barcelona, 26).
clima(valencia, 28).
clima(bilbao, 21).
