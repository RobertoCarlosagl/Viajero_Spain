import subprocess

def consultar_ruta(origen, destino, tipo):
    tipo_predicado = {
        'corta': 'ruta_mas_corta',
        'segura': 'ruta_segura',
        'sin_peaje': 'ruta_sin_peaje',
        'buen_clima': 'ruta_buen_clima'
    }

    if tipo not in tipo_predicado:
        return 'Tipo de ruta no válida.'

    # Construcción dinámica de consulta
    if tipo in ['corta', 'segura']:
        consulta = (
            f"{tipo_predicado[tipo]}({origen}, {destino}, Ruta, Valor), "
            "write('Ruta: '), write(Ruta), nl, "
            "write('Valor: '), write(Valor), nl."
        )
    else:
        consulta = (
            f"{tipo_predicado[tipo]}({origen}, {destino}, Ruta), "
            "write('Ruta: '), write(Ruta), nl."
        )

    comando = [
        r"C:\Program Files\swipl\bin\swipl.exe",
        '-q',
        '-l', 'logica_prolog/viajero.pl',
        '-g', consulta,
        '-t', 'halt'
    ]

    try:
        resultado = subprocess.check_output(comando, stderr=subprocess.STDOUT, text=True)
        print("✅ RESPUESTA DE PROLOG:\n", resultado)
        return resultado.strip()
    except subprocess.CalledProcessError as e:
        return f"⚠️ Error en Prolog: {e.output}"
