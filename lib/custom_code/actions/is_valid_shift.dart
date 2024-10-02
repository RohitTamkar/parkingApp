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

Future<bool> isValidShift(
  String outletid,
  String dayId,
) async {
  QuerySnapshot querySnapshot;
  querySnapshot = await FirebaseFirestore.instance
      .collection('OUTLET')
      .doc(outletid)
      .collection('SHIFT')
      .where('dayId', isEqualTo: dayId)
      .get()
      .then((value) => value);

  // Add your function code here!
  if (querySnapshot.size == 0) {
    return false;
  } else {
    print("shift exists");
    return true;
  }
}
