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

import 'dart:convert';

Future<dynamic> calShiftSummary3(
  InvoiceRecord invoice,
  dynamic shift1,
  double? oldFinalBillAmt, // Pass the old final value as a parameter
) async {
  // Add your function code here!
  print("invoice");
  print(invoice);
  double? newFinalBillAmt = invoice.finalBillAmt; // New value
  print(shift1);
  List<dynamic> shift = [];
  shift.add(shift1);

  for (int i = 0; i < shift.length; i++) {
    shift[i]["billCount"] = FFAppState().billcount;
    shift[i]["lastBillNo"] = invoice.invoice;

    // Deduct the old values
    shift[i]["deliveryCharges"] =
        shift[i]["deliveryCharges"] - invoice.delliveryChrg!;
    shift[i]["discount"] = shift[i]["discount"] - invoice.discountAmt!;
    shift[i]["tax"] = shift[i]["tax"] - invoice.taxAmt!;
    shift[i]["totalSale"] = shift[i]["totalSale"] - oldFinalBillAmt!;
    shift[i]["cashSale"] = shift[i]["cashSale"].toDouble() -
        (invoice.paymentMode == "CASH" ? oldFinalBillAmt.toDouble() : 0);

    // Add the new values
    shift[i]["deliveryCharges"] =
        shift[i]["deliveryCharges"] + invoice.delliveryChrg!;
    shift[i]["discount"] = shift[i]["discount"] + invoice.discountAmt!;
    shift[i]["tax"] = shift[i]["tax"] + invoice.taxAmt!;
    shift[i]["totalSale"] = shift[i]["totalSale"] + newFinalBillAmt!;
    shift[i]["cashSale"] = shift[i]["cashSale"].toDouble() +
        (invoice.paymentMode == "CASH" ? newFinalBillAmt.toDouble() : 0);

    // Update payment JSON
    final paymentJsonData = jsonDecode(shift[i]["paymentJson"]);

    // Deduct old values
    paymentJsonData["cash"] = paymentJsonData["cash"].toDouble() -
        (invoice.paymentMode == "CASH" ? oldFinalBillAmt.toDouble() : 0);
    paymentJsonData["credit"] = paymentJsonData["credit"].toDouble() -
        (invoice.paymentMode == "CREDIT" ? oldFinalBillAmt.toDouble() : 0);
    paymentJsonData["googlepay"] = paymentJsonData["googlepay"].toDouble() -
        (invoice.paymentMode == "GOOGLEPAY" ? oldFinalBillAmt.toDouble() : 0);
    paymentJsonData["paytm"] = paymentJsonData["paytm"].toDouble() -
        (invoice.paymentMode == "PAYTM" ? oldFinalBillAmt.toDouble() : 0);
    paymentJsonData["phonepe"] = paymentJsonData["phonepe"].toDouble() -
        (invoice.paymentMode == "PHONEPE" ? oldFinalBillAmt.toDouble() : 0);
    paymentJsonData["cheque"] = paymentJsonData["cheque"].toDouble() -
        (invoice.paymentMode == "CHEQUE" ? oldFinalBillAmt.toDouble() : 0);
    paymentJsonData["other"] = paymentJsonData["other"].toDouble() -
        (invoice.paymentMode == "OTHER" ? oldFinalBillAmt.toDouble() : 0);
    paymentJsonData["card"] = paymentJsonData["card"].toDouble() -
        (invoice.paymentMode == "CARD" ? oldFinalBillAmt.toDouble() : 0);
    paymentJsonData["upi_qr"] = paymentJsonData["upi_qr"].toDouble() -
        (invoice.paymentMode == "UPI QR" ? oldFinalBillAmt.toDouble() : 0);

    // Add new values
    paymentJsonData["cash"] = paymentJsonData["cash"].toDouble() +
        (invoice.paymentMode == "CASH" ? newFinalBillAmt.toDouble() : 0);
    paymentJsonData["credit"] = paymentJsonData["credit"].toDouble() +
        (invoice.paymentMode == "CREDIT" ? newFinalBillAmt.toDouble() : 0);
    paymentJsonData["googlepay"] = paymentJsonData["googlepay"].toDouble() +
        (invoice.paymentMode == "GOOGLEPAY" ? newFinalBillAmt.toDouble() : 0);
    paymentJsonData["paytm"] = paymentJsonData["paytm"].toDouble() +
        (invoice.paymentMode == "PAYTM" ? newFinalBillAmt.toDouble() : 0);
    paymentJsonData["phonepe"] = paymentJsonData["phonepe"].toDouble() +
        (invoice.paymentMode == "PHONEPE" ? newFinalBillAmt.toDouble() : 0);
    paymentJsonData["cheque"] = paymentJsonData["cheque"].toDouble() +
        (invoice.paymentMode == "CHEQUE" ? newFinalBillAmt.toDouble() : 0);
    paymentJsonData["other"] = paymentJsonData["other"].toDouble() +
        (invoice.paymentMode == "OTHER" ? newFinalBillAmt.toDouble() : 0);
    paymentJsonData["card"] = paymentJsonData["card"].toDouble() +
        (invoice.paymentMode == "CARD" ? newFinalBillAmt.toDouble() : 0);
    paymentJsonData["upi_qr"] = paymentJsonData["upi_qr"].toDouble() +
        (invoice.paymentMode == "UPI QR" ? newFinalBillAmt.toDouble() : 0);

    var paymentJsonDataString = jsonEncode(paymentJsonData).toString();
    shift[i]["paymentJson"] = paymentJsonDataString;
  }
  print('Updated Shift Summary:');
  print(shift[0]);
  return shift[0];
}
