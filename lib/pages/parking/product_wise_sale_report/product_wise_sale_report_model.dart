import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/parking/email_input/email_input_widget.dart';
import '/pages/parking/list_view_msg/list_view_msg_widget.dart';
import '/pages/parking/today_yest_report/today_yest_report_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'product_wise_sale_report_widget.dart' show ProductWiseSaleReportWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductWiseSaleReportModel
    extends FlutterFlowModel<ProductWiseSaleReportWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - productSaleReport2] action in productWiseSaleReport widget.
  List<dynamic>? productList;
  // Stores action output result for [Custom Action - productSaleReport2] action in IconButton widget.
  List<dynamic>? res2;
  // Stores action output result for [Custom Action - genrateExcelForProductWiseSaleReport] action in IconButton widget.
  String? base64Link;
  // Stores action output result for [Backend Call - API (sendMail)] action in IconButton widget.
  ApiCallResponse? apiResult6yc;

  @override
  void initState(BuildContext context) {
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  @override
  void dispose() {}
}
