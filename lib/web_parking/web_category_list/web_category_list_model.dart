import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web_parking/nav_bar_web_parking/nav_bar_web_parking_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'web_category_list_widget.dart' show WebCategoryListWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WebCategoryListModel extends FlutterFlowModel<WebCategoryListWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBarWebParking component.
  late NavBarWebParkingModel navBarWebParkingModel;
  // Stores action output result for [Custom Action - genarateCategoryCode] action in Button widget.
  int? catcode;

  @override
  void initState(BuildContext context) {
    navBarWebParkingModel = createModel(context, () => NavBarWebParkingModel());
  }

  @override
  void dispose() {
    navBarWebParkingModel.dispose();
  }
}
