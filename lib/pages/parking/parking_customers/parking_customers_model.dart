import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/payment_mode/payment_mode_widget.dart';
import '/components/qrparking/qrparking_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'parking_customers_widget.dart' show ParkingCustomersWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ParkingCustomersModel extends FlutterFlowModel<ParkingCustomersWidget> {
  ///  Local state fields for this page.

  List<InvoiceRecord> listcars = [];
  void addToListcars(InvoiceRecord item) => listcars.add(item);
  void removeFromListcars(InvoiceRecord item) => listcars.remove(item);
  void removeAtIndexFromListcars(int index) => listcars.removeAt(index);
  void insertAtIndexInListcars(int index, InvoiceRecord item) =>
      listcars.insert(index, item);
  void updateListcarsAtIndex(int index, Function(InvoiceRecord) updateFn) =>
      listcars[index] = updateFn(listcars[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in ParkingCustomers widget.
  List<InvoiceRecord>? listcars2;
  // Stores action output result for [Custom Action - scanPrinter] action in ParkingCustomers widget.
  bool? resDevice2Copy;
  // Stores action output result for [Custom Action - connectDevice] action in ParkingCustomers widget.
  bool? connectdeviceCOPY23;
  // Stores action output result for [Custom Action - scanPrinter] action in ParkingCustomers widget.
  bool? resDevice2Copy2;
  // Stores action output result for [Custom Action - connectDevice] action in ParkingCustomers widget.
  bool? connectdeviceCOPY232;
  var qrResult = '';
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  InvoiceRecord? getinvout;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in TextField widget.
  List<InvoiceRecord>? search;
  // Stores action output result for [Firestore Query - Query a collection] action in TextField widget.
  List<InvoiceRecord>? search2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  InvoiceRecord? docinv;
  // Stores action output result for [Custom Action - scanPrinter] action in Button widget.
  bool? resDevice2;
  // Stores action output result for [Custom Action - connectDevice] action in Button widget.
  bool? connectdevice;
  // Stores action output result for [Custom Action - selectBillPrint] action in Button widget.
  List<dynamic>? returnedList2kiosk;
  // Stores action output result for [Custom Action - newCustomAction] action in Button widget.
  List<dynamic>? device;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  OutletRecord? outletdoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
