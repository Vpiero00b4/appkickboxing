//settings_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Tema'),
            leading: Icon(Icons.color_lens),
            onTap: () {
              // Alternar entre temas claro y oscuro
              if (themeProvider.getTheme() == ThemeData.dark()) {
                themeProvider.setTheme(ThemeData.light());
              } else {
                themeProvider.setTheme(ThemeData.dark());
              }
            },
          ),
          SwitchListTile(
            title: Text('Conéctese a Google Fit'),
            secondary: Icon(Icons.connect_without_contact),
            value: false, // Esto debería estar vinculado con el estado de la configuración
            onChanged: (bool value) {
              // Actualizar la configuración de Google Fit
            },
          ),
          SwitchListTile(
            title: Text('Música'),
            secondary: Icon(Icons.music_note),
            value: true, // Esto debería estar vinculado con el estado de la configuración
            onChanged: (bool value) {
              // Actualizar la configuración de la música
            },
          ),
          ListTile(
            title: Text('Volumen de la música'),
            leading: Icon(Icons.volume_up),
            onTap: () {
              // Código para ajustar el volumen de la música
            },
          ),
          ListTile(
            title: Text('Canción de la música'),
            leading: Icon(Icons.library_music),
            onTap: () {
              // Código para seleccionar la canción de la música
            },
          ),
          SwitchListTile(
            title: Text('Alarma de timbre'),
            secondary: Icon(Icons.alarm),
            value: false, // Esto debería estar vinculado con el estado de la configuración
            onChanged: (bool value) {
              // Actualizar la configuración de la alarma de timbre
            },
          ),
          ListTile(
            title: Text('Tiempo de descanso'),
            leading: Icon(Icons.timer),
            onTap: () {
              // Código para ajustar el tiempo de descanso
            },
          ),
          SwitchListTile(
            title: Text('Siguiente automático'),
            secondary: Icon(Icons.arrow_forward),
            value: true, // Esto debería estar vinculado con el estado de la configuración
            onChanged: (bool value) {
              // Actualizar la configuración del siguiente automático
            },
          ),
          ListTile(
            title: Text('Voice Guide'),
            leading: Icon(Icons.record_voice_over),
            onTap: () {
              // Código para activar o desactivar la guía de voz
            },
          ),
          ListTile(
            title: Text('Volumen de voz'),
            leading: Icon(Icons.volume_up),
            onTap: () {
              // Código para ajustar el volumen de la voz
            },
          ),
          ListTile(
            title: Text('Idioma de voz'),
            leading: Icon(Icons.language),
            onTap: () {
              // Código para seleccionar el idioma de la voz
            },
          ),
          ListTile(
            title: Text('Motor de TTS'),
            leading: Icon(Icons.speaker),
            onTap: () {
              // Código para seleccionar el motor de TTS
            },
          ),
          ListTile(
            title: Text('Quitar anuncios'),
            leading: Icon(Icons.remove_circle_outline),
            onTap: () {
              // Código para quitar los anuncios
            },
          ),
        ],
      ),
    );
  }
}
