// class Movimiento {
//   int? id;
//   String nombre;
//   String tipo;
//   String descripcion;
//   String imagenUrl;
//   String videoUrl;
//   String youtubeVideoId;
//   int duracionEjercicio;

//   Movimiento({
//     this.id,
//     required this.nombre,
//     required this.tipo,
//     required this.descripcion,
//     required this.imagenUrl,
//     required this.videoUrl,
//     required this.youtubeVideoId,
//     required this.duracionEjercicio,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'nombre': nombre,
//       'tipo': tipo,
//       'descripcion': descripcion,
//       'imagen_url': imagenUrl,
//       'video_url': videoUrl,
//       'youtube_video_id': youtubeVideoId,
//       'duracion_ejercicio': duracionEjercicio,
//     };
//   }

//   static Movimiento fromMap(Map<String, dynamic> map) {
//     return Movimiento(
//       id: map['id'],
//       nombre: map['nombre'],
//       tipo: map['tipo'],
//       descripcion: map['descripcion'],
//       imagenUrl: map['imagen_url'],
//       videoUrl: map['video_url'],
//       youtubeVideoId: map['youtube_video_id'],
//       duracionEjercicio: map['duracion_ejercicio'],
//     );
//   }
// }
