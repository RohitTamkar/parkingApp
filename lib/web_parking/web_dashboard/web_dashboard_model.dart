import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/web_parking/nav_bar_web_parking/nav_bar_web_parking_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'web_dashboard_widget.dart' show WebDashboardWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WebDashboardModel extends FlutterFlowModel<WebDashboardWidget> {
  ///  Local state fields for this page.

  double totalShiftSale = 0.0;

  ShiftRecord? shiftDoc;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - isValidShift] action in WebDashboard widget.
  bool? shiftExist;
  // Model for NavBarWebParking component.
  late NavBarWebParkingModel navBarWebParkingModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<ShiftRecord>? totalShift;
  // Stores action output result for [Custom Action - shiftTotalSale] action in Container widget.
  ShiftRecord? shiftdoc;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {
    navBarWebParkingModel = createModel(context, () => NavBarWebParkingModel());
  }

  @override
  void dispose() {
    navBarWebParkingModel.dispose();
  }
}
