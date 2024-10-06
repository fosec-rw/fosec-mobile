// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fosec/pages/qr-code/scan_result.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:async'; // Import for Timer

class ScanCode extends StatefulWidget {
  const ScanCode({super.key});

  @override
  _ScanCodeState createState() => _ScanCodeState();
}

class _ScanCodeState extends State<ScanCode> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isScanning = false;
  Timer? scanTimer; // Timer variable

  @override
  void dispose() {
    controller?.dispose();
    scanTimer?.cancel(); // Cancel the timer when disposing
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (scanData.code != null) {
        controller.pauseCamera();
        scanTimer?.cancel(); // Cancel the timer if QR code is detected
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScanResultPage(data: scanData.code!),
          ),
        );
      }
    });
  }

  void _startScanning() {
    setState(() {
      isScanning = true;
    });
    controller?.resumeCamera();
    scanTimer = Timer(
        Duration(seconds: 10), _handleScanTimeout); // Set timer for 10 seconds
  }

  void _handleScanTimeout() {
    // Navigate to a page indicating QR code tampering
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TamperedPage(),
      ),
    );
  }

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
        title: Text("Scanning"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Scan your QR Code",
              style: TextStyle(
                fontFamily: 'Outfit',
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20),
            if (isScanning)
              SizedBox(
                height: 200,
                width: 250,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
              )
            else
              Container(
                height: 200,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.greenAccent[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    "Press the button to start scanning",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: _startScanning,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: const [
                      Color(0xFF0F4901),
                      Color(0xFF22890A),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Start Scanning",
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TamperedPage extends StatelessWidget {
  const TamperedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code Tampered"),
        backgroundColor: Color(0xFF1A8500),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/tampered.png'),
            SizedBox(
              height: 25,
            ),
            Text(
              "The QR code could not be detected or has been tampered with.",
              style: TextStyle(
                fontFamily: 'Outfit',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
