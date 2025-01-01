import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'set_header_footer_widget.dart' show SetHeaderFooterWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SetHeaderFooterModel extends FlutterFlowModel<SetHeaderFooterWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TextFieldTitle widget.
  FocusNode? textFieldTitleFocusNode;
  TextEditingController? textFieldTitleTextController;
  String? Function(BuildContext, String?)?
      textFieldTitleTextControllerValidator;
  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  // State field(s) for subtitle widget.
  FocusNode? subtitleFocusNode;
  TextEditingController? subtitleTextController;
  String? Function(BuildContext, String?)? subtitleTextControllerValidator;
  // State field(s) for GSTNumber widget.
  FocusNode? gSTNumberFocusNode;
  TextEditingController? gSTNumberTextController;
  String? Function(BuildContext, String?)? gSTNumberTextControllerValidator;
  // State field(s) for Contactno widget.
  FocusNode? contactnoFocusNode;
  TextEditingController? contactnoTextController;
  String? Function(BuildContext, String?)? contactnoTextControllerValidator;
  // State field(s) for emailID widget.
  FocusNode? emailIDFocusNode;
  TextEditingController? emailIDTextController;
  String? Function(BuildContext, String?)? emailIDTextControllerValidator;
  // State field(s) for Serialno widget.
  FocusNode? serialnoFocusNode;
  TextEditingController? serialnoTextController;
  String? Function(BuildContext, String?)? serialnoTextControllerValidator;
  // State field(s) for taxInovice widget.
  FocusNode? taxInoviceFocusNode;
  TextEditingController? taxInoviceTextController;
  String? Function(BuildContext, String?)? taxInoviceTextControllerValidator;
  // State field(s) for bankname widget.
  FocusNode? banknameFocusNode;
  TextEditingController? banknameTextController;
  String? Function(BuildContext, String?)? banknameTextControllerValidator;
  // State field(s) for branchName widget.
  FocusNode? branchNameFocusNode;
  TextEditingController? branchNameTextController;
  String? Function(BuildContext, String?)? branchNameTextControllerValidator;
  // State field(s) for ifsccode widget.
  FocusNode? ifsccodeFocusNode;
  TextEditingController? ifsccodeTextController;
  String? Function(BuildContext, String?)? ifsccodeTextControllerValidator;
  // State field(s) for AccNo widget.
  FocusNode? accNoFocusNode;
  TextEditingController? accNoTextController;
  String? Function(BuildContext, String?)? accNoTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  HeaderRecord? headerDocu;
  // State field(s) for fotterText1 widget.
  FocusNode? fotterText1FocusNode;
  TextEditingController? fotterText1TextController;
  String? Function(BuildContext, String?)? fotterText1TextControllerValidator;
  // State field(s) for fotterText2 widget.
  FocusNode? fotterText2FocusNode;
  TextEditingController? fotterText2TextController;
  String? Function(BuildContext, String?)? fotterText2TextControllerValidator;
  // State field(s) for fotterText3 widget.
  FocusNode? fotterText3FocusNode;
  TextEditingController? fotterText3TextController;
  String? Function(BuildContext, String?)? fotterText3TextControllerValidator;
  // State field(s) for fotterText4 widget.
  FocusNode? fotterText4FocusNode;
  TextEditingController? fotterText4TextController;
  String? Function(BuildContext, String?)? fotterText4TextControllerValidator;
  // State field(s) for fotterText5 widget.
  FocusNode? fotterText5FocusNode1;
  TextEditingController? fotterText5TextController1;
  String? Function(BuildContext, String?)? fotterText5TextController1Validator;
  // State field(s) for fotterText5 widget.
  FocusNode? fotterText5FocusNode2;
  TextEditingController? fotterText5TextController2;
  String? Function(BuildContext, String?)? fotterText5TextController2Validator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FooterRecord? footerDocuCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in Tab widget.
  HeaderRecord? hederPreviewDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Tab widget.
  FooterRecord? footerPreviewDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    textFieldTitleFocusNode?.dispose();
    textFieldTitleTextController?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();

    subtitleFocusNode?.dispose();
    subtitleTextController?.dispose();

    gSTNumberFocusNode?.dispose();
    gSTNumberTextController?.dispose();

    contactnoFocusNode?.dispose();
    contactnoTextController?.dispose();

    emailIDFocusNode?.dispose();
    emailIDTextController?.dispose();

    serialnoFocusNode?.dispose();
    serialnoTextController?.dispose();

    taxInoviceFocusNode?.dispose();
    taxInoviceTextController?.dispose();

    banknameFocusNode?.dispose();
    banknameTextController?.dispose();

    branchNameFocusNode?.dispose();
    branchNameTextController?.dispose();

    ifsccodeFocusNode?.dispose();
    ifsccodeTextController?.dispose();

    accNoFocusNode?.dispose();
    accNoTextController?.dispose();

    fotterText1FocusNode?.dispose();
    fotterText1TextController?.dispose();

    fotterText2FocusNode?.dispose();
    fotterText2TextController?.dispose();

    fotterText3FocusNode?.dispose();
    fotterText3TextController?.dispose();

    fotterText4FocusNode?.dispose();
    fotterText4TextController?.dispose();

    fotterText5FocusNode1?.dispose();
    fotterText5TextController1?.dispose();

    fotterText5FocusNode2?.dispose();
    fotterText5TextController2?.dispose();
  }
}
