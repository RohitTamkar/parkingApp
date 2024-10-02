import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'welcome_screen_widget.dart' show WelcomeScreenWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WelcomeScreenModel extends FlutterFlowModel<WelcomeScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkPlatform] action in welcomeScreen widget.
  String? res;
  // Stores action output result for [Custom Action - getPlatformDetails] action in Button widget.
  dynamic? docRes;
  // Stores action output result for [Custom Action - deviceExists] action in Button widget.
  bool? result1;
  // Stores action output result for [Custom Action - createDevice] action in Button widget.
  DocumentReference? ref;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
