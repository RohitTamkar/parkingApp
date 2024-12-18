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

Future<ShiftRecord> shiftTotalSale(List<ShiftRecord> shiftList) async {
  // Define totalSale for today
  double totalSaleForToday = 0;

  // Get today's date in 'yyyy-MM-dd' format
  String todayId = DateFormat('yyyy-MM-dd').format(DateTime.now());

  // Filter shifts for the current day and sum their totalSale
  for (var shift in shiftList) {
    if (shift.dayId == todayId) {
      totalSaleForToday += shift.totalSale;
    }
  }

  // Return a new ShiftRecord with today's total sale
  return ShiftRecord(dayId: todayId, totalSale: totalSaleForToday);
}
