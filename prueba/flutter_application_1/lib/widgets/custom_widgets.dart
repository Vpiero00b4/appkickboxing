//lib/custom_widgets.dart
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../models/training_modal.dart';

// Widget personalizado para el calendario
class TrainingCalendarWidget extends StatefulWidget {
  @override
  _TrainingCalendarWidgetState createState() => _TrainingCalendarWidgetState();
}
class _TrainingCalendarWidgetState extends State<TrainingCalendarWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
              showTrainingDetails(context, selectedDay);  // Usando el método aquí
            });
          },
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
        ),
        // Aquí iría la implementación de tu calendario semanal
      ],
    );
  }
  
  // Método para mostrar detalles del entrenamiento
  void showTrainingDetails(BuildContext context, DateTime selectedDay) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Detalles del Entrenamiento'),
          content: Text('Entrenamiento para: ${selectedDay.toLocal()}'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}

// Widget personalizado para los botones de acceso rápido
class QuickAccessButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _quickAccessButton(
            context,
            title: 'Entrenamiento Personalizado',
            icon: Icons.fitness_center,
            onTap: () {
              showCustomTrainingModal(context);   
            },
          ),
          _quickAccessButton(
            context,
            title: 'Progreso Personal',
            icon: Icons.show_chart,
            onTap: () {
              // Navegar a Progreso Personal
            },
          ),
        ],
      ),
    );
  }

  Widget _quickAccessButton(BuildContext context, {required String title, required IconData icon, VoidCallback? onTap}) {
    return ElevatedButton.icon(
      icon: Icon(icon),
      label: Text(title),
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        ),
      ),
    );
  }
}
// Widget personalizado para la lista de desafíos
class ChallengeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Construye una lista o un GridView para mostrar los desafíos con imágenes y etiquetas como se ve en la imagen.
    return Container(); // Ejemplo: Retornando un contenedor vacío por ahora
  }
}
