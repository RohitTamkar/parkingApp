import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'vehicle_wise_sale2_widget.dart' show VehicleWiseSale2Widget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VehicleWiseSale2Model extends FlutterFlowModel<VehicleWiseSale2Widget> {
  ///  State fields for stateful widgets in this page.

  DateTime? datePicked1;
  DateTime? datePicked2;
  // Stores action output result for [Custom Action - returnDateNextday] action in Row widget.
  DateTime? datenext;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Custom Action - scanPrinter] action in IconButton widget.
  bool? resDevice2;
  // Stores action output result for [Custom Action - connectDevice] action in IconButton widget.
  bool? printer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
