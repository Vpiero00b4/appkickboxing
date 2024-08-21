//lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'utils/theme_provider.dart';
import 'widgets/custom_widgets.dart';
import 'models/settings_page.dart';
import 'package:kbox/views/training/new_training_page.dart';
import 'package:kbox/views/training/beginner_kickboxing_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(ThemeData.light()),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Kickboxing Trainer',
            theme: themeProvider.getTheme(),
            home: MyHomePage(title: 'Kickboxing Trainer Home Page'),
          );
        },
      ),
    );
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: buildDrawer(context), // Pasar el contexto a buildDrawer
      body: ListView(
        children: <Widget>[
          _buildCard(
            title: 'Kickboxing Principiante',
            subtitle: 'Aprende todo lo básico del kickboxing',
            icon: Icons.star_border,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BeginnerKickboxingPage()),
              );
            },
          ),
          _buildCard(
            title: 'Kickboxing Principiante',
            subtitle: 'Aprende todo lo básico del kickboxing',
            icon: Icons.star_border,
          ),
          _buildCard(
            title: 'Kickboxing Intermedio',
            subtitle: 'Reforzando lo aprendido y estrategia',
            icon: Icons.star_half,
          ),
          _buildCard(
            title: 'Kickboxing Avanzado (PREMIUM)',
            subtitle: 'Adquiere tu plan avanzado desde 1 dolar',
            icon: Icons.star,
            onTap: () {
              // Acciones cuando el usuario toque "Adquirir plan avanzado"
            },
          ),
          TrainingCalendarWidget(),
          QuickAccessButtons(),
          ChallengeList(),
        ],
      ),
    );
  }

  Card _buildCard({
    required String title,
    required String subtitle,
    required IconData icon,
    void Function()? onTap,
  }) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(icon),
        onTap: onTap ?? () {}
      ),
    );
  }
}

  Drawer buildDrawer(BuildContext context) { // Añadir contexto como parámetro
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: AssetImage('assets/Jap.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: const Text(
              'Kickboxing Trainer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            title: const Text('Recordatorio (HorariosEntrenamiento)'),
            onTap: () {
              // Actualizar la navegación a la pantalla correspondiente
            },
          ),
          ListTile(
            title: const Text('Progreso Personal (Usuarios)'),
            onTap: () {
              // Actualizar la navegación a la pantalla correspondiente
            },
          ),
          ListTile(
            title: const Text('ASISTENTE CON IA (PREMIUM)'),
            onTap: () {
              // Actualizar la navegación a la pantalla correspondiente
            },
          ),
          ListTile(
            title: const Text('Historiaa'),
            onTap: () {
              // Actualizar la navegación a la pantalla correspondiente
            },
          ),
          ListTile(
            title: const Text('Registrar Nuevo Movimiento'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewMovementPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Ajustes'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
            
          ),
        ],
      ),
    );
  }

  Card _buildCard({required String title, required String subtitle, required IconData icon, VoidCallback? onTap}) {
    return Card(
      elevation: 2.0, // Sombra sutil para cada tarjeta
      child: ListTile(
        leading: Icon(icon, color: Colors.blue), // Icono representativo para cada sección
        title: Text(title),
        subtitle: Text(subtitle),
onTap: onTap ?? () {}
      ),
    );
  }
