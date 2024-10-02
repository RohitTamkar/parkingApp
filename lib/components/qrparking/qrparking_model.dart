import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
