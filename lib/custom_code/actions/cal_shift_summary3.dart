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
    // shift[i]["billAmt"] = shift[i]["billAmt"] + invoice.billAmt;
    shift[i]["deliveryCharges"] =
        shift[i]["deliveryCharges"] + invoice.delliveryChrg;
    shift[i]["discount"] = shift[i]["discount"] + invoice.discountAmt;
    shift[i]["tax"] = shift[i]["tax"] + invoice.taxAmt;

    shift[i]["totalSale"] = shift[i]["totalSale"] + total - previousAmount;

    // shift[i]["subTotalBill"] = shift[i]["subTotalBill"] + invoice.billAmt;
    if (paymentmode == 'CASH') {
      shift[i]["cashSale"] = shift[i]["cashSale"].toDouble() +
          (invoice.paymentMode == "CASH"
              ? invoice.finalBillAmt!.toDouble() - previousAmount
              : 0);
    } else {
      shift[i]["cashSale"] = shift[i]["cashSale"].toDouble() +
          (invoice.paymentMode == "CASH"
              ? invoice.finalBillAmt!.toDouble()
              : 0);
    }

    final paymentJsonData = jsonDecode(shift[i]["paymentJson"]);
    if (paymentmode == 'CASH') {
      paymentJsonData["cash"] = paymentJsonData["cash"].toDouble() +
          (invoice.paymentMode == "CASH"
              ? invoice.finalBillAmt!.toDouble() - previousAmount
              : 0);
    } else {
      paymentJsonData["cash"] = paymentJsonData["cash"].toDouble() +
          (invoice.paymentMode == "CASH"
              ? invoice.finalBillAmt!.toDouble()
              : 0);
    }

    if (paymentmode == 'COMPLEMENTARY') {
      paymentJsonData["complementary"] =
          paymentJsonData["complementary"].toDouble() +
              (invoice.paymentMode == "COMPLEMENTARY"
                  ? invoice.finalBillAmt!.toDouble() - previousAmount
                  : 0);
    } else {
      paymentJsonData["complementary"] =
          paymentJsonData["complementary"].toDouble() +
              (invoice.paymentMode == "COMPLEMENTARY"
                  ? invoice.finalBillAmt!.toDouble()
                  : 0);
    }
    if (paymentmode == 'CREDIT') {
      paymentJsonData["credit"] = paymentJsonData["credit"].toDouble() +
          (invoice.paymentMode == "CREDIT"
              ? invoice.finalBillAmt!.toDouble() - previousAmount
              : 0);
    } else {
      paymentJsonData["credit"] = paymentJsonData["credit"].toDouble() +
          (invoice.paymentMode == "CREDIT"
              ? invoice.finalBillAmt!.toDouble()
              : 0);
    }

    if (paymentmode == 'GOOGLEPAY') {
      paymentJsonData["googlepay"] = paymentJsonData["googlepay"].toDouble() +
          (invoice.paymentMode == "GOOGLEPAY"
              ? invoice.finalBillAmt!.toDouble() - previousAmount
              : 0);
    } else {
      paymentJsonData["googlepay"] = paymentJsonData["googlepay"].toDouble() +
          (invoice.paymentMode == "GOOGLEPAY"
              ? invoice.finalBillAmt!.toDouble()
              : 0);
    }

    if (paymentmode == 'PAYTM') {
      paymentJsonData["paytm"] = paymentJsonData["paytm"].toDouble() +
          (invoice.paymentMode == "PAYTM"
              ? invoice.finalBillAmt!.toDouble() - previousAmount
              : 0);
    } else {
      paymentJsonData["paytm"] = paymentJsonData["paytm"].toDouble() +
          (invoice.paymentMode == "PAYTM"
              ? invoice.finalBillAmt!.toDouble()
              : 0);
    }

    if (paymentmode == 'PHONEPE') {
      paymentJsonData["phonepe"] = paymentJsonData["phonepe"].toDouble() +
          (invoice.paymentMode == "PHONEPE"
              ? invoice.finalBillAmt!.toDouble() - previousAmount
              : 0);
    } else {
      paymentJsonData["phonepe"] = paymentJsonData["phonepe"].toDouble() +
          (invoice.paymentMode == "PHONEPE"
              ? invoice.finalBillAmt!.toDouble()
              : 0);
    }

    if (paymentmode == 'CHEQUE') {
      paymentJsonData["cheque"] = paymentJsonData["cheque"].toDouble() +
          (invoice.paymentMode == "CHEQUE"
              ? invoice.finalBillAmt!.toDouble() - previousAmount
              : 0);
    } else {
      paymentJsonData["cheque"] = paymentJsonData["cheque"].toDouble() +
          (invoice.paymentMode == "CHEQUE"
              ? invoice.finalBillAmt!.toDouble()
              : 0);
    }
    if (paymentmode == 'OTHER') {
      paymentJsonData["other"] = paymentJsonData["other"].toDouble() +
          (invoice.paymentMode == "OTHER"
              ? invoice.finalBillAmt!.toDouble() - previousAmount
              : 0);
    } else {
      paymentJsonData["other"] = paymentJsonData["other"].toDouble() +
          (invoice.paymentMode == "OTHER"
              ? invoice.finalBillAmt!.toDouble()
              : 0);
    }
    if (paymentmode == 'CARD') {
      paymentJsonData["card"] = paymentJsonData["card"].toDouble() +
          (invoice.paymentMode == "CARD"
              ? invoice.finalBillAmt!.toDouble() - previousAmount
              : 0);
    } else {
      paymentJsonData["card"] = paymentJsonData["card"].toDouble() +
          (invoice.paymentMode == "CARD"
              ? invoice.finalBillAmt!.toDouble()
              : 0);
    }

    if (paymentmode == 'UPI QR') {
      paymentJsonData["upi_qr"] = paymentJsonData["upi_qr"].toDouble() +
          (invoice.paymentMode == "UPI QR"
              ? invoice.finalBillAmt!.toDouble() - previousAmount
              : 0);
    } else {
      paymentJsonData["upi_qr"] = paymentJsonData["upi_qr"].toDouble() +
          (invoice.paymentMode == "UPI QR"
              ? invoice.finalBillAmt!.toDouble()
              : 0);
    }
    var paymentJsonDataString = jsonEncode(paymentJsonData).toString();
    shift[i]["paymentJson"] = paymentJsonDataString;
  }
  print('sk');
  print(shift[0]);
  return shift[0];
}
