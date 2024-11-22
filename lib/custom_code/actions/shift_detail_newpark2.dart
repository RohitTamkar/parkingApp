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

Future<dynamic> shiftDetailNewpark2(ShiftRecord? shiftlist) async {
  List<dynamic> docRecord = [];
  bool flag = false;
  int shiftCount = 0;

  print(shiftlist);
  if (shiftlist?.endTime == 0) {
    // Check if the startTime is in a new day
    DateTime currentDateTime = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    String currentDate = formatter.format(currentDateTime);
    DateTime shiftStartTime =
        DateTime.fromMillisecondsSinceEpoch(shiftlist!.startTime);
    String shiftDate = formatter.format(shiftStartTime);

    // Same day, the shift is resumed
    // Same day, the shift is resumed
    flag = true;
    docRecord.add({
      "ref": shiftlist.id,
      "shiftId": shiftlist.shiftId,
      "dayId": shiftlist.dayId,
      "billCount": shiftlist.billCount,
      "msg": "Shift resumed",
      "shiftExists": true,
      "totalSale": shiftlist.totalSale,
      "lastBillNo": shiftlist.lastBillNo,
      "deliveryCharges": shiftlist.deliveryCharges,
      "discount": shiftlist.discount,
      "tax": shiftlist.tax,
      "shiftCount": ++shiftCount,
      "endTime": shiftlist.endTime,
      "startTime": shiftlist.startTime,
      "startTimeFormat": shiftlist.startTime, //"dd-mmm-yyyy  h:MM:ss"),
      "lastBillTime": shiftlist.lastBillTime,
      "openingAmt": shiftlist.openingAmt,
      "cashSale": shiftlist.cashSale,
      "paymentJson": shiftlist.paymentJson
    });
  } else {
    // The shift has ended, so start a new shift
    shiftCount++;
    print('shcount$shiftCount');
  }

  if (flag == false && shiftlist?.id == null) {
    shiftCount++;
    print('shcountne$shiftCount');
    docRecord.add({
      "msg": "Start new Shift for today",
      "shiftExists": false,
      "shiftCount": shiftCount,
      "startTimeFormat": "0"
    });
  }
  if (docRecord.isEmpty) {
    docRecord.add({
      "msg": "Shift not Started",
      "shiftExists": false,
      "shiftCount": 1,
      "startTimeFormat": "0"
    });
  }
  print(docRecord[0]);
  return docRecord[0];
}
