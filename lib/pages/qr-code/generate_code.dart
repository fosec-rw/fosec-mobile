// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fosec/components/button.dart';
import 'package:fosec/components/label.dart';
import 'package:fosec/components/text_field.dart';
import 'package:fosec/pages/Chats/chat_screen.dart';
import 'display_code.dart';

class GenerateCode extends StatefulWidget {
  const GenerateCode({super.key});

  @override
  _GenerateCodeState createState() => _GenerateCodeState();
}

class _GenerateCodeState extends State<GenerateCode> {
  final goodsTypeController = TextEditingController();
  final quantityController = TextEditingController();
  final sourceController = TextEditingController();
  final destinationController = TextEditingController();
  final plateNumberController = TextEditingController();

  String? qrData; // Variable to hold the QR data
  bool isButtonEnabled = false; // Button state
  String? errorMessage; // Error message to display

  @override
  void initState() {
    super.initState();
    // Add listeners to validate the form on any text input
    goodsTypeController.addListener(_validateForm);
    quantityController.addListener(_validateForm);
    sourceController.addListener(_validateForm);
    destinationController.addListener(_validateForm);
    plateNumberController.addListener(_validateForm);
  }

  @override
  void dispose() {
    goodsTypeController.dispose();
    quantityController.dispose();
    sourceController.dispose();
    destinationController.dispose();
    plateNumberController.dispose();
    super.dispose();
  }

  // Function to validate the form and enable/disable the button
  void _validateForm() {
    setState(() {
      isButtonEnabled = _isFormValid();
      errorMessage = _getErrorMessage();
    });
  }

  // Function to check if the form is valid
  bool _isFormValid() {
    return _getErrorMessage() ==
        null; // If there's no error message, the form is valid
  }

  // Function to get error messages if any field is empty or plate number is invalid
  String? _getErrorMessage() {
    if (goodsTypeController.text.isEmpty ||
        quantityController.text.isEmpty ||
        sourceController.text.isEmpty ||
        destinationController.text.isEmpty ||
        plateNumberController.text.isEmpty) {
      return "Please fill in all the fields.";
    }

    // Validate the plate number format
    String platePattern =
        r'^[A-Z]{3} [0-9]{3}[A-Z]$'; // Rwanda plate format: ABC 123A
    RegExp regExp = RegExp(platePattern);
    if (!regExp.hasMatch(plateNumberController.text)) {
      return "Please enter a valid plate number (e.g., ABC 123A).";
    }

    return null; // No errors
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Color(0xFF1A8500),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_rounded),
        ),
        title: Text("QR Code Generator"),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Generate a unique QR code to secure your goods!",
                style: TextStyle(
                  fontFamily: 'Outfit',
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              FieldLabel(label: "Type of Goods"),
              FormTextField(
                controller: goodsTypeController,
                obscureText: false,
              ),
              SizedBox(height: 10),
              FieldLabel(label: "Quantity"),
              FormTextField(
                controller: quantityController,
                obscureText: false,
              ),
              SizedBox(height: 10),
              FieldLabel(label: "From:"),
              FormTextField(
                controller: sourceController,
                obscureText: false,
              ),
              SizedBox(height: 10),
              FieldLabel(label: "To:"),
              FormTextField(
                controller: destinationController,
                obscureText: false,
              ),
              FieldLabel(label: "Truck Plate Number:"),
              FormTextField(
                controller: plateNumberController,
                obscureText: false,
              ),
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Button(
                      onPressed: isButtonEnabled
                          ? () {
                              // Generate the QR data from the input fields
                              setState(() {
                                qrData =
                                    'Goods: ${goodsTypeController.text}, Quantity: ${quantityController.text}, From: ${sourceController.text}, To: ${destinationController.text}, Plate: ${plateNumberController.text}';
                              });
                              // Navigate to the DisplayQRCodePage
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DisplayQRCodePage(data: qrData!),
                                ),
                              );
                            }
                          : null, // Disable button if form is not valid
                      text: "Generate QR Code",
                      isEnabled:
                          isButtonEnabled, // Custom button handles its enabled state
                    ),
                    if (errorMessage !=
                        null) // Display error message if there is any
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          errorMessage!,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
