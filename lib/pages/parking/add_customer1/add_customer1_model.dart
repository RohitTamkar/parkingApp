import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'add_customer1_widget.dart' show AddCustomer1Widget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddCustomer1Model extends FlutterFlowModel<AddCustomer1Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for TextBusinessName widget.
  FocusNode? textBusinessNameFocusNode;
  TextEditingController? textBusinessNameTextController;
  String? Function(BuildContext, String?)?
      textBusinessNameTextControllerValidator;
  // State field(s) for TextMobile widget.
  FocusNode? textMobileFocusNode;
  TextEditingController? textMobileTextController;
  String? Function(BuildContext, String?)? textMobileTextControllerValidator;
  // State field(s) for TextAlternateMobileNo widget.
  FocusNode? textAlternateMobileNoFocusNode;
  TextEditingController? textAlternateMobileNoTextController;
  String? Function(BuildContext, String?)?
      textAlternateMobileNoTextControllerValidator;
  // State field(s) for TextEmail widget.
  FocusNode? textEmailFocusNode;
  TextEditingController? textEmailTextController;
  String? Function(BuildContext, String?)? textEmailTextControllerValidator;
  // State field(s) for TextAddress widget.
  FocusNode? textAddressFocusNode;
  TextEditingController? textAddressTextController;
  String? Function(BuildContext, String?)? textAddressTextControllerValidator;
  // State field(s) for TextVehicleNo widget.
  FocusNode? textVehicleNoFocusNode1;
  TextEditingController? textVehicleNoTextController1;
  String? Function(BuildContext, String?)?
      textVehicleNoTextController1Validator;
  // State field(s) for TextVehicleNo widget.
  FocusNode? textVehicleNoFocusNode2;
  TextEditingController? textVehicleNoTextController2;
  String? Function(BuildContext, String?)?
      textVehicleNoTextController2Validator;
  // State field(s) for Text widget.
  FocusNode? textFocusNode;
  TextEditingController? textTextController;
  String? Function(BuildContext, String?)? textTextControllerValidator;
  // State field(s) for TextCreditLimit widget.
  FocusNode? textCreditLimitFocusNode;
  TextEditingController? textCreditLimitTextController;
  String? Function(BuildContext, String?)?
      textCreditLimitTextControllerValidator;
  // State field(s) for TextOldBalance widget.
  FocusNode? textOldBalanceFocusNode;
  TextEditingController? textOldBalanceTextController;
  String? Function(BuildContext, String?)?
      textOldBalanceTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PartyRecord? custDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textBusinessNameFocusNode?.dispose();
    textBusinessNameTextController?.dispose();

    textMobileFocusNode?.dispose();
    textMobileTextController?.dispose();

    textAlternateMobileNoFocusNode?.dispose();
    textAlternateMobileNoTextController?.dispose();

    textEmailFocusNode?.dispose();
    textEmailTextController?.dispose();

    textAddressFocusNode?.dispose();
    textAddressTextController?.dispose();

    textVehicleNoFocusNode1?.dispose();
    textVehicleNoTextController1?.dispose();

    textVehicleNoFocusNode2?.dispose();
    textVehicleNoTextController2?.dispose();

    textFocusNode?.dispose();
    textTextController?.dispose();

    textCreditLimitFocusNode?.dispose();
    textCreditLimitTextController?.dispose();

    textOldBalanceFocusNode?.dispose();
    textOldBalanceTextController?.dispose();
  }
}
