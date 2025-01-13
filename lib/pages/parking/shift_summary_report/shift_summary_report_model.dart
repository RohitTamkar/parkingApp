import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/parking/email_input/email_input_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'shift_summary_report_widget.dart' show ShiftSummaryReportWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ShiftSummaryReportModel
    extends FlutterFlowModel<ShiftSummaryReportWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - genExcelForShiftSummaryReport] action in IconButton widget.
  String? base64Link2;
  // Stores action output result for [Backend Call - API (sendMail)] action in IconButton widget.
  ApiCallResponse? apiResult6yc2;
  // Stores action output result for [Custom Action - scanPrinter] action in IconButton widget.
  bool? resDevice2;
  // Stores action output result for [Custom Action - connectDevice] action in IconButton widget.
  bool? printer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
