import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/parking/update_location_outlet/update_location_outlet_widget.dart';
import 'edit_outlet_page_widget.dart' show EditOutletPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditOutletPageModel extends FlutterFlowModel<EditOutletPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextFieldAddress widget.
  FocusNode? textFieldAddressFocusNode;
  TextEditingController? textFieldAddressTextController;
  String? Function(BuildContext, String?)?
      textFieldAddressTextControllerValidator;
  // State field(s) for TextFieldCity widget.
  FocusNode? textFieldCityFocusNode;
  TextEditingController? textFieldCityTextController;
  String? Function(BuildContext, String?)? textFieldCityTextControllerValidator;
  // State field(s) for TextFieldState widget.
  FocusNode? textFieldStateFocusNode;
  TextEditingController? textFieldStateTextController;
  String? Function(BuildContext, String?)?
      textFieldStateTextControllerValidator;
  // State field(s) for MErchantTextField widget.
  FocusNode? mErchantTextFieldFocusNode;
  TextEditingController? mErchantTextFieldTextController;
  String? Function(BuildContext, String?)?
      mErchantTextFieldTextControllerValidator;
  // State field(s) for merchKey widget.
  FocusNode? merchKeyFocusNode;
  TextEditingController? merchKeyTextController;
  String? Function(BuildContext, String?)? merchKeyTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<DeviceRecord>? devieList;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldAddressFocusNode?.dispose();
    textFieldAddressTextController?.dispose();

    textFieldCityFocusNode?.dispose();
    textFieldCityTextController?.dispose();

    textFieldStateFocusNode?.dispose();
    textFieldStateTextController?.dispose();

    mErchantTextFieldFocusNode?.dispose();
    mErchantTextFieldTextController?.dispose();

    merchKeyFocusNode?.dispose();
    merchKeyTextController?.dispose();
  }
}
