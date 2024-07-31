import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://10.109.83.8:3000/users';

  Future<bool> login(String username, String password) async {
    final response = await http.get(
      Uri.parse('$baseUrl/users'),
    );

    if (response.statusCode == 200) {
      // Verifique a resposta da API e retorne true ou false
      return true;
    } else {
      return false;
    }
  }

  Future<bool> register(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      body: jsonEncode({'username': username, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      // Verifique a resposta da API e retorne true ou false
      return true;
    } else {
      return false;
    }
  }
}


