// class Movement {
//   final int id;
//   final String name;
//   final String type;
//   final String description;
//   final String? imageUrl;
//   final String? videoUrl;
//   final String? youtubeVideoId;

//   Movement({
//     required this.id,
//     required this.name,
//     required this.type,
//     required this.description,
//     this.imageUrl,
//     this.videoUrl,
//     this.youtubeVideoId,
//   });

//   factory Movement.fromJson(Map<String, dynamic> json) {
//     return Movement(
//       id: json['id'],
//       name: json['nombre'],
//       type: json['tipo'],
//       description: json['descripcion'],
//       imageUrl: json['imagen_url'],
//       videoUrl: json['video_url'],
//       youtubeVideoId: json['youtube_video_id'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'nombre': name,
//       'tipo': type,
//       'descripcion': description,
//       'imagen_url': imageUrl,
//       'video_url': videoUrl,
//       'youtube_video_id': youtubeVideoId,
//     };
//   }
// }