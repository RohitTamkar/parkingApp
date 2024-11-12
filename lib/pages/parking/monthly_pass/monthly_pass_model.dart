import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/parking/email_input/email_input_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'monthly_pass_widget.dart' show MonthlyPassWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MonthlyPassModel extends FlutterFlowModel<MonthlyPassWidget> {
  ///  Local state fields for this page.

  String selectedPaymentType = 'Cash';

  PartyRecord? selectedParty;

  String selectedMessage = 'pass';

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for payment widget.
  String? paymentValue;
  FormFieldController<String>? paymentValueController;
  // State field(s) for pass widget.
  String? passValue;
  FormFieldController<String>? passValueController;
  // State field(s) for TextFieldAmt widget.
  FocusNode? textFieldAmtFocusNode;
  TextEditingController? textFieldAmtTextController;
  String? Function(BuildContext, String?)? textFieldAmtTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  MonthlyPassRecord? passDoc;
  // Stores action output result for [Custom Action - scanPrinter] action in Button widget.
  bool? resDevice3;
  // Stores action output result for [Custom Action - newCustomAction] action in Button widget.
  List<dynamic>? device3;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  OutletRecord? outletdoc2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  MonthlyPassRecord? passDocCopyCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  PartyRecord? partydetails2Copy;
  // Stores action output result for [Custom Action - generateParkingPassPdf] action in Button widget.
  String? base64Link2Copy;
  // Stores action output result for [Backend Call - API (sendMail)] action in Button widget.
  ApiCallResponse? apiResult6yc22Copy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldAmtFocusNode?.dispose();
    textFieldAmtTextController?.dispose();
  }
}
