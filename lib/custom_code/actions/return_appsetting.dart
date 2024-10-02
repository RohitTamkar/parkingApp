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

// Imports other custom actions

Future<List<AppSettingsStruct>> returnAppsetting(
  List<AppSettingsMasterRecord> appSettingMaster,
  List<AppSettingsStruct> appSettinglist,
) async {
  // Add your function code here!

  for (var masterRecord in appSettingMaster) {
    // Check if the record already exists in appSettinglist
    bool exists = appSettinglist.any((item) =>
        item.title == masterRecord.title &&
        item.display == masterRecord.display &&
        item.isDeleted == masterRecord.isDeleted);

    // If it doesn't exist, add it to the list with default value false
    if (!exists) {
      appSettinglist.add(AppSettingsStruct(
          title: masterRecord.title,
          display: masterRecord.display,
          value: false,
          isDeleted: masterRecord.isDeleted));
    }
  }

  return appSettinglist;
}
