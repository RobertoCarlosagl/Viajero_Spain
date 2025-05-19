from flask import Blueprint, render_template, request
from prolog_connector import consultar_ruta

app_routes = Blueprint('app_routes', __name__)

# Asociamos extensión por ciudad
EXTENSIONES = {
    'madrid': 'avif',
    'sevilla': 'avif',
    'barcelona': 'jpg',
    'valencia': 'jpg',
    'bilbao': 'jpg',
    'españa': 'jpg'
}

@app_routes.route('/', methods=['GET', 'POST'])
def index():
    resultado = None
    ciudad_destino = None
    ext = 'jpg'  # Valor por defecto

    if request.method == 'POST':
        origen = request.form['origen']
        destino = request.form['destino']
        tipo = request.form['tipo']

        resultado = consultar_ruta(origen, destino, tipo)
        ciudad_destino = destino
        ext = EXTENSIONES.get(destino, 'jpg')

    return render_template('index.html', resultado=resultado, ciudad=ciudad_destino, ext=ext)
