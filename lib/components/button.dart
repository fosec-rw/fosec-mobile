import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Implement your login logic here
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Color(
              0xFF0F4901), // Replace 0xFF0F4901 with your desired hex color code
        ),
      ),
      child: Text('Login'),
    );
  }
}
