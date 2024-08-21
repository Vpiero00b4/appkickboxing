import 'package:flutter/material.dart';
import 'package:flutter_youtube_downloader/flutter_youtube_downloader.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _linkController = TextEditingController();
  String _message = 'Introduce el enlace de YouTube y presiona descargar.';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Descargador de Audio de YouTube'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _linkController,
                decoration: InputDecoration(
                  hintText: 'Pega el enlace de YouTube aquí',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _downloadAudio,
                child: Text('Descargar Audio'),
              ),
              SizedBox(height: 20),
              Text(_message),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _downloadAudio() async {
    final link = _linkController.text;
    if (link.isNotEmpty) {
      try {
        final result = await FlutterYoutubeDownloader.downloadVideo(link, 'downloaded_audio', 18);
        setState(() {
          _message = 'Audio descargado exitosamente! Resultado: $result';
        });
      } catch (e) {
        setState(() {
          _message = 'Error al descargar audio: $e';
        });
      }
    } else {
      setState(() {
        _message = 'Por favor, ingresa un enlace de YouTube.';
      });
    }
  }
}
