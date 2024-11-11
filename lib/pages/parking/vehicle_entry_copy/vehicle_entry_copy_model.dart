import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/parking/password/password_widget.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'vehicle_entry_copy_widget.dart' show VehicleEntryCopyWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VehicleEntryCopyModel extends FlutterFlowModel<VehicleEntryCopyWidget> {
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

  // Stores action output result for [Firestore Query - Query a collection] action in VehicleEntryCopy widget.
  List<InvoiceRecord>? listcars3;
  // Stores action output result for [Custom Action - scanPrinter] action in VehicleEntryCopy widget.
  bool? resDevice2Copy;
  // Stores action output result for [Custom Action - connectDevice] action in VehicleEntryCopy widget.
  bool? connectdeviceCOPY23;
  // Stores action output result for [Custom Action - scanPrinter] action in VehicleEntryCopy widget.
  bool? resDevice2Copy2;
  // Stores action output result for [Custom Action - connectDevice] action in VehicleEntryCopy widget.
  bool? connectdeviceCOPY232;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  OutletRecord? outletDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
