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

Future<ShiftRecord> shiftTotalSale(List<ShiftRecord> shiftList) async {
  double totalSaleForToday = 0;
  double totalCashSale = 0;
  double totalOther = 0;
  String todayId = DateFormat('yyyy-MM-dd').format(DateTime.now());

  // Initialize total payment fields
  double totalCash = 0.0;
  double totalCredit = 0.0;
  double totalCheque = 0.0;
  double totalDigital = 0.0;
  double totalCard = 0.0;
  double totalGooglePay = 0.0;
  double totalPhonePe = 0.0;
  double totalPaytm = 0.0;
  double totalOtherPayment = 0.0;
  double totalLoyaltyPoint = 0.0;
  double totalUpiQr = 0.0;
  double totalComplementary = 0.0;

  // Filter shifts for the current day and sum their totalSale and paymentJson
  for (var shift in shiftList) {
    if (shift.dayId == todayId) {
      totalSaleForToday += shift.totalSale ?? 0;
      totalCashSale += shift.cashInHand ?? 0;

      // Parse the paymentJson to sum the payments
      if (shift.paymentJson.isNotEmpty) {
        Map<String, dynamic> paymentMap = jsonDecode(shift.paymentJson);

        totalCash += paymentMap['cash'] ?? 0.0;
        totalCredit += paymentMap['credit'] ?? 0.0;
        totalCheque += paymentMap['cheque'] ?? 0.0;
        totalDigital += paymentMap['digital'] ?? 0.0;
        totalCard += paymentMap['card'] ?? 0.0;
        totalGooglePay += paymentMap['googlepay'] ?? 0.0;
        totalPhonePe += paymentMap['phonepe'] ?? 0.0;
        totalPaytm += paymentMap['paytm'] ?? 0.0;
        totalOtherPayment += paymentMap['other'] ?? 0.0;
        totalLoyaltyPoint += paymentMap['loyaltypoint'] ?? 0.0;
        totalUpiQr += paymentMap['upi_qr'] ?? 0.0;
        totalComplementary += paymentMap['complementary'] ?? 0.0;
      }
    }
  }

  // Construct the total paymentJson for all shifts
  Map<String, dynamic> totalPaymentJson = {
    'cash': totalCash,
    'credit': totalCredit,
    'cheque': totalCheque,
    'digital': totalDigital,
    'card': totalCard,
    'googlepay': totalGooglePay,
    'phonepe': totalPhonePe,
    'paytm': totalPaytm,
    'other': totalOtherPayment,
    'loyaltypoint': totalLoyaltyPoint,
    'upi_qr': totalUpiQr,
    'complementary': totalComplementary,
  };

  // Create a map to pass to the constructor
  Map<String, dynamic> shiftData = {
    'dayId': todayId,
    'totalSale': totalSaleForToday,
    'cashSale': totalCashSale,
    'paymentJson':
        jsonEncode(totalPaymentJson), // Convert the map back to a JSON string
  };

  // Use the named constructor with the map data
  ShiftRecord shift2 = ShiftRecord.getDocumentFromData(
    shiftData,
    FirebaseFirestore.instance
        .collection('SHIFT')
        .doc(), // Reference to the document
  );

  // Return the ShiftRecord with the calculated totalSale and paymentJson
  return shift2;
}
