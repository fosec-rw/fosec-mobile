import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> updateUser(String firstName, String lastName, String phone) async {
  const String url =
      "https://red-hill-4858.fly.dev/api/v1/user/update"; // Update this to match the correct API URL

  // Prepare the data to send in the PUT request
  Map<String, String> body = {
    "firstName": firstName,
    "lastName": lastName,
    "phone": phone,
  };

  try {
    final response = await http.put(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      // Successfully updated the user profile
      final updatedUser = jsonDecode(response.body);
      print("User updated successfully: $updatedUser");
    } else {
      // Handle error
      print("Failed to update user: ${response.statusCode}");
      print("Error: ${response.body}");
    }
  } catch (e) {
    // Handle exception
    print("Error occurred: $e");
  }
}
