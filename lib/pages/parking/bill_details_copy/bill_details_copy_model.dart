import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/payment_mode/payment_mode_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'bill_details_copy_widget.dart' show BillDetailsCopyWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BillDetailsCopyModel extends FlutterFlowModel<BillDetailsCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Model for paymentMode component.
  late PaymentModeModel paymentModeModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Custom Action - newCustomAction2] action in Container widget.
  List<SelItemListStruct>? returnList;
  // Stores action output result for [Custom Action - shiftExists] action in Container widget.
  dynamic? shiftList;
  // Stores action output result for [Custom Action - updateShiftSummaryForEB] action in Container widget.
  dynamic? returnList1;

  @override
  void initState(BuildContext context) {
    paymentModeModel = createModel(context, () => PaymentModeModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    paymentModeModel.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
