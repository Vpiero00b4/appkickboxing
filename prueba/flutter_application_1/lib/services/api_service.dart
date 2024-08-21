// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../models/movement.dart';

// class ApiService {
//   final String baseUrl;

//   ApiService({required this.baseUrl});

//   Future<List<Movement>> getMovements() async {
//     var url = Uri.parse('$baseUrl/movements');
//     var response = await http.get(url);

//     if (response.statusCode == 200) {
//       List<dynamic> body = jsonDecode(response.body);
//       List<Movement> movements = body
//           .map(
//             (dynamic item) => Movement.fromJson(item),
//           )
//           .toList();

//       return movements;
//     } else {
//       throw Exception('Failed to load movements from API');
//     }
//   }
// }
