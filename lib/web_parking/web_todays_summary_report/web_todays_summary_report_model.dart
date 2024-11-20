import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web_parking/nav_bar_web_parking/nav_bar_web_parking_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'web_todays_summary_report_widget.dart'
    show WebTodaysSummaryReportWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WebTodaysSummaryReportModel
    extends FlutterFlowModel<WebTodaysSummaryReportWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBarWebParking component.
  late NavBarWebParkingModel navBarWebParkingModel;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // Stores action output result for [Custom Action - returnDateNextday] action in Row widget.
  DateTime? datenext;
  // Stores action output result for [Custom Action - scanPrinter] action in IconButton widget.
  bool? resDevice2;
  // Stores action output result for [Custom Action - connectDevice] action in IconButton widget.
  bool? printer;

  @override
  void initState(BuildContext context) {
    navBarWebParkingModel = createModel(context, () => NavBarWebParkingModel());
  }

  @override
  void dispose() {
    navBarWebParkingModel.dispose();
  }
}