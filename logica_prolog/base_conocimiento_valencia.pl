
% ================================
% Base de conocimiento: VALENCIA
% ================================

% ---- RUTAS DESDE VALENCIA ----

camino(valencia, madrid, 350, 3.5, 3, 0).             % A-3
camino(valencia, barcelona, 350, 3.5, 4, 0).          % AP-7
camino(valencia, bilbao, 750, 8, 3, 1).               % A-23 + AP-68
camino(valencia, sevilla, 660, 7, 3, 1).              % A-3 + A-4

% ---- RUTAS HACIA VALENCIA ----

camino(madrid, valencia, 350, 3.5, 3, 0).
camino(barcelona, valencia, 350, 3.5, 4, 0).
camino(bilbao, valencia, 750, 8, 3, 1).
camino(sevilla, valencia, 660, 7, 3, 1).

% ---- LUGARES DE INTERÉS EN DESTINOS ----

interes(madrid, 'Bernabéu').
interes(barcelona, 'Camp Nou').
interes(bilbao, 'Museo Guggenheim').
interes(sevilla, 'Metropol Parasol').

% ---- LUGARES INTERMEDIOS ENTRE RUTAS ----

interes_intermedio(valencia, madrid, 'Parque Natural de las Hoces del Cabriel').
interes_intermedio(valencia, bilbao, 'Albarracín (Teruel)').
interes_intermedio(valencia, sevilla, 'Almagro (Ciudad Real)').

% ---- CLIMA ----

clima(valencia, 28).
clima(madrid, 23).
clima(barcelona, 26).
clima(bilbao, 21).
clima(sevilla, 30).
