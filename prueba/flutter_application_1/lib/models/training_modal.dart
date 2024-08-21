import 'package:flutter/material.dart';
// import '../views/training/new_training_page.dart';

// Función para mostrar el modal de entrenamiento personalizado
void showCustomTrainingModal(BuildContext context) {
  TextEditingController _trainingNameController = TextEditingController();
  TextEditingController _trainingDescriptionController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Agregar Entrenamiento Personalizado'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              // Campos de texto para ingresar la información del entrenamiento
              TextFormField(
                controller: _trainingNameController,
                decoration: InputDecoration(hintText: 'Nombre del entrenamiento'),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _trainingDescriptionController,
                decoration: InputDecoration(hintText: 'Descripción'),
              ),
              SizedBox(height: 8.0),
              // Puedes añadir más campos si es necesario
            ],
          ),
        ),
        actions: <Widget>[
          // Botón "Cancelar"
          TextButton(
            child: Text('Cancelar'),
            onPressed: () {
              Navigator.of(context).pop(); // Cierra el modal
            },
          ),
          // Botón "Guardar"
          // ElevatedButton(
          //   child: Text('Guardar'),
          //   onPressed: () {
          //     // Utiliza los controladores para obtener los datos del formulario
          //     String trainingName = _trainingNameController.text;
          //     String trainingDescription = _trainingDescriptionController.text;

          //     // Navega a la nueva página pasando los datos
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => NewTrainingPage(
          //           trainingName: trainingName,
          //           trainingDescription: trainingDescription,
          //         ),
          //       ),
          //     );
          //   },
          
        ],
      );
    },
  );
}

// Función que muestra el modal con el video de entrenamiento
