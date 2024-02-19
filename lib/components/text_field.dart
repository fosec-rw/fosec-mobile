// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class FormTextField extends StatefulWidget {
  final bool obscureText;
  final TextEditingController controller;
  final String hintText; // Changed the type to TextEditingController
  final String label;
  FormTextField({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.hintText,
    required this.label,
  }) : super(key: key);

  @override
  _FormTextFieldState createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      child: TextField(
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
              fontSize: 15,
            ),
            label: Text(widget.label),
            labelStyle: TextStyle(
              color: Colors.black,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w300,
              fontSize: 16,
            )),
      ),
    );
  }
}
