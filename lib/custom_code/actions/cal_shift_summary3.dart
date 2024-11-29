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

Future<dynamic> calShiftSummary3(InvoiceRecord invoice, dynamic shift1,
    double previousAmount, String paymentmode) async {
  // Add your function code here!
  print("invoice");
  print(invoice);
  double? total = invoice.finalBillAmt;
  print(shift1);
  List<dynamic> shift = [];
  shift.add(shift1);

  for (int i = 0; i < shift.length; i++) {
    shift[i]["billCount"] = FFAppState().billcount;
    shift[i]["lastBillNo"] = invoice.invoice;

    // Adjust delivery charges, discount, and tax based on the current invoice
    shift[i]["deliveryCharges"] += invoice.delliveryChrg ?? 0;
    shift[i]["discount"] += invoice.discountAmt ?? 0;
    shift[i]["tax"] += invoice.taxAmt ?? 0;

    // Update totalSale by adjusting for the difference between the current and previous amounts
    shift[i]["totalSale"] += (total ?? 0) - previousAmount;

    // Update the payment method specific totals dynamically
    final paymentJsonData = jsonDecode(shift[i]["paymentJson"]);

    // Update each payment mode dynamically
    void updatePayment(String mode, double adjustment) {
      paymentJsonData[mode] =
          (paymentJsonData[mode]?.toDouble() ?? 0) + adjustment;
    }

    // Calculate the adjustment for the current payment mode
    double adjustment = (invoice.finalBillAmt ?? 0) - previousAmount;

    switch (invoice.paymentMode) {
      case "CASH":
        updatePayment("cash", adjustment);
        break;
      case "COMPLEMENTARY":
        updatePayment("complementary", adjustment);
        break;
      case "CREDIT":
        updatePayment("credit", adjustment);
        break;
      case "GOOGLEPAY":
        updatePayment("googlepay", adjustment);
        break;
      case "PAYTM":
        updatePayment("paytm", adjustment);
        break;
      case "PHONEPE":
        updatePayment("phonepe", adjustment);
        break;
      case "CHEQUE":
        updatePayment("cheque", adjustment);
        break;
      case "OTHER":
        updatePayment("other", adjustment);
        break;
      case "CARD":
        updatePayment("card", adjustment);
        break;
      case "UPI QR":
        updatePayment("upi_qr", adjustment);
        break;
      default:
        print("Unknown payment mode: ${invoice.paymentMode}");
    }

    // Convert the updated paymentJsonData back to a string and assign it back
    shift[i]["paymentJson"] = jsonEncode(paymentJsonData);
  }

  print('sk');
  print(shift[0]);
  return shift[0];
}
