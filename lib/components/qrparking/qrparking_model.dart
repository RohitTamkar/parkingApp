import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/payment_mode/payment_mode_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'qrparking_widget.dart' show QrparkingWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QrparkingModel extends FlutterFlowModel<QrparkingWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for paymentMode component.
  late PaymentModeModel paymentModeModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  InvoiceRecord? docinvqr;
  // Stores action output result for [Custom Action - scanPrinter] action in Button widget.
  bool? resDevice2qr;
  // Stores action output result for [Custom Action - connectDevice] action in Button widget.
  bool? connectdeviceqr;
  // Stores action output result for [Custom Action - selectBillPrint] action in Button widget.
  List<dynamic>? returnedList2qr2;
  // Stores action output result for [Custom Action - newCustomAction] action in Button widget.
  List<dynamic>? deviceqr;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  OutletRecord? outletdocqr;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  InvoiceRecord? docinvqr2;
  // Stores action output result for [Custom Action - calShiftSummary2] action in Button widget.
  dynamic? shiftupdate2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ShiftRecord? shiftref;
  // Stores action output result for [Custom Action - scanPrinter] action in Button widget.
  bool? resDevice2qr2;
  // Stores action output result for [Custom Action - connectDevice] action in Button widget.
  bool? connectdeviceqr2;
  // Stores action output result for [Custom Action - selectBillPrint] action in Button widget.
  List<dynamic>? returnedList2qr22;
  // Stores action output result for [Custom Action - newCustomAction] action in Button widget.
  List<dynamic>? deviceqr2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  OutletRecord? outletdocqr2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  InvoiceRecord? savebill;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ShiftRecord>? shiftref23;
  // Stores action output result for [Custom Action - shiftDetailNewpark] action in Button widget.
  dynamic? shiftDetailsNewcar;
  // Stores action output result for [Custom Action - calShiftSummary2] action in Button widget.
  dynamic? shiftSummarRkiosk23;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ShiftRecord? shiftfierbase;
  // Stores action output result for [Custom Action - calShiftSummary2] action in Button widget.
  dynamic? shiftupdate;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ShiftRecord? shiftref2;

  @override
  void initState(BuildContext context) {
    paymentModeModel = createModel(context, () => PaymentModeModel());
  }

  @override
  void dispose() {
    paymentModeModel.dispose();
  }
}
