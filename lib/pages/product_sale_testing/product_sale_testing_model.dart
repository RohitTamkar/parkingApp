import '/components/header/header_widget.dart';
import '/components/selection_option/selection_option_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'product_sale_testing_widget.dart' show ProductSaleTestingWidget;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductSaleTestingModel
    extends FlutterFlowModel<ProductSaleTestingWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - productSaleReport] action in productSaleTesting widget.
  List<dynamic>? productList;
  // Stores action output result for [Custom Action - productSaleReport] action in Container widget.
  List<dynamic>? res1;
  // Model for Header component.
  late HeaderModel headerModel;
  // Stores action output result for [Custom Action - scanPrinter] action in Text widget.
  bool? resDevice2;
  // Stores action output result for [Custom Action - scanPrinter] action in IconButton widget.
  bool? resDevice21;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  @override
  void dispose() {
    headerModel.dispose();
  }
}
