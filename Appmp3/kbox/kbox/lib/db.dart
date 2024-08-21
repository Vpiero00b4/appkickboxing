import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Movimiento {
  int? id;
  String nombre;
  String tipo;
  String descripcion;
  String imagenUrl;
  String videoUrl;
  String youtubeVideoId;
  int duracionEjercicio;

  Movimiento({
    this.id,
    required this.nombre,
    required this.tipo,
    required this.descripcion,
    required this.imagenUrl,
    required this.videoUrl,
    required this.youtubeVideoId,
    required this.duracionEjercicio,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'tipo': tipo,
      'descripcion': descripcion,
      'imagen_url': imagenUrl,
      'video_url': videoUrl,
      'youtube_video_id': youtubeVideoId,
      'duracion_ejercicio': duracionEjercicio,
    };
  }

  static Movimiento fromMap(Map<String, dynamic> map) {
    return Movimiento(
      id: map['id'],
      nombre: map['nombre'],
      tipo: map['tipo'],
      descripcion: map['descripcion'],
      imagenUrl: map['imagen_url'],
      videoUrl: map['video_url'],
      youtubeVideoId: map['youtube_video_id'],
      duracionEjercicio: map['duracion_ejercicio'],
    );
  }
}

class DB {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initializeDB();
    return _database!;
  }

  static Future<Database> initializeDB() async {
    return openDatabase(
      join(await getDatabasesPath(), 'movimientos.db'),
      version: 2, // Incrementado a la versión 2
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE Movimientos(
            id INTEGER PRIMARY KEY,
            nombre TEXT,
            tipo TEXT,
            descripcion TEXT,
            imagen_url TEXT,
            video_url TEXT,
            youtube_video_id TEXT,
            duracion_ejercicio INTEGER
          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          // Realiza las actualizaciones necesarias para la versión 2
        }
      },
    );
  }

  static Future<void> insertMovimiento(Movimiento movimiento) async {
    final db = await database;
    await db.insert(
      'Movimientos',
      movimiento.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace, // o ConflictAlgorithm.rollback según tus necesidades
    );
  }

  static Future<List<Movimiento>> getMovimientos() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Movimientos');

    return List.generate(maps.length, (i) {
      return Movimiento.fromMap(maps[i]);
    });
  }
}
