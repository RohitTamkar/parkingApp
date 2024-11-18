import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web_parking/nav_bar_web_parking/nav_bar_web_parking_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'web_edit_category_widget.dart' show WebEditCategoryWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WebEditCategoryModel extends FlutterFlowModel<WebEditCategoryWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBarWebParking component.
  late NavBarWebParkingModel navBarWebParkingModel;
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;

  @override
  void initState(BuildContext context) {
    navBarWebParkingModel = createModel(context, () => NavBarWebParkingModel());
  }

  @override
  void dispose() {
    navBarWebParkingModel.dispose();
    nameFocusNode?.dispose();
    nameTextController?.dispose();
  }
}
