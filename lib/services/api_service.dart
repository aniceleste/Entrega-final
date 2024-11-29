import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://<hostname>/api/vehicles'; 

  Future<List<dynamic>> fetchAutos() async {
    final response = await http.get(Uri.parse('$baseUrl/autos'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al obtener datos: ${response.statusCode}');
    }
  }

  Future<void> addAuto(Map<String, dynamic> autoData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/autos'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(autoData),
    );
    if (response.statusCode != 201) {
      throw Exception('Error al agregar auto: ${response.statusCode}');
    }
  }
}
