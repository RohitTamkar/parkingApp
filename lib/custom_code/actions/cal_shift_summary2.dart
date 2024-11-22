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

Future<dynamic> calShiftSummary2(InvoiceRecord invoice, dynamic shift1,
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
    if (paymentmode == 'COMPLEMENTARY') {
      shift[i]["totalSale"] = shift[i]["totalSale"] - total;
    } else {
      shift[i]["totalSale"] = shift[i]["totalSale"] + total - previousAmount;
    }

    // shift[i]["subTotalBill"] = shift[i]["subTotalBill"] + invoice.billAmt;

    if (paymentmode == 'COMPLEMENTARY') {
      shift[i]["cashSale"] = shift[i]["cashSale"].toDouble() -
          (invoice.paymentMode == "CASH"
              ? invoice.finalBillAmt!.toDouble()
              : 0);
    } else {
      shift[i]["cashSale"] = shift[i]["cashSale"].toDouble() +
          (invoice.paymentMode == "CASH"
              ? invoice.finalBillAmt!.toDouble() - previousAmount
              : 0);
    }

    /*shift[i]["creditSale"] = shift[i]["creditSale"].toDouble() +
        (invoice.paymentMode == "CREDIT"
            ? invoice.finalBillAmt!.toDouble()
            : 0);
    shift[i]["googlePay"] = shift[i]["googlePay"].toDouble() +
        (invoice.paymentMode == "GOOGLEPAY"
            ? invoice.finalBillAmt!.toDouble()
            : 0);
    shift[i]["paytm"] = shift[i]["paytm"].toDouble() +
        (invoice.paymentMode == "PAYTM" ? invoice.finalBillAmt!.toDouble() : 0);
    shift[i]["phonePe"] = shift[i]["phonePe"].toDouble() +
        (invoice.paymentMode == "PHONEPAY"
            ? invoice.finalBillAmt!.toDouble()
            : 0);
    shift[i]["cheque"] = shift[i]["cheque"].toDouble() +
        (invoice.paymentMode == "CHEQUE"
            ? invoice.finalBillAmt!.toDouble()
            : 0);
     shift[i]["other"] = shift[i]["other"].toDouble() +
        (invoice.paymentMode == "OTHER" ? invoice.finalBillAmt!.toDouble() : 0);
     shift[i]["digitalSale"] = shift[i]["digitalSale"] +
        (invoice.paymentMode == "DIGITAL"
            ? invoice.finalBillAmt!.toDouble()
            : 0);
    shift[i]["card"] = shift[i]["card"].toDouble() +(invoice.paymentMode == "CARD"
        ? invoice.finalBillAmt!.toDouble()
        : 0);*/
    final paymentJsonData = jsonDecode(shift[i]["paymentJson"]);
    if (paymentmode == 'COMPLEMENTARY') {
      paymentJsonData["cash"] = paymentJsonData["cash"].toDouble() -
          (invoice.paymentMode == "CASH"
              ? invoice.finalBillAmt!.toDouble()
              : 0);
    } else {
      paymentJsonData["cash"] = paymentJsonData["cash"].toDouble() +
          (invoice.paymentMode == "CASH"
              ? invoice.finalBillAmt!.toDouble() - previousAmount
              : 0);
    }
    paymentJsonData["complementary"] =
        paymentJsonData["complementary"].toDouble() +
            (invoice.paymentMode == "COMPLEMENTARY"
                ? invoice.finalBillAmt!.toDouble() - previousAmount
                : 0);
    if (paymentmode == 'COMPLEMENTARY') {
      paymentJsonData["credit"] = paymentJsonData["credit"].toDouble() -
          (invoice.paymentMode == "CREDIT"
              ? invoice.finalBillAmt!.toDouble()
              : 0);
    } else {
      paymentJsonData["credit"] = paymentJsonData["credit"].toDouble() +
          (invoice.paymentMode == "CREDIT"
              ? invoice.finalBillAmt!.toDouble() - previousAmount
              : 0);
    }
    if (paymentmode == 'COMPLEMENTARY') {
      paymentJsonData["googlepay"] = paymentJsonData["googlepay"].toDouble() -
          (invoice.paymentMode == "GOOGLEPAY"
              ? invoice.finalBillAmt!.toDouble()
              : 0);
    } else {
      paymentJsonData["googlepay"] = paymentJsonData["googlepay"].toDouble() +
          (invoice.paymentMode == "GOOGLEPAY"
              ? invoice.finalBillAmt!.toDouble() - previousAmount
              : 0);
    }
    if (paymentmode == 'COMPLEMENTARY') {
      paymentJsonData["paytm"] = paymentJsonData["paytm"].toDouble() -
          (invoice.paymentMode == "PAYTM"
              ? invoice.finalBillAmt!.toDouble()
              : 0);
    } else {
      paymentJsonData["paytm"] = paymentJsonData["paytm"].toDouble() +
          (invoice.paymentMode == "PAYTM"
              ? invoice.finalBillAmt!.toDouble() - previousAmount
              : 0);
    }
    if (paymentmode == 'COMPLEMENTARY') {
      paymentJsonData["phonepe"] = paymentJsonData["phonepe"].toDouble() -
          (invoice.paymentMode == "PHONEPE"
              ? invoice.finalBillAmt!.toDouble()
              : 0);
    } else {
      paymentJsonData["phonepe"] = paymentJsonData["phonepe"].toDouble() +
          (invoice.paymentMode == "PHONEPE"
              ? invoice.finalBillAmt!.toDouble() - previousAmount
              : 0);
    }
    if (paymentmode == 'COMPLEMENTARY') {
      paymentJsonData["cheque"] = paymentJsonData["cheque"].toDouble() -
          (invoice.paymentMode == "CHEQUE"
              ? invoice.finalBillAmt!.toDouble()
              : 0);
    } else {
      paymentJsonData["cheque"] = paymentJsonData["cheque"].toDouble() +
          (invoice.paymentMode == "CHEQUE"
              ? invoice.finalBillAmt!.toDouble() - previousAmount
              : 0);
    }
    if (paymentmode == 'COMPLEMENTARY') {
      paymentJsonData["other"] = paymentJsonData["other"].toDouble() -
          (invoice.paymentMode == "OTHER"
              ? invoice.finalBillAmt!.toDouble()
              : 0);
    } else {
      paymentJsonData["other"] = paymentJsonData["other"].toDouble() +
          (invoice.paymentMode == "OTHER"
              ? invoice.finalBillAmt!.toDouble() - previousAmount
              : 0);
    }
    if (paymentmode == 'COMPLEMENTARY') {
      paymentJsonData["card"] = paymentJsonData["card"].toDouble() -
          (invoice.paymentMode == "CARD"
              ? invoice.finalBillAmt!.toDouble()
              : 0);
    } else {
      paymentJsonData["card"] = paymentJsonData["card"].toDouble() +
          (invoice.paymentMode == "CARD"
              ? invoice.finalBillAmt!.toDouble() - previousAmount
              : 0);
    }
    if (paymentmode == 'COMPLEMENTARY') {
      paymentJsonData["upi_qr"] = paymentJsonData["upi_qr"].toDouble() -
          (invoice.paymentMode == "UPI QR"
              ? invoice.finalBillAmt!.toDouble()
              : 0);
    } else {
      paymentJsonData["upi_qr"] = paymentJsonData["upi_qr"].toDouble() +
          (invoice.paymentMode == "UPI QR"
              ? invoice.finalBillAmt!.toDouble() - previousAmount
              : 0);
    }
    var paymentJsonDataString = jsonEncode(paymentJsonData).toString();
    shift[i]["paymentJson"] = paymentJsonDataString;
  }
  print('sk');
  print(shift[0]);
  return shift[0];
}
