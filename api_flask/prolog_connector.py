
import subprocess
import os

def consultar_ruta(origen, destino, tipo):
    base_path = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))
    viajero_path = os.path.join(base_path, 'logica_prolog', 'viajero.pl')

    tipo_predicado = {
        'corta': 'ruta_mas_corta_explicada',
        'segura': 'ruta_segura_explicada',
        'rapida': 'ruta_rapida_explicada',
        'sin_peaje': 'ruta_sin_peaje_explicada',  # Puede implementarse o dejarse como futura opción
        'buen_clima': 'ruta_personalizada_explicada',
        'interes': 'ruta_con_interes_explicada'
    }

    if tipo not in tipo_predicado:
        return '⚠️ Tipo de ruta no válida.'

    predicado = tipo_predicado[tipo]
    consulta = (
        f"{predicado}({origen.lower()}, {destino.lower()}, Ruta, Exp), "
        "write(Exp), nl."
    )

    comando = [
        r"C:\Program Files\swipl\bin\swipl.exe",  # Cambiar si usas otro path de instalación
        '-q',
        '-l', viajero_path,
        '-g', consulta,
        '-t', 'halt'
    ]

    try:
        resultado = subprocess.check_output(comando, stderr=subprocess.STDOUT, text=True)
        return resultado.strip()
    except subprocess.CalledProcessError as e:
        return f"⚠️ Error al consultar Prolog: {e.output}"
