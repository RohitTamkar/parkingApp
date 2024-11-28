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
  InvoiceRecord oldInvoice,
  InvoiceRecord newInvoice,
  dynamic shift1,
) async {
  print("Old Invoice");
  print(oldInvoice);
  print("New Invoice");
  print(newInvoice);

  double? oldTotal = oldInvoice.finalBillAmt ?? 0.0;
  double? newTotal = newInvoice.finalBillAmt ?? 0.0;
  double? difference = newTotal - oldTotal;

  List<dynamic> shift = [];
  shift.add(shift1);

  for (int i = 0; i < shift.length; i++) {
    // Update shift totals
    shift[i]["billCount"] = FFAppState().billcount;
    shift[i]["lastBillNo"] = newInvoice.invoice;
    shift[i]["deliveryCharges"] = shift[i]["deliveryCharges"] -
        oldInvoice.delliveryChrg +
        newInvoice.delliveryChrg;
    shift[i]["discount"] =
        shift[i]["discount"] - oldInvoice.discountAmt + newInvoice.discountAmt;
    shift[i]["tax"] = shift[i]["tax"] - oldInvoice.taxAmt + newInvoice.taxAmt;
    shift[i]["totalSale"] = shift[i]["totalSale"] + difference;

    // Update paymentJson
    final paymentJsonData = jsonDecode(shift[i]["paymentJson"]);

    void updatePaymentMode(String mode, double oldAmt, double newAmt) {
      paymentJsonData[mode] =
          paymentJsonData[mode].toDouble() - oldAmt + newAmt;
    }

    updatePaymentMode(
      "cash",
      oldInvoice.paymentMode == "CASH" ? oldInvoice.finalBillAmt ?? 0.0 : 0.0,
      newInvoice.paymentMode == "CASH" ? newInvoice.finalBillAmt ?? 0.0 : 0.0,
    );
    updatePaymentMode(
      "credit",
      oldInvoice.paymentMode == "CREDIT" ? oldInvoice.finalBillAmt ?? 0.0 : 0.0,
      newInvoice.paymentMode == "CREDIT" ? newInvoice.finalBillAmt ?? 0.0 : 0.0,
    );
    updatePaymentMode(
      "googlepay",
      oldInvoice.paymentMode == "GOOGLEPAY"
          ? oldInvoice.finalBillAmt ?? 0.0
          : 0.0,
      newInvoice.paymentMode == "GOOGLEPAY"
          ? newInvoice.finalBillAmt ?? 0.0
          : 0.0,
    );
    updatePaymentMode(
      "paytm",
      oldInvoice.paymentMode == "PAYTM" ? oldInvoice.finalBillAmt ?? 0.0 : 0.0,
      newInvoice.paymentMode == "PAYTM" ? newInvoice.finalBillAmt ?? 0.0 : 0.0,
    );
    updatePaymentMode(
      "phonepe",
      oldInvoice.paymentMode == "PHONEPE"
          ? oldInvoice.finalBillAmt ?? 0.0
          : 0.0,
      newInvoice.paymentMode == "PHONEPE"
          ? newInvoice.finalBillAmt ?? 0.0
          : 0.0,
    );
    updatePaymentMode(
      "cheque",
      oldInvoice.paymentMode == "CHEQUE" ? oldInvoice.finalBillAmt ?? 0.0 : 0.0,
      newInvoice.paymentMode == "CHEQUE" ? newInvoice.finalBillAmt ?? 0.0 : 0.0,
    );
    updatePaymentMode(
      "other",
      oldInvoice.paymentMode == "OTHER" ? oldInvoice.finalBillAmt ?? 0.0 : 0.0,
      newInvoice.paymentMode == "OTHER" ? newInvoice.finalBillAmt ?? 0.0 : 0.0,
    );
    updatePaymentMode(
      "card",
      oldInvoice.paymentMode == "CARD" ? oldInvoice.finalBillAmt ?? 0.0 : 0.0,
      newInvoice.paymentMode == "CARD" ? newInvoice.finalBillAmt ?? 0.0 : 0.0,
    );
    updatePaymentMode(
      "upi_qr",
      oldInvoice.paymentMode == "UPI QR" ? oldInvoice.finalBillAmt ?? 0.0 : 0.0,
      newInvoice.paymentMode == "UPI QR" ? newInvoice.finalBillAmt ?? 0.0 : 0.0,
    );

    var paymentJsonDataString = jsonEncode(paymentJsonData).toString();
    shift[i]["paymentJson"] = paymentJsonDataString;
  }

  print('Updated Shift Summary');
  print(shift[0]);
  return shift[0];
}
