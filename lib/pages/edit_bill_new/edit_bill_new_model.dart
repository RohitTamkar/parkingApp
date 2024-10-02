import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/calender/calender_widget.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'edit_bill_new_widget.dart' show EditBillNewWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditBillNewModel extends FlutterFlowModel<EditBillNewWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - hiveGetInvoicestoday] action in EditBillNew widget.
  List<InvoiceStructStruct>? invoicebyday;
  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // Stores action output result for [Custom Action - scanPrinter] action in PrintEditBill widget.
  bool? resDevice2;
  // Stores action output result for [Custom Action - newCustomAction] action in PrintEditBill widget.
  List<dynamic>? device1;
  // Stores action output result for [Custom Action - reduceQuantityEB] action in EditMinus widget.
  List<dynamic>? res1;
  // Stores action output result for [Custom Action - calSubTotalCopy] action in Delete widget.
  double? zzz;
  // Stores action output result for [Custom Action - newCustomAction2] action in Save widget.
  List<SelItemListStruct>? returnListCopy;
  // Stores action output result for [Custom Action - shiftExists] action in Save widget.
  dynamic? shiftListCopy;
  // Stores action output result for [Custom Action - updateShiftSummaryForEB] action in Save widget.
  dynamic? returnList1Copy;
  // Stores action output result for [Custom Action - newCustomAction2] action in Save widget.
  List<SelItemListStruct>? returnListCopy2;
  // Stores action output result for [Custom Action - hiveInvoiceCrud] action in Save widget.
  InvoiceStructStruct? updated;
  // Stores action output result for [Custom Action - shiftIdtoInt] action in Save widget.
  int? shiftidtoInt;
  // Stores action output result for [Custom Action - hiveShiftCrud] action in Save widget.
  ShiftDetailsStruct? getOfflineShiftdetails;
  // Stores action output result for [Custom Action - updateShiftSummaryForEB] action in Save widget.
  dynamic? shiftsummaryresult;
  // Stores action output result for [Custom Action - hiveShiftCrud] action in Save widget.
  ShiftDetailsStruct? newupdated;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    expandableExpandableController.dispose();
  }
}
