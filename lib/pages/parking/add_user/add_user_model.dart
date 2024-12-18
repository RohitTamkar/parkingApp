import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_user_widget.dart' show AddUserWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddUserModel extends FlutterFlowModel<AddUserWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldName widget.
  FocusNode? textFieldNameFocusNode;
  TextEditingController? textFieldNameTextController;
  String? Function(BuildContext, String?)? textFieldNameTextControllerValidator;
  String? _textFieldNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'm0sk5tqi' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for TextFieldMobile widget.
  FocusNode? textFieldMobileFocusNode;
  TextEditingController? textFieldMobileTextController;
  String? Function(BuildContext, String?)?
      textFieldMobileTextControllerValidator;
  String? _textFieldMobileTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'gyg2r8l6' /* Field is required */,
      );
    }

    if (!RegExp('[0-9]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldTextController;
  String? Function(BuildContext, String?)?
      emailTextFieldTextControllerValidator;
  String? _emailTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '857tid6e' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for pwdlTextField widget.
  FocusNode? pwdlTextFieldFocusNode;
  TextEditingController? pwdlTextFieldTextController;
  late bool pwdlTextFieldVisibility;
  String? Function(BuildContext, String?)? pwdlTextFieldTextControllerValidator;
  // State field(s) for ConfirmpwdlTextField widget.
  FocusNode? confirmpwdlTextFieldFocusNode;
  TextEditingController? confirmpwdlTextFieldTextController;
  late bool confirmpwdlTextFieldVisibility;
  String? Function(BuildContext, String?)?
      confirmpwdlTextFieldTextControllerValidator;
  // State field(s) for PinnTextField widget.
  FocusNode? pinnTextFieldFocusNode;
  TextEditingController? pinnTextFieldTextController;
  late bool pinnTextFieldVisibility;
  String? Function(BuildContext, String?)? pinnTextFieldTextControllerValidator;
  String? _pinnTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'kszhfvbg' /* Field is required */,
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
    textFieldNameTextControllerValidator =
        _textFieldNameTextControllerValidator;
    textFieldMobileTextControllerValidator =
        _textFieldMobileTextControllerValidator;
    emailTextFieldTextControllerValidator =
        _emailTextFieldTextControllerValidator;
    pwdlTextFieldVisibility = false;
    confirmpwdlTextFieldVisibility = false;
    pinnTextFieldVisibility = false;
    pinnTextFieldTextControllerValidator =
        _pinnTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldNameFocusNode?.dispose();
    textFieldNameTextController?.dispose();

    textFieldMobileFocusNode?.dispose();
    textFieldMobileTextController?.dispose();

    emailTextFieldFocusNode?.dispose();
    emailTextFieldTextController?.dispose();

    pwdlTextFieldFocusNode?.dispose();
    pwdlTextFieldTextController?.dispose();

    confirmpwdlTextFieldFocusNode?.dispose();
    confirmpwdlTextFieldTextController?.dispose();

    pinnTextFieldFocusNode?.dispose();
    pinnTextFieldTextController?.dispose();
  }
}
