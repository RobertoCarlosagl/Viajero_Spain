
% ================================
% Base de conocimiento: BILBAO
% ================================

% ---- RUTAS DESDE BILBAO ----

camino(bilbao, madrid, 400, 4, 3, 0).              % A-1
camino(bilbao, barcelona, 600, 6.5, 4, 1).         % AP-68
camino(bilbao, valencia, 750, 8, 3, 1).            % AP-68 + A-23
camino(bilbao, sevilla, 900, 9, 2, 1).             % A-1 + A-4

% ---- RUTAS HACIA BILBAO ----

camino(madrid, bilbao, 400, 4, 3, 0).
camino(barcelona, bilbao, 600, 6.5, 4, 1).
camino(valencia, bilbao, 750, 8, 3, 1).
camino(sevilla, bilbao, 900, 9, 2, 1).

% ---- LUGARES DE INTERÉS EN DESTINOS ----

interes(madrid, 'Templo de Debod').
interes(barcelona, 'Parc Güell').
interes(valencia, 'L’Oceanogràfic').
interes(sevilla, 'Real Alcázar de Sevilla').

% ---- LUGARES INTERMEDIOS ENTRE RUTAS ----

interes_intermedio(bilbao, madrid, 'Sierra de la Demanda').
interes_intermedio(bilbao, barcelona, 'Bardenas Reales (Navarra)').
interes_intermedio(bilbao, valencia, 'Albarracín (Teruel)').
interes_intermedio(bilbao, sevilla, 'Medina Azahara (Córdoba)').

% ---- CLIMA ----

clima(bilbao, 21).
clima(madrid, 23).
clima(barcelona, 26).
clima(valencia, 28).
clima(sevilla, 30).
