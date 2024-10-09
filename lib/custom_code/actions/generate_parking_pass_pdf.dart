// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:qr_flutter/qr_flutter.dart';

import 'dart:convert';

import 'package:pdf/pdf.dart';
import 'dart:typed_data';
import 'package:pdf/widgets.dart' as pw;
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:ui' as ui;

Future<String> generateParkingPassPdf(
  PartyRecord? customerDetails, // Contains customer details like name, mobile
  MonthlyPassRecord?
      passDetails, // Contains pass details like pass start date, end date, etc.
) async {
  if (customerDetails == null || passDetails == null) {
    return 'Missing details'; // Error handling
  }

  // Initialize PDF document
  final pdf = pw.Document();

  // Format start and end dates
  final DateTime startDate =
      DateTime.fromMillisecondsSinceEpoch(passDetails.passStartDate as int);
  final DateTime endDate =
      DateTime.fromMillisecondsSinceEpoch(passDetails.passEndDate as int);
  String formattedStartDate =
      DateFormat('dd-MM-yyyy HH:mm:ss').format(startDate);
  String formattedEndDate = DateFormat('dd-MM-yyyy HH:mm:ss').format(endDate);

  // QR Code data (based on Customer ID)
  final qrData = 'CustomerID:${customerDetails.reference.id}';

  // Generate QR code using QrPainter
  final qrPainter = QrPainter(
    data: qrData,
    version: QrVersions.auto,
    gapless: false,
  );

  // Convert QR code to image
  final ui.Image qrImage = await qrPainter.toImage(200);
  final ByteData? byteData =
      await qrImage.toByteData(format: ui.ImageByteFormat.png);
  final Uint8List qrCodeBytes = byteData!.buffer.asUint8List();

  // Calculate the number of days
  int numberOfDays = endDate.difference(startDate).inDays + 1;

  // Add content to the PDF
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('PARKING PASS',
                style:
                    pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 10),
            pw.Text('Date: $formattedStartDate'),
            pw.SizedBox(height: 10),
            pw.Text('Name: ${customerDetails.name}'),
            pw.Text('Mobile No: ${customerDetails.mobile}'),
            pw.SizedBox(height: 10),
            pw.Text('Vehicle Type: ${customerDetails.vehicleType}'),
            pw.Text('Vehicle No: ${customerDetails.vehicleNo}',
                style:
                    pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 10),
            pw.Text('From: $formattedStartDate'),
            pw.Text('To: $formattedEndDate'),
            pw.SizedBox(height: 10),
            pw.Text('Pass Plan: ${passDetails.planName}'),
            pw.Text('No Of Days: $numberOfDays'),
            pw.SizedBox(height: 10),
            pw.Text('Net: ${passDetails.amount}',
                style:
                    pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 10),
            pw.Text('Payment Mode: ${passDetails.paymentType}'),
            pw.SizedBox(height: 10),
            pw.Text('Thank you! Drive safely!',
                style:
                    pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 20),
            pw.Image(pw.MemoryImage(qrCodeBytes)), // Insert QR code
          ],
        );
      },
    ),
  );

  // Save the PDF and convert it to a data URI
  final bytes = await pdf.save();
  final base64String = base64Encode(bytes);
  final pdfDataUri = 'data:application/pdf;base64,$base64String';

  // // Save PDF to a file
  // final directory = await getApplicationDocumentsDirectory();
  // final String filePath =
  //     '${directory.path}/Parking_Pass_${customerDetails.reference.id}.pdf';
  // final File file = File(filePath);
  // await file.writeAsBytes(await bytes);

  return pdfDataUri;
}
