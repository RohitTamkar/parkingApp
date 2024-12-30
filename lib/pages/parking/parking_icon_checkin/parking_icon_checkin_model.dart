import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'parking_icon_checkin_widget.dart' show ParkingIconCheckinWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ParkingIconCheckinModel
    extends FlutterFlowModel<ParkingIconCheckinWidget> {
  ///  Local state fields for this page.

  ProductRecord? vehicleType;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in TextField widget.
  InvoiceRecord? db;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  InvoiceRecord? countdatagetPRINT2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  InvoiceRecord? docInvoicecars2;
  // Stores action output result for [Custom Action - calShiftSummary] action in Button widget.
  dynamic? shiftSummarRkiosk21;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ShiftRecord? shiftref2;
  // Stores action output result for [Custom Action - scanPrinter] action in Button widget.
  bool? resDevice2;
  // Stores action output result for [Custom Action - selectBillPrint] action in Button widget.
  List<dynamic>? returnedList2kiosk;
  // Stores action output result for [Custom Action - newCustomAction] action in Button widget.
  List<dynamic>? device2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  OutletRecord? outletdoc2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  InvoiceRecord? countdataget2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  InvoiceRecord? docInvoicecars2Copy2;
  // Stores action output result for [Custom Action - calShiftSummary] action in Button widget.
  dynamic? shiftSummarRkiosk22new;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ShiftRecord? shiftref2Copy2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
