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

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'dart:convert';

Future<dynamic> calShiftSummary3(
  InvoiceRecord originalInvoice, // Original invoice before editing
  InvoiceRecord updatedInvoice, // Updated invoice after editing
  dynamic shift1,
) async {
  print("Original Invoice: $originalInvoice");
  print("Updated Invoice: $updatedInvoice");

  double? originalTotal = originalInvoice.finalBillAmt ?? 0;
  double? updatedTotal = updatedInvoice.finalBillAmt ?? 0;
  double difference = updatedTotal - originalTotal;

  print("Shift before update: $shift1");
  List<dynamic> shift = [];
  shift.add(shift1);

  for (int i = 0; i < shift.length; i++) {
    // Update totals in the shift
    shift[i]["totalSale"] = shift[i]["totalSale"] + difference;
    shift[i]["deliveryCharges"] = shift[i]["deliveryCharges"] +
        (updatedInvoice.delliveryChrg ?? 0) -
        (originalInvoice.delliveryChrg ?? 0);
    shift[i]["discount"] = shift[i]["discount"] +
        (updatedInvoice.discountAmt ?? 0) -
        (originalInvoice.discountAmt ?? 0);
    shift[i]["tax"] = shift[i]["tax"] +
        (updatedInvoice.taxAmt ?? 0) -
        (originalInvoice.taxAmt ?? 0);

    // Adjust the paymentJson
    final paymentJsonData = jsonDecode(shift[i]["paymentJson"]);

    // Deduct original amounts
    paymentJsonData[originalInvoice.paymentMode.toLowerCase()] =
        (paymentJsonData[originalInvoice.paymentMode.toLowerCase()] ?? 0)
                .toDouble() -
            originalTotal;

    // Add updated amounts
    paymentJsonData[updatedInvoice.paymentMode.toLowerCase()] =
        (paymentJsonData[updatedInvoice.paymentMode.toLowerCase()] ?? 0)
                .toDouble() +
            updatedTotal;

    // Re-encode the paymentJson
    shift[i]["paymentJson"] = jsonEncode(paymentJsonData).toString();
  }

  print('Updated Shift:');
  print(shift[0]);
  return shift[0];
}
