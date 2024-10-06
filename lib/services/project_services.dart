import 'package:http/http.dart' as http;
import 'dart:convert';

class ProjectService {
  final String baseUrl = 'https://red-hill-4858.fly.dev/api/v1';

  Future<String> createProject(Map<String, dynamic> projectData) async {
    final String url = '$baseUrl/project/create';
    return _postRequest(url, projectData);
  }

  Future<String> _postRequest(String url, Map<String, dynamic> data) async {
    try {
      final response = await http.post(Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(data));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        print('Error Response: ${response.body}');
        throw Exception(
            'Failed to post data. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
      throw Exception('Failed to post data: $e');
    }
  }
}
