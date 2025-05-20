
% ================================
% Base de conocimiento: BARCELONA
% ================================

% ---- RUTAS DESDE BARCELONA ----

camino(barcelona, madrid, 620, 6, 4, 1).           % A-2
camino(barcelona, valencia, 350, 3.5, 4, 0).       % AP-7
camino(barcelona, bilbao, 600, 6.5, 4, 1).         % AP-2 + AP-68
camino(barcelona, sevilla, 1000, 10, 3, 1).        % AP-7 + A-4/A-92

% ---- RUTAS HACIA BARCELONA ----

camino(madrid, barcelona, 620, 6, 4, 1).
camino(valencia, barcelona, 350, 3.5, 4, 0).
camino(bilbao, barcelona, 600, 6.5, 4, 1).
camino(sevilla, barcelona, 1000, 10, 3, 1).

% ---- LUGARES DE INTERÉS EN DESTINOS ----

interes(madrid, 'Plaza Mayor').
interes(valencia, 'Playa de la Malvarrosa').
interes(bilbao, 'Museo Guggenheim').
interes(sevilla, 'Catedral de Sevilla').

% ---- LUGARES INTERMEDIOS ENTRE RUTAS ----

interes_intermedio(barcelona, madrid, 'Monasterio de Piedra (Zaragoza)').
interes_intermedio(barcelona, valencia, 'Delta del Ebro').
interes_intermedio(barcelona, bilbao, 'Bardenas Reales (Navarra)').
interes_intermedio(barcelona, sevilla, 'Alhambra de Granada (si pasa por A-92)').

% ---- CLIMA ----

clima(barcelona, 26).
clima(madrid, 23).
clima(valencia, 28).
clima(bilbao, 21).
clima(sevilla, 30).
