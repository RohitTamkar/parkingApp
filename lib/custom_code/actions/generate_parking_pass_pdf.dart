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
  String formattedStartDate = DateFormat('dd-MM-yyyy').format(startDate);
  String formattedEndDate = DateFormat('dd-MM-yyyy').format(endDate);

  // QR Code data (based on Customer ID)
  final qrData = '${passDetails.reference.id}';

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
        return pw.Center(
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Text(
                'PARKING PASS',
                style:
                    pw.TextStyle(fontSize: 28, fontWeight: pw.FontWeight.bold),
                textAlign: pw.TextAlign.center,
              ),
              pw.SizedBox(height: 15),
              pw.Text(
                'Date: $formattedStartDate',
                style: pw.TextStyle(fontSize: 12),
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                'Name: ${customerDetails.name}',
                style: pw.TextStyle(fontSize: 14),
              ),
              pw.SizedBox(height: 8),
              pw.Text(
                'Mobile: ${customerDetails.mobile}',
                style: pw.TextStyle(fontSize: 14),
              ),
              pw.SizedBox(height: 8),
              pw.Text(
                'Vehicle Type: ${customerDetails.vehicleType}',
                style: pw.TextStyle(fontSize: 14),
              ),
              pw.SizedBox(height: 8),
              pw.Text(
                'Vehicle No: ${customerDetails.vehicleNo}',
                style:
                    pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                'Pass Details',
                style:
                    pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 8),
              pw.Text(
                'From: $formattedStartDate',
                style: pw.TextStyle(fontSize: 12),
              ),
              pw.SizedBox(height: 5),
              pw.Text(
                'To: $formattedEndDate',
                style: pw.TextStyle(fontSize: 12),
              ),
              pw.SizedBox(height: 8),
              pw.Text(
                'Pass Plan: ${passDetails.planName}',
                style: pw.TextStyle(fontSize: 14),
              ),
              pw.SizedBox(height: 8),
              pw.Text(
                'No of Days: $numberOfDays',
                style: pw.TextStyle(fontSize: 14),
              ),
              pw.SizedBox(height: 8),
              pw.Text(
                'Net Amount: ${passDetails.amount}',
                style:
                    pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 8),
              pw.Text(
                'Payment Mode: ${passDetails.paymentType}',
                style: pw.TextStyle(fontSize: 14),
              ),
              pw.SizedBox(height: 15),
              pw.Image(pw.MemoryImage(qrCodeBytes), width: 100, height: 100),
              pw.SizedBox(height: 15),
              pw.Text(
                'Thank you! Drive safely!',
                style:
                    pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
              ),
            ],
          ),
        );
      },
    ),
  );

  // Save the PDF and convert it to a data URI
  final bytes = await pdf.save();
  final base64String = base64Encode(bytes);
  final pdfDataUri = 'data:application/pdf;base64,$base64String';

  return pdfDataUri;
}
