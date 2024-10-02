import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'appsetting_widget.dart' show AppsettingWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppsettingModel extends FlutterFlowModel<AppsettingWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for SwitchListTilecheckInOut widget.
  bool? switchListTilecheckInOutValue;
  // Stores action output result for [Custom Action - appSettingUpdate] action in SwitchListTilecheckInOut widget.
  List<AppSettingsStruct>? appsttingupdate;
  // Stores action output result for [Custom Action - appSettingUpdate] action in SwitchListTilecheckInOut widget.
  List<AppSettingsStruct>? appsttingupdateCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
