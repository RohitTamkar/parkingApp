import '/backend/api_requests/api_calls.dart';
import '/components/catg/catg_widget.dart';
import '/components/header/header_widget.dart';
import '/components/selection_option/selection_option_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'category_report_widget.dart' show CategoryReportWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoryReportModel extends FlutterFlowModel<CategoryReportWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkInternetConnection] action in CategoryReport widget.
  bool? netConn;
  // Stores action output result for [Custom Action - productSaleReport] action in CategoryReport widget.
  List<dynamic>? saleReport;
  // Model for Header component.
  late HeaderModel headerModel;
  // Models for catg dynamic component.
  late FlutterFlowDynamicModels<CatgModel> catgModels;
  // Stores action output result for [Custom Action - scanPrinter] action in FloatingActionButton widget.
  bool? resDevice;
  // Stores action output result for [Custom Action - scanPrinter] action in FloatingActionButton widget.
  bool? rd;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    catgModels = FlutterFlowDynamicModels(() => CatgModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    catgModels.dispose();
  }
}
