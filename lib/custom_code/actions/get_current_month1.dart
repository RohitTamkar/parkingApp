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

Future<int> getCurrentMonth1(String index) async {
  // Add your function code here!

  // Add your function code here!
  DateTime currentDate = DateTime.now();
  DateTime firstDay, lastDay;

  firstDay = DateTime.utc(currentDate.year, currentDate.month, 1);
  lastDay = DateTime.utc(
    currentDate.year,
    currentDate.month + 1,
  ).subtract(Duration(days: 1));

  int firstDayInMili = firstDay.millisecondsSinceEpoch;
  int lastDayInMili = lastDay.millisecondsSinceEpoch;
  print("first" + firstDayInMili.toString());
  print("last" + lastDayInMili.toString());

  if (index == "start") {
    return firstDayInMili;
  } else {
    return lastDayInMili;
  }
}
