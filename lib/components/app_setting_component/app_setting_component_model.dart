import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'app_setting_component_widget.dart' show AppSettingComponentWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppSettingComponentModel
    extends FlutterFlowModel<AppSettingComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for shiftEnd widget.
  bool? shiftEndValue;
  // Stores action output result for [Custom Action - appSettingUpdate] action in shiftEnd widget.
  List<AppSettingsStruct>? appsttingupdate;
  // Stores action output result for [Custom Action - appSettingUpdate] action in shiftEnd widget.
  List<AppSettingsStruct>? appsttingupdateCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
