import 'package:flutter/material.dart';
import 'package:kbox/db.dart';  

class NewMovementPage extends StatefulWidget {
  @override
  _NewMovementPageState createState() => _NewMovementPageState();
}

class _NewMovementPageState extends State<NewMovementPage> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _tipoController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _duracionController = TextEditingController();  // Controlador para duración del ejercicio

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Nuevo Movimiento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nombreController,
              decoration: InputDecoration(labelText: 'Nombre del movimiento'),
            ),
            TextField(
              controller: _tipoController,
              decoration: InputDecoration(labelText: 'Tipo'),
            ),
            TextField(
              controller: _descripcionController,
              decoration: InputDecoration(labelText: 'Descripción'),
            ),
            TextField(
              controller: _duracionController,
              decoration: InputDecoration(labelText: 'Duración (segundos)'),  // Campo para ingresar la duración
              keyboardType: TextInputType.number,  // Asegúrate de que solo se ingresen números
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _insertarMovimiento,
              child: Text('Guardar Movimiento'),
            ),
          ],
        ),
      ),
    );
  }

  void _insertarMovimiento() async {
    final movimiento = Movimiento(
      nombre: _nombreController.text,
      tipo: _tipoController.text,
      descripcion: _descripcionController.text,
      imagenUrl: '',  // Deberías añadir una manera de manejar URLs de imagen
      videoUrl: '',  // Deberías añadir una manera de manejar URLs de video
      youtubeVideoId: '',  // Deberías añadir una manera de manejar IDs de video de YouTube
      duracionEjercicio: int.parse(_duracionController.text)  // Convertir texto a entero
    );

    try {
      await DB.insertMovimiento(movimiento);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Movimiento insertado con éxito'))
      );
      // Limpiar los controladores de texto después de la inserción
      _nombreController.clear();
      _tipoController.clear();
      _descripcionController.clear();
      _duracionController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al insertar movimiento: $e'))
      );
    }
  }
}
