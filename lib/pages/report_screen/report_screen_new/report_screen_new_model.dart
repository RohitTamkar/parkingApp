import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
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
import 'report_screen_new_widget.dart' show ReportScreenNewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReportScreenNewModel extends FlutterFlowModel<ReportScreenNewWidget> {
  ///  Local state fields for this page.

  DocumentReference? bilinvref;

  DocumentReference? userdoc;

  dynamic shiftdetail;

  List<TaxMasterRecord> tax = [];
  void addToTax(TaxMasterRecord item) => tax.add(item);
  void removeFromTax(TaxMasterRecord item) => tax.remove(item);
  void removeAtIndexFromTax(int index) => tax.removeAt(index);
  void insertAtIndexInTax(int index, TaxMasterRecord item) =>
      tax.insert(index, item);
  void updateTaxAtIndex(int index, Function(TaxMasterRecord) updateFn) =>
      tax[index] = updateFn(tax[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in ReportScreenNew widget.
  List<TaxMasterRecord>? taxcollection;
  // Model for Header component.
  late HeaderModel headerModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
  }
}
