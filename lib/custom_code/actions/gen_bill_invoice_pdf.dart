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

import 'dart:io';
import 'dart:convert';
import 'index.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'dart:typed_data';
import 'package:pdf/pdf.dart' as pw;
import 'package:pdf/widgets.dart' as pw;
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

Future genBillInvoicePdf(
  InvoiceRecord bill,
  OutletRecord outletDoc,
) async {
  // Add your function code here!

  final pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text("[Restaurant Name]", style: pw.TextStyle(fontSize: 24)),
            pw.Text("[Restaurant Address 1]"),
            pw.Text("[City], [State] [Postal Code]"),
            pw.SizedBox(height: 5),
            pw.Text("[Restaurant Phone Number]"),
            pw.Text("[Restaurant Email Address]"),
            pw.Divider(),
            pw.SizedBox(height: 10),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text("Bill To"),
                    pw.Text("[Client Name ]"),
                    pw.Text("[Client Address line 1]"),
                    pw.Text("[City], [State] [Postal code]"),
                  ],
                ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    pw.Text("Invoice Number: 2001321"),
                    pw.Text("Date: 8/22/2024"),
                    pw.Text("Due Date: "),
                    pw.Text("Terms: "),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 20),
            pw.Table.fromTextArray(
              headers: ['Description', 'Quantity', 'Unit price', 'Amount'],
              data: [
                ['Salad', '5', 'Rs. 100', 'Rs. 500'],
                ['Product name', '1', 'Rs. 0', 'Rs. 0'],
                ['Product name', '1', 'Rs. 0', 'Rs. 0'],
              ],
            ),
            pw.Divider(),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.end,
              children: [
                pw.Text('Total: Rs. 500', style: pw.TextStyle(fontSize: 16)),
              ],
            ),
          ],
        );
      },
    ),
  );

  final bytes = await pdf.save();
  final base64String = base64Encode(bytes);
  final pdfDataUri = 'data:application/pdf;base64,$base64String';
  print("***************************************");
  print(pdfDataUri);
  print("***************************************");
}
