import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fosec/components/button.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class DisplayQRCodePage extends StatelessWidget {
  final String data;

  const DisplayQRCodePage({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A8500),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: const Text("QR Code Display", style: TextStyle(fontFamily: 'Poppins'),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            QrImageView(
              data: data,
              version: QrVersions.auto,
              size: 300.0,
            ),
            const SizedBox(height: 20),
            Button(
              onPressed: () {
                // Print the QR code
                Printing.layoutPdf(
                  onLayout: (PdfPageFormat format) async {
                    final doc = pw.Document();
                    final qrImage = await QrPainter(
                      data: data,
                      version: QrVersions.auto,
                      gapless: true,
                    ).toImageData(200);
                    final image =
                        pw.MemoryImage(Uint8List.view(qrImage!.buffer));

                    doc.addPage(
                      pw.Page(
                        build: (pw.Context context) => pw.Center(
                          child: pw.Image(image),
                        ),
                      ),
                    );
                    return doc.save();
                  },
                );
              },
              text: "Print QR Code",
            ),
          ],
        ),
      ),
    );
  }
}
