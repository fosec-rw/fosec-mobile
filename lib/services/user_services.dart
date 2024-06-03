import 'dart:convert';

import 'package:http/http.dart' as http;

class UserService {
  final String baseUrl = 'https://red-hill-4858.fly.dev/api/v1';

  Future<String> getCurrentUserProfile() async {
    final String url = '$baseUrl/user/me';
    return _getRequest(url);
  }

  Future<String> updateUserProfile(Map<String, dynamic> userData) async {
    final String url = '$baseUrl/user/update';
    return _putRequest(url, userData);
  }

  Future<String> loginUser(Map<String, dynamic> loginData) async {
    final String url = '$baseUrl/user/login';
    return _postRequest(url, loginData);
  }

  Future<String> _getRequest(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  Future<String> _postRequest(String url, Map<String, dynamic> data) async {
    try {
      final response = await http.post(Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(data));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        throw Exception('Failed to post data');
      }
    } catch (e) {
      throw Exception('Failed to post data: $e');
    }
  }

  Future<String> _putRequest(String url, Map<String, dynamic> data) async {
    try {
      final response = await http.put(Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(data));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to update data');
      }
    } catch (e) {
      throw Exception('Failed to update data: $e');
    }
  }

  Future<String> registerUser(Map<String, dynamic> registerData) async {
    final url = '$baseUrl/user/register';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(registerData),
      );

      switch (response.statusCode) {
        case 200:
        case 201:
          return response.body; // Successful registration
        case 400:
          throw Exception('Bad request: ${response.body}');
        case 409:
          throw Exception('Conflict: User already exists'); // Example
        default:
          throw Exception('Failed to register: ${response.body}');
      }
    } catch (e) {
      // More specific error handling based on exception type
      if (e is http.ClientException) {
        throw Exception('Network error: ${e.message}');
      } else {
        throw Exception('Failed to register: $e');
      }
    }
  }
}
