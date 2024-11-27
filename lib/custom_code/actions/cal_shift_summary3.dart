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
  double? oldFinalBillAmt, // Pass the old amount
) async {
  print("Invoice:");
  print(invoice);
  double? newFinalBillAmt = invoice.finalBillAmt; // The updated amount
  print("Shift before update:");
  print(shift1);
  List<dynamic> shift = [];
  shift.add(shift1);

  for (int i = 0; i < shift.length; i++) {
    // Update general fields by first removing the old amount and then adding the new amount
    shift[i]["totalSale"] =
        shift[i]["totalSale"] - (oldFinalBillAmt ?? 0) + (newFinalBillAmt ?? 0);

    shift[i]["cashSale"] = shift[i]["cashSale"].toDouble() -
        (invoice.paymentMode == "CASH" ? (oldFinalBillAmt ?? 0) : 0) +
        (invoice.paymentMode == "CASH" ? (newFinalBillAmt ?? 0) : 0);

    shift[i]["deliveryCharges"] = shift[i]["deliveryCharges"] -
        (invoice.delliveryChrg ?? 0) +
        (invoice.delliveryChrg ?? 0);

    shift[i]["discount"] = shift[i]["discount"] -
        (invoice.discountAmt ?? 0) +
        (invoice.discountAmt ?? 0);

    shift[i]["tax"] =
        shift[i]["tax"] - (invoice.taxAmt ?? 0) + (invoice.taxAmt ?? 0);

    // Update paymentJson by first removing old values, then adding new values
    final paymentJsonData = jsonDecode(shift[i]["paymentJson"]);

    // Deduct the old amount
    paymentJsonData["cash"] = paymentJsonData["cash"].toDouble() -
        (invoice.paymentMode == "CASH" ? (oldFinalBillAmt ?? 0) : 0);
    paymentJsonData["credit"] = paymentJsonData["credit"].toDouble() -
        (invoice.paymentMode == "CREDIT" ? (oldFinalBillAmt ?? 0) : 0);
    paymentJsonData["googlepay"] = paymentJsonData["googlepay"].toDouble() -
        (invoice.paymentMode == "GOOGLEPAY" ? (oldFinalBillAmt ?? 0) : 0);
    paymentJsonData["paytm"] = paymentJsonData["paytm"].toDouble() -
        (invoice.paymentMode == "PAYTM" ? (oldFinalBillAmt ?? 0) : 0);
    paymentJsonData["phonepe"] = paymentJsonData["phonepe"].toDouble() -
        (invoice.paymentMode == "PHONEPE" ? (oldFinalBillAmt ?? 0) : 0);
    paymentJsonData["cheque"] = paymentJsonData["cheque"].toDouble() -
        (invoice.paymentMode == "CHEQUE" ? (oldFinalBillAmt ?? 0) : 0);
    paymentJsonData["other"] = paymentJsonData["other"].toDouble() -
        (invoice.paymentMode == "OTHER" ? (oldFinalBillAmt ?? 0) : 0);
    paymentJsonData["card"] = paymentJsonData["card"].toDouble() -
        (invoice.paymentMode == "CARD" ? (oldFinalBillAmt ?? 0) : 0);
    paymentJsonData["upi_qr"] = paymentJsonData["upi_qr"].toDouble() -
        (invoice.paymentMode == "UPI QR" ? (oldFinalBillAmt ?? 0) : 0);

    // Add the new amount
    paymentJsonData["cash"] = paymentJsonData["cash"].toDouble() +
        (invoice.paymentMode == "CASH" ? (newFinalBillAmt ?? 0) : 0);
    paymentJsonData["credit"] = paymentJsonData["credit"].toDouble() +
        (invoice.paymentMode == "CREDIT" ? (newFinalBillAmt ?? 0) : 0);
    paymentJsonData["googlepay"] = paymentJsonData["googlepay"].toDouble() +
        (invoice.paymentMode == "GOOGLEPAY" ? (newFinalBillAmt ?? 0) : 0);
    paymentJsonData["paytm"] = paymentJsonData["paytm"].toDouble() +
        (invoice.paymentMode == "PAYTM" ? (newFinalBillAmt ?? 0) : 0);
    paymentJsonData["phonepe"] = paymentJsonData["phonepe"].toDouble() +
        (invoice.paymentMode == "PHONEPE" ? (newFinalBillAmt ?? 0) : 0);
    paymentJsonData["cheque"] = paymentJsonData["cheque"].toDouble() +
        (invoice.paymentMode == "CHEQUE" ? (newFinalBillAmt ?? 0) : 0);
    paymentJsonData["other"] = paymentJsonData["other"].toDouble() +
        (invoice.paymentMode == "OTHER" ? (newFinalBillAmt ?? 0) : 0);
    paymentJsonData["card"] = paymentJsonData["card"].toDouble() +
        (invoice.paymentMode == "CARD" ? (newFinalBillAmt ?? 0) : 0);
    paymentJsonData["upi_qr"] = paymentJsonData["upi_qr"].toDouble() +
        (invoice.paymentMode == "UPI QR" ? (newFinalBillAmt ?? 0) : 0);

    shift[i]["paymentJson"] = jsonEncode(paymentJsonData);
  }

  print('Shift after update:');
  print(shift[0]);
  return shift[0];
}
