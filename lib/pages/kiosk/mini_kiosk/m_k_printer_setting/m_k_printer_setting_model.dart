import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'dart:math' as math;
import 'm_k_printer_setting_widget.dart' show MKPrinterSettingWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MKPrinterSettingModel extends FlutterFlowModel<MKPrinterSettingWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Custom Action - scanPrinter] action in DropDown widget.
  bool? resultDevice2;
  // Stores action output result for [Custom Action - connectDevice] action in Container widget.
  bool? con;
  // Stores action output result for [Custom Action - newCustomAction] action in Container widget.
  List<dynamic>? selected;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
