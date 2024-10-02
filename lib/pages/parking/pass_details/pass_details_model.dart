import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'pass_details_widget.dart' show PassDetailsWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PassDetailsModel extends FlutterFlowModel<PassDetailsWidget> {
  ///  Local state fields for this page.

  PartyRecord? selectedParty;

  String selectedMessage = 'pass';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getCurrentMonth1] action in PassDetails widget.
  int? start;
  // Stores action output result for [Custom Action - getCurrentMonth1] action in PassDetails widget.
  int? end;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
