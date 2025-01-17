import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'business_profile_adminfinal_widget.dart'
    show BusinessProfileAdminfinalWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BusinessProfileAdminfinalModel
    extends FlutterFlowModel<BusinessProfileAdminfinalWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in businessProfileAdminfinal widget.
  UserProfileRecord? userDetails;
  // Stores action output result for [Firestore Query - Query a collection] action in businessProfileAdminfinal widget.
  List<OutletRecord>? output;
  // Stores action output result for [Custom Action - getPlatformDetails] action in Container widget.
  dynamic? devicenew;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  DeviceRecord? devicedetails2;
  // Stores action output result for [Custom Action - getPlatformDetails] action in AddOutletButton widget.
  dynamic? docRes;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
