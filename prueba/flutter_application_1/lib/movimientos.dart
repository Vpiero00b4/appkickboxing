class Movimiento {
  final int? id;
  final String nombre;
  final String tipo;
  final String descripcion;
  final String imagenUrl;
  final String videoUrl;
  final String youtubeVideoId;
  final int duracionEjercicio;

  Movimiento({
    this.id,
    required this.nombre,
    required this.tipo,
    required this.descripcion,
    this.imagenUrl = "",
    this.videoUrl = "",
    this.youtubeVideoId = "",
    this.duracionEjercicio = 0,
  });

  factory Movimiento.fromMap(Map<String, dynamic> map) {
    return Movimiento(
      id: map['movimiento_id'],
      nombre: map['nombre'],
      tipo: map['tipo'],
      descripcion: map['descripcion'],
      imagenUrl: map['imagen_url'] ?? "",
      videoUrl: map['video_url'] ?? "",
      youtubeVideoId: map['youtube_video_id'] ?? "",
      duracionEjercicio: map['duracion_ejercicio'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'movimiento_id': id,
      'nombre': nombre,
      'tipo': tipo,
      'descripcion': descripcion,
      'imagen_url': imagenUrl,
      'video_url': videoUrl,
      'youtube_video_id': youtubeVideoId,
      'duracion_ejercicio': duracionEjercicio,
    };
  }
}
