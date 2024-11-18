import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web_parking/nav_bar_web_parking/nav_bar_web_parking_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'web_pass_details_widget.dart' show WebPassDetailsWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WebPassDetailsModel extends FlutterFlowModel<WebPassDetailsWidget> {
  ///  Local state fields for this page.

  PartyRecord? selectedParty;

  String selectedMessage = 'pass';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getCurrentMonth1] action in WebPassDetails widget.
  int? start;
  // Stores action output result for [Custom Action - getCurrentMonth1] action in WebPassDetails widget.
  int? end;
  // Model for NavBarWebParking component.
  late NavBarWebParkingModel navBarWebParkingModel;

  @override
  void initState(BuildContext context) {
    navBarWebParkingModel = createModel(context, () => NavBarWebParkingModel());
  }

  @override
  void dispose() {
    navBarWebParkingModel.dispose();
  }
}
