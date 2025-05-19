% -------------------------
% Conexiones entre ciudades
% -------------------------
% camino(Ciudad1, Ciudad2, DistanciaKm, Calidad, Trafico, [LugaresInteres], TipoCarretera, Clima, Peaje).

camino(madrid, barcelona, 620, buena, medio, [bernabeu, oso_madrono, plaza_mayor], autopista, soleado, si).
camino(barcelona, madrid, 620, buena, medio, [camp_nou, sagrada_familia], autopista, nublado, si).

camino(madrid, valencia, 350, media, medio, [plaza_mayor], autopista, soleado, no).
camino(valencia, madrid, 350, media, bajo, [playa_valencia], autopista, soleado, no).

camino(barcelona, valencia, 350, buena, bajo, [camp_nou], carretera, soleado, no).
camino(valencia, barcelona, 350, buena, bajo, [sagrada_familia], carretera, nublado, no).

camino(valencia, sevilla, 650, mala, alto, [], carretera, lluvia, si).
camino(sevilla, valencia, 650, mala, medio, [], carretera, nublado, si).

camino(madrid, bilbao, 400, buena, bajo, [], autopista, nublado, no).
camino(bilbao, madrid, 400, buena, bajo, [], autopista, soleado, no).

camino(sevilla, bilbao, 900, media, bajo, [], carretera, soleado, si).
camino(bilbao, sevilla, 900, media, bajo, [], carretera, soleado, si).

camino(bilbao, barcelona, 600, buena, medio, [], autopista, viento, si).
camino(barcelona, bilbao, 600, buena, medio, [], autopista, soleado, si).

% -------------------------
% Atractivos turísticos
% -------------------------
atractivo(madrid, bernabeu).
atractivo(madrid, oso_madrono).
atractivo(madrid, plaza_mayor).

atractivo(barcelona, camp_nou).
atractivo(barcelona, sagrada_familia).

atractivo(valencia, playa_valencia).
