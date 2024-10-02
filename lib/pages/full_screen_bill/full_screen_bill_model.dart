import '/backend/backend.dart';
import '/components/menu_drawer/menu_drawer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'full_screen_bill_widget.dart' show FullScreenBillWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FullScreenBillModel extends FlutterFlowModel<FullScreenBillWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - addToListCopy] action in Container widget.
  List<dynamic>? result1;
  // Stores action output result for [Custom Action - calSubTotal] action in Container widget.
  double? subTotal;
  // Stores action output result for [Custom Action - reduceQuantity] action in Container widget.
  List<dynamic>? res1;
  // Stores action output result for [Custom Action - addQuantity] action in Container widget.
  List<dynamic>? result2;
  // Stores action output result for [Custom Action - calSubTotal] action in Container widget.
  double? res4;
  // Model for MenuDrawer component.
  late MenuDrawerModel menuDrawerModel;

  @override
  void initState(BuildContext context) {
    menuDrawerModel = createModel(context, () => MenuDrawerModel());
  }

  @override
  void dispose() {
    menuDrawerModel.dispose();
  }
}
