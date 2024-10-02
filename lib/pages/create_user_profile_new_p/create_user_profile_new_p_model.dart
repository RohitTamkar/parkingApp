import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'create_user_profile_new_p_widget.dart' show CreateUserProfileNewPWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateUserProfileNewPModel
    extends FlutterFlowModel<CreateUserProfileNewPWidget> {
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
        'k52eiv5y' /* Field is required */,
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
        '8j9hmn6k' /* Field is required */,
      );
    }

    if (val.length < 13) {
      return 'Requires at least 13 characters.';
    }
    if (val.length > 13) {
      return 'Maximum 13 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('[0-9]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for TextFieldEmail widget.
  FocusNode? textFieldEmailFocusNode;
  TextEditingController? textFieldEmailTextController;
  String? Function(BuildContext, String?)?
      textFieldEmailTextControllerValidator;
  // State field(s) for pwdTextField widget.
  FocusNode? pwdTextFieldFocusNode;
  TextEditingController? pwdTextFieldTextController;
  late bool pwdTextFieldVisibility;
  String? Function(BuildContext, String?)? pwdTextFieldTextControllerValidator;
  String? _pwdTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'nvqk3ze7' /* Field is required */,
      );
    }

    if (!RegExp('').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'wwspczy4' /* [0-9] */,
      );
    }
    return null;
  }

  // State field(s) for PINTextField widget.
  FocusNode? pINTextFieldFocusNode;
  TextEditingController? pINTextFieldTextController;
  late bool pINTextFieldVisibility;
  String? Function(BuildContext, String?)? pINTextFieldTextControllerValidator;
  String? _pINTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'vp8v3hdo' /* Field is required */,
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

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UserProfileRecord? doc;

  @override
  void initState(BuildContext context) {
    textFieldNameTextControllerValidator =
        _textFieldNameTextControllerValidator;
    textFieldMobileTextControllerValidator =
        _textFieldMobileTextControllerValidator;
    pwdTextFieldVisibility = false;
    pwdTextFieldTextControllerValidator = _pwdTextFieldTextControllerValidator;
    pINTextFieldVisibility = false;
    pINTextFieldTextControllerValidator = _pINTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldNameFocusNode?.dispose();
    textFieldNameTextController?.dispose();

    textFieldMobileFocusNode?.dispose();
    textFieldMobileTextController?.dispose();

    textFieldEmailFocusNode?.dispose();
    textFieldEmailTextController?.dispose();

    pwdTextFieldFocusNode?.dispose();
    pwdTextFieldTextController?.dispose();

    pINTextFieldFocusNode?.dispose();
    pINTextFieldTextController?.dispose();
  }
}
