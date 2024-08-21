import 'package:flutter/material.dart';
import 'package:flutter_application_1/db.dart';
import 'package:flutter_application_1/movimientos.dart';

class NewMovementPage extends StatefulWidget {
  @override
  _NewMovementPageState createState() => _NewMovementPageState();
}

class _NewMovementPageState extends State<NewMovementPage> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _tipoController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();

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
      imagenUrl: '',
      videoUrl: '',
      youtubeVideoId: '',
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
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al insertar movimiento: $e'))
      );
    }
  } 
}
