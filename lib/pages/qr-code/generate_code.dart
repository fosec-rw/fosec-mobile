// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fosec/components/button.dart';
import 'package:fosec/components/label.dart';
import 'package:fosec/components/text_field.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: Button(
                  onPressed: () {
                    // Generate the QR data from the input fields
                    setState(() {
                      qrData =
                          'Goods: ${goodsTypeController.text}, Quantity: ${quantityController.text}, From: ${sourceController.text}, To: ${destinationController.text}, Plate: ${plateNumberController.text}';
                    });
                    // Navigate to the DisplayQRCodePage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DisplayQRCodePage(data: qrData!),
                      ),
                    );
                  },
                  text: "Generate QR Code",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
