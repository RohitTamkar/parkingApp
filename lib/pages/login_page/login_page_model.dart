import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/power_off/power_off_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'login_page_widget.dart' show LoginPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class LoginPageModel extends FlutterFlowModel<LoginPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkPlatform] action in LoginPage widget.
  String? platform;
  // Stores action output result for [Custom Action - getPlatformDetails] action in LoginPage widget.
  dynamic? docRes;
  // Stores action output result for [Custom Action - deviceExists] action in LoginPage widget.
  bool? result1;
  // Stores action output result for [Custom Action - createDevice] action in LoginPage widget.
  DocumentReference? ref;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Custom Action - setQuickPin] action in Button widget.
  String? one;
  // Stores action output result for [Custom Action - setQuickPin] action in Button widget.
  String? four;
  // Stores action output result for [Custom Action - setQuickPin] action in Button widget.
  String? seven;
  // Stores action output result for [Custom Action - setQuickPin] action in Button widget.
  String? two;
  // Stores action output result for [Custom Action - setQuickPin] action in Button widget.
  String? five;
  // Stores action output result for [Custom Action - setQuickPin] action in Button widget.
  String? eight;
  // Stores action output result for [Custom Action - setQuickPin] action in Button widget.
  String? zero;
  // Stores action output result for [Custom Action - setQuickPin] action in Button widget.
  String? three;
  // Stores action output result for [Custom Action - setQuickPin] action in Button widget.
  String? six;
  // Stores action output result for [Custom Action - setQuickPin] action in Button widget.
  String? nine;
  // Stores action output result for [Custom Action - validateUserProfile] action in Button widget.
  DocumentReference? docUser;
  // Stores action output result for [Custom Action - shiftExists] action in Button widget.
  dynamic? shiftJson;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // Stores action output result for [Custom Action - setQuickPin] action in Button widget.
  String? one1;
  // Stores action output result for [Custom Action - setQuickPin] action in Button widget.
  String? four1;
  // Stores action output result for [Custom Action - setQuickPin] action in Button widget.
  String? seven1;
  // Stores action output result for [Custom Action - setQuickPin] action in Button widget.
  String? two1;
  // Stores action output result for [Custom Action - setQuickPin] action in Button widget.
  String? five1;
  // Stores action output result for [Custom Action - setQuickPin] action in Button widget.
  String? eight1;
  // Stores action output result for [Custom Action - setQuickPin] action in Button widget.
  String? zero1;
  // Stores action output result for [Custom Action - setQuickPin] action in Button widget.
  String? three1;
  // Stores action output result for [Custom Action - setQuickPin] action in Button widget.
  String? six1;
  // Stores action output result for [Custom Action - setQuickPin] action in Button widget.
  String? nine1;
  // Stores action output result for [Custom Action - validateUserCopy] action in Button widget.
  bool? docUserCopy;
  // Stores action output result for [Custom Action - shiftExists] action in Button widget.
  dynamic? shiftJsonCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();
  }
}
