import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/categorypoup_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web_parking/nav_bar_web_parking/nav_bar_web_parking_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'web_add_category_widget.dart' show WebAddCategoryWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WebAddCategoryModel extends FlutterFlowModel<WebAddCategoryWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for NavBarWebParking component.
  late NavBarWebParkingModel navBarWebParkingModel;
  // State field(s) for TextFieldName widget.
  FocusNode? textFieldNameFocusNode;
  TextEditingController? textFieldNameTextController;
  String? Function(BuildContext, String?)? textFieldNameTextControllerValidator;
  // State field(s) for categoryNo widget.
  FocusNode? categoryNoFocusNode;
  TextEditingController? categoryNoTextController;
  String? Function(BuildContext, String?)? categoryNoTextControllerValidator;
  // Stores action output result for [Custom Action - checkDupCategory] action in Button widget.
  bool? dupRef;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CategoryRecord? catDoc;

  @override
  void initState(BuildContext context) {
    navBarWebParkingModel = createModel(context, () => NavBarWebParkingModel());
  }

  @override
  void dispose() {
    navBarWebParkingModel.dispose();
    textFieldNameFocusNode?.dispose();
    textFieldNameTextController?.dispose();

    categoryNoFocusNode?.dispose();
    categoryNoTextController?.dispose();
  }
}