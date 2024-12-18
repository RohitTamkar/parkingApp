import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web_parking/nav_bar_web_parking/nav_bar_web_parking_widget.dart';
import 'dart:ui';
import 'web_add_user_widget.dart' show WebAddUserWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WebAddUserModel extends FlutterFlowModel<WebAddUserWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for NavBarWebParking component.
  late NavBarWebParkingModel navBarWebParkingModel;
  // State field(s) for TextFieldName1 widget.
  FocusNode? textFieldName1FocusNode;
  TextEditingController? textFieldName1TextController;
  String? Function(BuildContext, String?)?
      textFieldName1TextControllerValidator;
  String? _textFieldName1TextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '7h0uvosb' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for TextFieldMobile1 widget.
  FocusNode? textFieldMobile1FocusNode;
  TextEditingController? textFieldMobile1TextController;
  String? Function(BuildContext, String?)?
      textFieldMobile1TextControllerValidator;
  String? _textFieldMobile1TextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '53glnsu0' /* Field is required */,
      );
    }

    if (!RegExp('[0-9]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for EmailTextField1 widget.
  FocusNode? emailTextField1FocusNode;
  TextEditingController? emailTextField1TextController;
  String? Function(BuildContext, String?)?
      emailTextField1TextControllerValidator;
  String? _emailTextField1TextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'xrxbqrl3' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for pwdlTextField1 widget.
  FocusNode? pwdlTextField1FocusNode;
  TextEditingController? pwdlTextField1TextController;
  late bool pwdlTextField1Visibility;
  String? Function(BuildContext, String?)?
      pwdlTextField1TextControllerValidator;
  // State field(s) for ConfirmpwdlTextField1 widget.
  FocusNode? confirmpwdlTextField1FocusNode;
  TextEditingController? confirmpwdlTextField1TextController;
  late bool confirmpwdlTextField1Visibility;
  String? Function(BuildContext, String?)?
      confirmpwdlTextField1TextControllerValidator;
  // State field(s) for PinnTextField1 widget.
  FocusNode? pinnTextField1FocusNode;
  TextEditingController? pinnTextField1TextController;
  late bool pinnTextField1Visibility;
  String? Function(BuildContext, String?)?
      pinnTextField1TextControllerValidator;
  String? _pinnTextField1TextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'cttnmjp1' /* Field is required */,
      );
    }

    if (val.length < 4) {
      return 'Requires at least 4 characters.';
    }
    if (val.length > 4) {
      return 'Maximum 4 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('[0-9]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    navBarWebParkingModel = createModel(context, () => NavBarWebParkingModel());
    textFieldName1TextControllerValidator =
        _textFieldName1TextControllerValidator;
    textFieldMobile1TextControllerValidator =
        _textFieldMobile1TextControllerValidator;
    emailTextField1TextControllerValidator =
        _emailTextField1TextControllerValidator;
    pwdlTextField1Visibility = false;
    confirmpwdlTextField1Visibility = false;
    pinnTextField1Visibility = false;
    pinnTextField1TextControllerValidator =
        _pinnTextField1TextControllerValidator;
  }

  @override
  void dispose() {
    navBarWebParkingModel.dispose();
    textFieldName1FocusNode?.dispose();
    textFieldName1TextController?.dispose();

    textFieldMobile1FocusNode?.dispose();
    textFieldMobile1TextController?.dispose();

    emailTextField1FocusNode?.dispose();
    emailTextField1TextController?.dispose();

    pwdlTextField1FocusNode?.dispose();
    pwdlTextField1TextController?.dispose();

    confirmpwdlTextField1FocusNode?.dispose();
    confirmpwdlTextField1TextController?.dispose();

    pinnTextField1FocusNode?.dispose();
    pinnTextField1TextController?.dispose();
  }
}
