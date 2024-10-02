import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'printer_selection_screen_widget.dart' show PrinterSelectionScreenWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PrinterSelectionScreenModel
    extends FlutterFlowModel<PrinterSelectionScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  HeaderRecord? headerDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  FooterRecord? footerdoc2;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  FooterRecord? createddocfooter;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  HeaderRecord? docHeader;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  FooterRecord? createddocfooter2;
  // Stores action output result for [Custom Action - newCustomAction] action in IconButton widget.
  List<dynamic>? selected2;
  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Custom Action - scanPrinter] action in DropDown widget.
  bool? resultDevice2;
  // Stores action output result for [Custom Action - connectDevice] action in Container widget.
  bool? con;
  // Stores action output result for [Custom Action - newCustomAction] action in Container widget.
  List<dynamic>? selected;
  // State field(s) for TextFieldTitle widget.
  FocusNode? textFieldTitleFocusNode;
  TextEditingController? textFieldTitleTextController;
  String? Function(BuildContext, String?)?
      textFieldTitleTextControllerValidator;
  // State field(s) for TextFieldSubTitle widget.
  FocusNode? textFieldSubTitleFocusNode;
  TextEditingController? textFieldSubTitleTextController;
  String? Function(BuildContext, String?)?
      textFieldSubTitleTextControllerValidator;
  // State field(s) for TextFieldAddress widget.
  FocusNode? textFieldAddressFocusNode;
  TextEditingController? textFieldAddressTextController;
  String? Function(BuildContext, String?)?
      textFieldAddressTextControllerValidator;
  // State field(s) for TextFieldGst widget.
  FocusNode? textFieldGstFocusNode;
  TextEditingController? textFieldGstTextController;
  String? Function(BuildContext, String?)? textFieldGstTextControllerValidator;
  // State field(s) for TextFieldContact widget.
  FocusNode? textFieldContactFocusNode;
  TextEditingController? textFieldContactTextController;
  String? Function(BuildContext, String?)?
      textFieldContactTextControllerValidator;
  // State field(s) for TextFieldEmail widget.
  FocusNode? textFieldEmailFocusNode;
  TextEditingController? textFieldEmailTextController;
  String? Function(BuildContext, String?)?
      textFieldEmailTextControllerValidator;
  // State field(s) for TextFieldSerialNo widget.
  FocusNode? textFieldSerialNoFocusNode;
  TextEditingController? textFieldSerialNoTextController;
  String? Function(BuildContext, String?)?
      textFieldSerialNoTextControllerValidator;
  // State field(s) for TextFieldTax widget.
  FocusNode? textFieldTaxFocusNode;
  TextEditingController? textFieldTaxTextController;
  String? Function(BuildContext, String?)? textFieldTaxTextControllerValidator;
  // State field(s) for TextFieldBankName widget.
  FocusNode? textFieldBankNameFocusNode;
  TextEditingController? textFieldBankNameTextController;
  String? Function(BuildContext, String?)?
      textFieldBankNameTextControllerValidator;
  // State field(s) for TextFieldBankBranch widget.
  FocusNode? textFieldBankBranchFocusNode;
  TextEditingController? textFieldBankBranchTextController;
  String? Function(BuildContext, String?)?
      textFieldBankBranchTextControllerValidator;
  // State field(s) for TextFieldIfscCode widget.
  FocusNode? textFieldIfscCodeFocusNode;
  TextEditingController? textFieldIfscCodeTextController;
  String? Function(BuildContext, String?)?
      textFieldIfscCodeTextControllerValidator;
  // State field(s) for TextFieldACNo widget.
  FocusNode? textFieldACNoFocusNode;
  TextEditingController? textFieldACNoTextController;
  String? Function(BuildContext, String?)? textFieldACNoTextControllerValidator;
  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController1;
  List<String>? get checkboxGroupValues1 =>
      checkboxGroupValueController1?.value;
  set checkboxGroupValues1(List<String>? v) =>
      checkboxGroupValueController1?.value = v;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController15;
  String? Function(BuildContext, String?)? textController15Validator;
  // State field(s) for TextFieldFooter2 widget.
  FocusNode? textFieldFooter2FocusNode;
  TextEditingController? textFieldFooter2TextController;
  String? Function(BuildContext, String?)?
      textFieldFooter2TextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController17;
  String? Function(BuildContext, String?)? textController17Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController18;
  String? Function(BuildContext, String?)? textController18Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController19;
  String? Function(BuildContext, String?)? textController19Validator;
  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController2;
  List<String>? get checkboxGroupValues2 =>
      checkboxGroupValueController2?.value;
  set checkboxGroupValues2(List<String>? v) =>
      checkboxGroupValueController2?.value = v;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    tabBarController?.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldTitleFocusNode?.dispose();
    textFieldTitleTextController?.dispose();

    textFieldSubTitleFocusNode?.dispose();
    textFieldSubTitleTextController?.dispose();

    textFieldAddressFocusNode?.dispose();
    textFieldAddressTextController?.dispose();

    textFieldGstFocusNode?.dispose();
    textFieldGstTextController?.dispose();

    textFieldContactFocusNode?.dispose();
    textFieldContactTextController?.dispose();

    textFieldEmailFocusNode?.dispose();
    textFieldEmailTextController?.dispose();

    textFieldSerialNoFocusNode?.dispose();
    textFieldSerialNoTextController?.dispose();

    textFieldTaxFocusNode?.dispose();
    textFieldTaxTextController?.dispose();

    textFieldBankNameFocusNode?.dispose();
    textFieldBankNameTextController?.dispose();

    textFieldBankBranchFocusNode?.dispose();
    textFieldBankBranchTextController?.dispose();

    textFieldIfscCodeFocusNode?.dispose();
    textFieldIfscCodeTextController?.dispose();

    textFieldACNoFocusNode?.dispose();
    textFieldACNoTextController?.dispose();

    textFieldFocusNode3?.dispose();
    textController15?.dispose();

    textFieldFooter2FocusNode?.dispose();
    textFieldFooter2TextController?.dispose();

    textFieldFocusNode4?.dispose();
    textController17?.dispose();

    textFieldFocusNode5?.dispose();
    textController18?.dispose();

    textFieldFocusNode6?.dispose();
    textController19?.dispose();
  }
}
