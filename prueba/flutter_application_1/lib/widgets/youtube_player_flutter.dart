import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouTube Video',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VideoScreen(),
    );
  }
}
class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}
class _VideoScreenState extends State<VideoScreen> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: '7PGEGcTHHmg', // El ID del video de YouTube
      flags: YoutubePlayerFlags(
        autoPlay: false, // Cambiar a true si quieres que el video se reproduzca automáticamente
        mute: false,
        loop: false, // Si quieres que el video se repita
        // No es posible controlar los anuncios a través de la API. Los anuncios pueden aparecer basados en las políticas de YouTube.
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YouTube Video'),
      ),
      body: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        onReady: () {
          print('Player is ready.');
        },
      ),
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
