from flask import Flask, render_template, request, send_from_directory
import os
from routes import app_routes

app = Flask(__name__, static_folder='static', template_folder='templates')
app.register_blueprint(app_routes)
