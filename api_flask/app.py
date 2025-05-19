from flask import Flask, render_template, request, send_from_directory
import os
from routes import app_routes

# Crear la app con rutas estáticas y plantillas personalizadas
app = Flask(__name__, static_folder='static', template_folder='templates')

# Registrar el blueprint con las rutas
app.register_blueprint(app_routes)

# Iniciar el servidor cuando se ejecuta directamente
if __name__ == '__main__':
    print("[INFO] Flask está corriendo en http://127.0.0.1:5000")
    app.run(debug=True)
    
    
