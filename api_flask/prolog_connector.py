import subprocess
import os

def consultar_ruta(origen, destino, tipo):
    base_path = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))
    viajero_path = os.path.join(base_path, 'logica_prolog', 'viajero.pl')

    tipo_predicado = {
        'corta': 'ruta_mas_corta',
        'segura': 'ruta_segura',
        'sin_peaje': 'ruta_sin_peaje',
        'buen_clima': 'ruta_buen_clima',
        'interes': 'ruta_con_interes'
    }

    if tipo not in tipo_predicado:
        return 'Tipo de ruta no válida.'

    # Construir consulta según el tipo
    if tipo in ['corta', 'segura']:
        consulta = (
            f"{tipo_predicado[tipo]}({origen}, {destino}, Ruta, Valor), "
            "write('Ruta: '), write(Ruta), nl, "
            "write('Valor: '), write(Valor), nl."
        )
    elif tipo == 'interes':
        consulta = (
            f"{tipo_predicado[tipo]}({origen}, {destino}, Ruta, Lugares), "
            "write('Ruta: '), write(Ruta), nl, "
            "write('Lugares de interés: '), write(Lugares), nl."
        )
    else:
        consulta = (
            f"{tipo_predicado[tipo]}({origen}, {destino}, Ruta), "
            "write('Ruta: '), write(Ruta), nl."
        )

    comando = [
        r"C:\Program Files\swipl\bin\swipl.exe",  # Ajusta si tu swipl está en otro path
        '-q',
        '-l', viajero_path,
        '-g', consulta,
        '-t', 'halt'
    ]

    try:
        resultado = subprocess.check_output(comando, stderr=subprocess.STDOUT, text=True)
        print("[INFO] RESPUESTA DE PROLOG:\n", resultado)
        return resultado.strip()
    except subprocess.CalledProcessError as e:
        return f"⚠️ Error en Prolog: {e.output}"
