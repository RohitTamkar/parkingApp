import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'payment_screen_widget.dart' show PaymentScreenWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class PaymentScreenModel extends FlutterFlowModel<PaymentScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for TextFielExpNote widget.
  FocusNode? textFielExpNoteFocusNode;
  TextEditingController? textFielExpNoteTextController;
  String? Function(BuildContext, String?)?
      textFielExpNoteTextControllerValidator;
  // State field(s) for TextFieldExpAmt widget.
  FocusNode? textFieldExpAmtFocusNode;
  TextEditingController? textFieldExpAmtTextController;
  String? Function(BuildContext, String?)?
      textFieldExpAmtTextControllerValidator;
  // State field(s) for DropDownExp widget.
  String? dropDownExpValue;
  FormFieldController<String>? dropDownExpValueController;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for TextFieldNoteAdv widget.
  FocusNode? textFieldNoteAdvFocusNode;
  TextEditingController? textFieldNoteAdvTextController;
  String? Function(BuildContext, String?)?
      textFieldNoteAdvTextControllerValidator;
  // State field(s) for TextFieldExpAmtAdv widget.
  FocusNode? textFieldExpAmtAdvFocusNode;
  TextEditingController? textFieldExpAmtAdvTextController;
  String? Function(BuildContext, String?)?
      textFieldExpAmtAdvTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // State field(s) for TextFieldNoteCustCred widget.
  FocusNode? textFieldNoteCustCredFocusNode;
  TextEditingController? textFieldNoteCustCredTextController;
  String? Function(BuildContext, String?)?
      textFieldNoteCustCredTextControllerValidator;
  // State field(s) for TextFieldCustCredAmt widget.
  FocusNode? textFieldCustCredAmtFocusNode;
  TextEditingController? textFieldCustCredAmtTextController;
  String? Function(BuildContext, String?)?
      textFieldCustCredAmtTextControllerValidator;
  // State field(s) for DropDownCustCred widget.
  String? dropDownCustCredValue;
  FormFieldController<String>? dropDownCustCredValueController;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PaymentRecord? paymentDoc2;
  // Stores action output result for [Custom Action - scanPrinter] action in Button widget.
  bool? resDevice2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PaymentRecord? paymentDoc3;
  // Stores action output result for [Custom Action - connectDevice] action in Button widget.
  bool? isconnected;
  // Stores action output result for [Custom Action - newCustomAction] action in Button widget.
  List<dynamic>? device;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  PartyRecord? custmer;
  // State field(s) for TextFieldNoteReceiveAmt widget.
  FocusNode? textFieldNoteReceiveAmtFocusNode;
  TextEditingController? textFieldNoteReceiveAmtTextController;
  String? Function(BuildContext, String?)?
      textFieldNoteReceiveAmtTextControllerValidator;
  // State field(s) for TextFieldReceiveAmtAmt widget.
  FocusNode? textFieldReceiveAmtAmtFocusNode;
  TextEditingController? textFieldReceiveAmtAmtTextController;
  String? Function(BuildContext, String?)?
      textFieldReceiveAmtAmtTextControllerValidator;
  // State field(s) for DropDownReceivedAmt widget.
  String? dropDownReceivedAmtValue;
  FormFieldController<String>? dropDownReceivedAmtValueController;
  // State field(s) for TextFieldsearch widget.
  FocusNode? textFieldsearchFocusNode;
  TextEditingController? textFieldsearchTextController;
  String? Function(BuildContext, String?)?
      textFieldsearchTextControllerValidator;
  List<PartyRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    tabBarController?.dispose();
    textFielExpNoteFocusNode?.dispose();
    textFielExpNoteTextController?.dispose();

    textFieldExpAmtFocusNode?.dispose();
    textFieldExpAmtTextController?.dispose();

    textFieldNoteAdvFocusNode?.dispose();
    textFieldNoteAdvTextController?.dispose();

    textFieldExpAmtAdvFocusNode?.dispose();
    textFieldExpAmtAdvTextController?.dispose();

    textFieldNoteCustCredFocusNode?.dispose();
    textFieldNoteCustCredTextController?.dispose();

    textFieldCustCredAmtFocusNode?.dispose();
    textFieldCustCredAmtTextController?.dispose();

    textFieldNoteReceiveAmtFocusNode?.dispose();
    textFieldNoteReceiveAmtTextController?.dispose();

    textFieldReceiveAmtAmtFocusNode?.dispose();
    textFieldReceiveAmtAmtTextController?.dispose();

    textFieldsearchFocusNode?.dispose();
    textFieldsearchTextController?.dispose();
  }
}
