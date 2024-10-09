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
import 'package:auto_size_text/auto_size_text.dart';
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

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for payment widget.
  String? paymentValue;
  FormFieldController<String>? paymentValueController;
  // State field(s) for pass widget.
  String? passValue;
  FormFieldController<String>? passValueController;
  // State field(s) for TextFieldDuration widget.
  FocusNode? textFieldDurationFocusNode;
  TextEditingController? textFieldDurationTextController;
  String? Function(BuildContext, String?)?
      textFieldDurationTextControllerValidator;
  // State field(s) for TextFieldAmt widget.
  FocusNode? textFieldAmtFocusNode;
  TextEditingController? textFieldAmtTextController;
  String? Function(BuildContext, String?)? textFieldAmtTextControllerValidator;
  String? _textFieldAmtTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'c64ozu2v' /* Enter Amount  */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  MonthlyPassRecord? passDoc;
  // Stores action output result for [Custom Action - scanPrinter] action in Button widget.
  bool? resDevice3;
  // Stores action output result for [Custom Action - newCustomAction] action in Button widget.
  List<dynamic>? device3;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  OutletRecord? outletdoc2;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  MonthlyPassRecord? passDocCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  PartyRecord? partydetails2;
  // Stores action output result for [Custom Action - generateParkingPassPdf] action in IconButton widget.
  String? base64Link2;
  // Stores action output result for [Backend Call - API (sendMail)] action in IconButton widget.
  ApiCallResponse? apiResult6yc22;

  @override
  void initState(BuildContext context) {
    textFieldAmtTextControllerValidator = _textFieldAmtTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldDurationFocusNode?.dispose();
    textFieldDurationTextController?.dispose();

    textFieldAmtFocusNode?.dispose();
    textFieldAmtTextController?.dispose();
  }
}
