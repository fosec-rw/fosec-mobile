// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DisplayQRCodePage extends StatelessWidget {
  final String data;

  const DisplayQRCodePage({required this.data, super.key});

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
        title: Text("QR Code Display"),
      ),
      body: Center(
        child: QrImageView(
          data: data,
          version: QrVersions.auto,
          size: 300.0,
        ),
      ),
    );
  }
}
