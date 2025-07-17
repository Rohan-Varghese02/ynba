import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final FlutterSecureStorage storage = FlutterSecureStorage();
  final String baseUrl = 'http://10.0.2.2:5000/api/auth'; // Adjust if needed
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  // Save token
  Future<void> _saveToken(String token) async {
    await _storage.write(key: 'auth_token', value: token);
  }

  // Read token
  Future<String?> getToken() async {
    return await _storage.read(key: 'auth_token');
  }

  // Delete token
  Future<void> logout() async {
    await _storage.delete(key: 'auth_token');
  }

  // Register user
  Future<Map<String, dynamic>> register(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    return jsonDecode(response.body);
  }

  // Login user
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200 && data['token'] != null) {
      await _saveToken(data['token']);
    }
    await storage.write(key: 'token', value: data.toString());
    return data;
  }
}
