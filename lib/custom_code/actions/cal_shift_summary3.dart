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
  InvoiceRecord invoice, // Updated invoice data
  dynamic shift1, // Current shift summary
  double? oldFinalBillAmt, // Old final bill amount (from original invoice)
  String oldPaymentMode, // Old payment mode (from original invoice)
) async {
  print("Processing Invoice Edit:");
  print(invoice);

  // New final bill amount
  double newFinalBillAmt = invoice.finalBillAmt ?? 0.0;

  // Parse shift into a mutable structure
  List<dynamic> shift = [];
  shift.add(shift1);

  for (int i = 0; i < shift.length; i++) {
    // --- Adjust Total Sale ---
    shift[i]["totalSale"] -= oldFinalBillAmt ?? 0.0; // Deduct old bill amount
    shift[i]["totalSale"] += newFinalBillAmt; // Add new bill amount

    // --- Adjust Cash Sale (if applicable) ---
    if (oldPaymentMode == "CASH") {
      shift[i]["cashSale"] -= oldFinalBillAmt ?? 0.0; // Deduct old CASH amount
    }
    if (invoice.paymentMode == "CASH") {
      shift[i]["cashSale"] += newFinalBillAmt; // Add new CASH amount
    }

    // --- Adjust Delivery Charges, Discount, and Tax ---
    shift[i]["deliveryCharges"] -= invoice.delliveryChrg ?? 0.0; // Deduct old
    shift[i]["discount"] -= invoice.discountAmt ?? 0.0; // Deduct old
    shift[i]["tax"] -= invoice.taxAmt ?? 0.0; // Deduct old

    shift[i]["deliveryCharges"] += invoice.delliveryChrg ?? 0.0; // Add new
    shift[i]["discount"] += invoice.discountAmt ?? 0.0; // Add new
    shift[i]["tax"] += invoice.taxAmt ?? 0.0; // Add new

    // --- Handle Payment JSON ---
    final paymentJsonData = jsonDecode(shift[i]["paymentJson"]);

    // Deduct old payment mode amount
    paymentJsonData[oldPaymentMode.toLowerCase()] -= oldFinalBillAmt ?? 0.0;

    // Add new payment mode amount
    paymentJsonData[invoice.paymentMode.toLowerCase()] += newFinalBillAmt;

    // Save updated payment JSON
    shift[i]["paymentJson"] = jsonEncode(paymentJsonData);
  }

  print("Updated Shift Summary:");
  print(shift[0]);
  return shift[0];
}
