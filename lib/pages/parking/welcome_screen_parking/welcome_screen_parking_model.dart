import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/parking/opening_bal_new_car/opening_bal_new_car_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'welcome_screen_parking_widget.dart' show WelcomeScreenParkingWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WelcomeScreenParkingModel
    extends FlutterFlowModel<WelcomeScreenParkingWidget> {
  ///  Local state fields for this page.

  DeviceRecord? deviceDoc;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getPlatformDetails] action in welcomeScreenParking widget.
  dynamic? docRes;
  // Stores action output result for [Custom Action - checkPlatform] action in welcomeScreenParking widget.
  String? platform;
  // Stores action output result for [Firestore Query - Query a collection] action in welcomeScreenParking widget.
  DeviceRecord? deiviceexistnew;
  // Stores action output result for [Firestore Query - Query a collection] action in welcomeScreenParking widget.
  InvoiceRecord? invcode;
  // Stores action output result for [Firestore Query - Query a collection] action in welcomeScreenParking widget.
  OutletRecord? outletDetail6;
  // Stores action output result for [Backend Call - Create Document] action in welcomeScreenParking widget.
  DeviceRecord? refnew;
  // Stores action output result for [Firestore Query - Query a collection] action in welcomeScreenParking widget.
  DeviceRecord? deviceexist;
  // Stores action output result for [Firestore Query - Query a collection] action in welcomeScreenParking widget.
  UserProfileRecord? userProfile;
  // Stores action output result for [Firestore Query - Query a collection] action in welcomeScreenParking widget.
  List<ShiftRecord>? shiftdetailfirebase;
  // Stores action output result for [Firestore Query - Query a collection] action in welcomeScreenParking widget.
  OutletRecord? outletdetails23;
  // Stores action output result for [Firestore Query - Query a collection] action in welcomeScreenParking widget.
  AppSettingsRecord? isAppSetExistsNew;
  // Stores action output result for [Firestore Query - Query a collection] action in welcomeScreenParking widget.
  List<AppSettingsMasterRecord>? masterAppsetting;
  // Stores action output result for [Custom Action - returnAppsetting] action in welcomeScreenParking widget.
  List<AppSettingsStruct>? returnAppsettiingupdate;
  // Stores action output result for [Custom Action - returnAppsetting] action in welcomeScreenParking widget.
  List<AppSettingsStruct>? returnAppsettiing;
  // Stores action output result for [Backend Call - Create Document] action in welcomeScreenParking widget.
  AppSettingsRecord? doc;
  // Stores action output result for [Firestore Query - Query a collection] action in welcomeScreenParking widget.
  AppSettingsRecord? devicew;
  // Stores action output result for [Custom Action - shiftDetailNewparkMultishift] action in welcomeScreenParking widget.
  dynamic? shiftDetailsNewcar;
  // Stores action output result for [Custom Action - shiftDetailNewpark] action in welcomeScreenParking widget.
  dynamic? shiftDetailsNewcar2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
