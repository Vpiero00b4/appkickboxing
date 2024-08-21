//beginner_kickboxing_page
import 'package:flutter/material.dart';
import 'package:kbox/views/training/movements_page.dart';


class BeginnerKickboxingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kickboxing Principiante'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'aumentar') {
                // Acción al seleccionar "Aumentar"
              } else if (value == 'reiniciar') {
                // Acción al seleccionar "Reiniciar"
              }
            },
            itemBuilder: (BuildContext context) {
              return {'aumentar', 'reiniciar'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice.capitalize()),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 4, // Número de semanas
              itemBuilder: (context, index) {
                return WeekTraining(week: index + 1);
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MovementsPage()),
                  );
                },
                child: Text('Vamos!'),
              ),
           ),
          ),
        ],
      ),
    );
  }
}

class WeekTraining extends StatelessWidget {
  final int week;

  WeekTraining({required this.week});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('SEMANA $week', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          childAspectRatio: 1.5,
          children: List.generate(7, (index) => DayButton(day: index + 1, week: week)),
        ),
      ],
    );
  }
}

class DayButton extends StatelessWidget {
  final int day;
  final int week;

  DayButton({required this.day, required this.week});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          // Acción al tocar el día específico
        },
        child: Center(child: Text('$day')),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
