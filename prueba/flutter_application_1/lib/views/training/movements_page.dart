import 'package:flutter/material.dart';
import 'package:flutter_application_1/db.dart';
import 'package:flutter_application_1/movimientos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MovementsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Desafío de Kickboxing'),
      ),
      body: FutureBuilder<List<Movimiento>>(
        future: DB.getMovimientos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return Center(child: Text('No hay movimientos disponibles'));
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Movimiento movimiento = snapshot.data![index];
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    leading: Image.network(movimiento.imagenUrl, width: 100, fit: BoxFit.cover),
                    title: Text(movimiento.nombre),
                    subtitle: Text('${movimiento.duracionEjercicio} segundos'),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No hay movimientos disponibles'));
          }
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FloatingActionButton.extended(
          onPressed: () {
            // Ejemplo de cómo puedes insertar un movimiento desde un botón
            _insertMovimiento();
          },
          label: Text('Agregar Nuevo Movimiento'),
          icon: Icon(Icons.add),
        ),
      ),
    );
  }

  void _insertMovimiento() async {
    await DB.insertMovimiento(
      Movimiento(
        nombre: "Nuevo Movimiento",
        tipo: "Tipo",
        descripcion: "Descripción del nuevo movimiento",
        imagenUrl: "url_de_la_imagen",
        videoUrl: "url_del_video",
        youtubeVideoId: "id_del_video",
        duracionEjercicio: 30
      )
    );
    // Opcionalmente puedes mostrar un mensaje o actualizar la interfaz de usuario
    // después de la inserción.
  }
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

void getMovimientos() async {
  QuerySnapshot snapshot = await _firestore.collection('movimientos').get();
  for (var doc in snapshot.docs) {
    print(doc.data());
  }
}

