import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'movimientos.dart';

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
        version: 3, // Asegúrate de que esta versión es superior a la última usada
        onCreate: (db, version) async {
            await db.execute('''
                CREATE TABLE Movimientos(
                    movimiento_id INTEGER PRIMARY KEY AUTOINCREMENT,
                    nombre TEXT NOT NULL,
                    tipo TEXT NOT NULL,
                    descripcion TEXT,
                    imagen_url TEXT,
                    video_url TEXT,
                    youtube_video_id TEXT,
                    duracion_ejercicio INT
                )
            ''');
        },
        onUpgrade: (db, oldVersion, newVersion) async {
            if (oldVersion < 3) {
                await db.execute('ALTER TABLE Movimientos ADD COLUMN duracion_ejercicio INT');
            }
        },
    );
}


static Future<void> insertMovimiento(Movimiento movimiento) async {
    final db = await database;
    try {
        await db.insert(
            'Movimientos',
            movimiento.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace
        );
    } catch (e) {
        print('Error al insertar en la base de datos: $e');
        throw Exception('Error al insertar movimiento: $e');
    }
}


  static Future<List<Movimiento>> getMovimientos() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Movimientos');
    return List.generate(maps.length, (i) => Movimiento.fromMap(maps[i]));
  }

  // Métodos adicionales para actualizar y eliminar movimientos pueden ser añadidos aquí
}
