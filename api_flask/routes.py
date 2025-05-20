
from flask import Blueprint, render_template, request
from prolog_connector import consultar_ruta

app_routes = Blueprint('app_routes', __name__)

@app_routes.route('/', methods=['GET', 'POST'])
def home():
    resultado = ''
    imagen_destino = 'españa.jpg'
    ciudades = ['madrid', 'barcelona', 'valencia', 'sevilla', 'bilbao']

    if request.method == 'POST':
        origen = request.form.get('origen', '').lower()
        destino = request.form.get('destino', '').lower()
        tipo = request.form.get('tipo_ruta', '')

        if origen and destino and tipo:
            resultado = consultar_ruta(origen, destino, tipo)
            if destino in ciudades:
                imagen_destino = f"{destino}.jpg"

    return render_template('index.html',
                           resultado=resultado,
                           imagen_destino=imagen_destino,
                           ciudades=ciudades)
