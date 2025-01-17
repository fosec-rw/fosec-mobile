// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const Button({Key? key, required this.text, this.onPressed, bool? isEnabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Color(0xFF0F4901),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
          EdgeInsets.symmetric(vertical: 13, horizontal: 50),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            color: Colors.white),
      ),
    );
  }
}
