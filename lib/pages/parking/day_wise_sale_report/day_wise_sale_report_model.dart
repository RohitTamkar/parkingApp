import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/selection_option2_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/parking/email_input/email_input_widget.dart';
import '/pages/parking/list_view_msg/list_view_msg_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'day_wise_sale_report_widget.dart' show DayWiseSaleReportWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DayWiseSaleReportModel extends FlutterFlowModel<DayWiseSaleReportWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - genExcelForShiftReport] action in IconButton widget.
  String? base64Link222;
  // Stores action output result for [Backend Call - API (sendMail)] action in IconButton widget.
  ApiCallResponse? apiResult6yc22;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
