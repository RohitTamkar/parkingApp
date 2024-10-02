import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'shift_end_new2_widget.dart' show ShiftEndNew2Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ShiftEndNew2Model extends FlutterFlowModel<ShiftEndNew2Widget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - hiveShiftCrud] action in ShiftEndNew2 widget.
  ShiftDetailsStruct? shiftDatalocalnew;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - scanPrinter] action in Container widget.
  bool? rd;
  // Stores action output result for [Custom Action - connectDevice] action in Container widget.
  bool? xxx;
  // Stores action output result for [Custom Action - hiveShiftCrud] action in ShiftEnd widget.
  ShiftDetailsStruct? returnShiftdata;
  // Stores action output result for [Custom Action - hiveShiftCrud] action in ShiftEnd widget.
  ShiftDetailsStruct? shiftadded;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
