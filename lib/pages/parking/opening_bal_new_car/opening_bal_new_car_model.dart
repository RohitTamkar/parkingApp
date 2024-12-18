import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'opening_bal_new_car_widget.dart' show OpeningBalNewCarWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OpeningBalNewCarModel extends FlutterFlowModel<OpeningBalNewCarWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  AppSettingsRecord? isAppSetExistsNew;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<TaxMasterRecord>? taxcollection;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<AppSettingsMasterRecord>? masterAppsetting;
  // Stores action output result for [Custom Action - returnAppsetting] action in Button widget.
  List<AppSettingsStruct>? returnAppsettiing;
  // Stores action output result for [Custom Action - returnAppsetting] action in Button widget.
  List<AppSettingsStruct>? returnAppsettiingupdate;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  AppSettingsRecord? doc;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  AppSettingsRecord? devicew;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ShiftRecord? shiftDoc1;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ShiftRecord>? shiftList;
  // Stores action output result for [Custom Action - shiftDetailNewparkMultishift] action in Button widget.
  dynamic? newShift;
  // Stores action output result for [Custom Action - shiftDetailNewpark] action in Button widget.
  dynamic? newShift2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ShiftRecord>? shiftresumed;
  // Stores action output result for [Custom Action - shiftDetailNewparkMultishift] action in Button widget.
  dynamic? shiftdetailds23;
  // Stores action output result for [Custom Action - shiftDetailNewpark] action in Button widget.
  dynamic? shiftdetailds232;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
