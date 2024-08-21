# from flask import Flask, jsonify
# from flask_sqlalchemy import SQLAlchemy
# from flask_cors import CORS
# import logging
# import traceback


# # Configura logging básico
# logging.basicConfig()
# logging.getLogger('sqlalchemy.engine').setLevel(logging.INFO)

# app = Flask(__name__)
# CORS(app)  # Habilita CORS para todas las rutas

# # Configuración para la autenticación de Windows con SQL Server
# connection_string = "mssql+pyodbc://@DESKTOP-A239JMJ\\SQLEXPRESS/Bulls_App?driver=ODBC Driver 17 for SQL Server;trusted_connection=yes;"
# app.config['SQLALCHEMY_DATABASE_URI'] = connection_string
# app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
# app.config['SQLALCHEMY_ECHO'] = True  # Habilita el logging de todas las consultas SQL

# db = SQLAlchemy(app)

# class Movimiento(db.Model):
#     __tablename__ = 'Movimientos'
#     movimiento_id = db.Column(db.Integer, primary_key=True)
#     nombre = db.Column(db.String(255), nullable=False)
#     tipo = db.Column(db.String(50), nullable=False)
#     descripcion = db.Column(db.Text)
#     imagen_url = db.Column(db.String(350))
#     video_url = db.Column(db.String(350))
#     youtube_video_id = db.Column(db.String(255))

#     def to_dict(self):
#         return {
#             'id': self.movimiento_id,
#             'nombre': self.nombre,
#             'tipo': self.tipo,
#             'descripcion': self.descripcion,
#             'imagen_url': self.imagen_url,
#             'video_url': self.video_url,
#             'youtube_video_id': self.youtube_video_id
#         }

# @app.route('/')
# def home():
#     return "Bienvenido a la página principal!"


# @app.route('/movimientos', methods=['GET'])
# def get_movimientos():
#     try:
#         movimientos = Movimiento.query.all()
#         return jsonify([mov.to_dict() for mov in movimientos])
#     except Exception as e:
#         app.logger.error(f"Error al obtener movimientos: {str(e)}")
#         traceback.print_exc()  # Esto imprimirá el traceback completo en la consola
#         return jsonify(error=str(e)), 500


# if __name__ == '__main__':
#     app.run(host='0.0.0.0', port=5000, debug=True)
