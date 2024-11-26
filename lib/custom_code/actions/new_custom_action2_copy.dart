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

Future<List<VehicleBillStruct>> newCustomAction2Copy(dynamic list) async {
  // Add your function code here!

  List<dynamic> itemList = [];
  itemList = list;
  List<VehicleBillStruct> returnList = [];
  VehicleBillStruct struct = VehicleBillStruct();

  for (int j = 0; j < itemList.length; j++) {
    struct = createVehicleBillStruct(
        vehicleNo: itemList[j]["vehicleName"],
        vehicleType: itemList[j]["vehicleType"],
        billAmt: itemList[j]["billAmt"],
        finalBillAmt: itemList[j]["finalBillAmt"],
        count: itemList[j]["count"]);

    returnList.add(struct);
    print(returnList);
  }
  return returnList;
}