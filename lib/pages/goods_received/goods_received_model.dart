import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/acc_and_rej_qty/acc_and_rej_qty_widget.dart';
import '/components/menu_drawer/menu_drawer_widget.dart';
import '/components/reject_order_comment/reject_order_comment_widget.dart';
import '/components/rejection_details/rejection_details_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'goods_received_widget.dart' show GoodsReceivedWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GoodsReceivedModel extends FlutterFlowModel<GoodsReceivedWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Custom Action - docToJsonPurchace] action in Container widget.
  dynamic? jsonResp;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Custom Action - docToJsonPurchace] action in Container widget.
  dynamic? jsonRespGR;
  // Stores action output result for [Custom Action - docToJsonPurchace] action in Container widget.
  dynamic? jsonRespQc;
  // Stores action output result for [Custom Action - docToJsonPurchace] action in Container widget.
  dynamic? jsonRespSI;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Custom Action - docToJsonPurchace] action in Container widget.
  dynamic? jsonRespRej;
  // Stores action output result for [Custom Action - docToJsonPurchace] action in Container widget.
  dynamic? jsonRespFinal;
  // Model for MenuDrawer component.
  late MenuDrawerModel menuDrawerModel;

  @override
  void initState(BuildContext context) {
    menuDrawerModel = createModel(context, () => MenuDrawerModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    menuDrawerModel.dispose();
  }
}
