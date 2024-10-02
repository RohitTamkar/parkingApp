import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/opening_bal_new_car/opening_bal_new_car_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
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
import 'package:shake/shake.dart';

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
  // Stores action output result for [Backend Call - Create Document] action in welcomeScreenParking widget.
  DeviceRecord? refnew;
  // Stores action output result for [Firestore Query - Query a collection] action in welcomeScreenParking widget.
  UserProfileRecord? userProfile;
  // Stores action output result for [Firestore Query - Query a collection] action in welcomeScreenParking widget.
  List<ShiftRecord>? shiftdetailfirebase;
  // Stores action output result for [Custom Action - checkInternetConnection] action in welcomeScreenParking widget.
  bool? internetconnection;
  // Stores action output result for [Custom Action - shiftDetailNewpark] action in welcomeScreenParking widget.
  dynamic? shiftDetailsNewcar;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
