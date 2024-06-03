// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class FormTextField extends StatefulWidget {
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String? hintText;

  FormTextField({
    Key? key,
    required this.controller,
    required this.obscureText,
    this.hintText,
    this.validator,
  }) : super(key: key);

  @override
  _FormTextFieldState createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
      child: TextFormField(
        cursorColor: Color(0xFF1A8500),
        obscureText: widget.obscureText,
        controller: widget.controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade700),
          ),
          fillColor: const Color.fromRGBO(255, 255, 255, 1),
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Colors.grey[400],
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w100,
            fontSize: 10,
          ),
        ),
        validator: widget.validator,
      ),
    );
  }
}
