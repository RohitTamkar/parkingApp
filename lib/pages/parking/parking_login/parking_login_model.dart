import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'parking_login_widget.dart' show ParkingLoginWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class ParkingLoginModel extends FlutterFlowModel<ParkingLoginWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getPlatformDetails] action in ParkingLogin widget.
  dynamic? docRes;
  // Stores action output result for [Custom Action - checkPlatform] action in ParkingLogin widget.
  String? platform;
  // State field(s) for DropDownName widget.
  String? dropDownNameValue;
  FormFieldController<String>? dropDownNameValueController;
  // State field(s) for quickPin widget.
  FocusNode? quickPinFocusNode;
  TextEditingController? quickPinTextController;
  String? Function(BuildContext, String?)? quickPinTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UserProfileRecord? userProfile;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  OutletRecord? outletDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ShiftRecord>? shiftlist;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? internetconnection;
  // Stores action output result for [Custom Action - shiftDetailNewpark] action in Button widget.
  dynamic? shiftDetailsNew;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    quickPinFocusNode?.dispose();
    quickPinTextController?.dispose();
  }
}
