import 'package:flutter/material.dart';

class FormTextField extends StatefulWidget {
  final bool obscureText;
  final TextEditingController controller; // Changed the type to TextEditingController
  FormTextField({Key? key, required this.controller, required this.obscureText}) : super(key: key);

  @override
  _FormTextFieldState createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: widget.controller, // Use widget.controller to access the controller
        obscureText: widget.obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: const Color.fromARGB(255, 226, 246, 220),
            filled: true,
            hintText: "Password",
            hintStyle: TextStyle(color: Colors.grey[500])),
      ),
    );
  }
}
